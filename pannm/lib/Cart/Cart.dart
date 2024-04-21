import 'package:flutter/material.dart';
import '../Widget/ClassRoutes/app_routes.dart';
import 'checkout.dart'; // import checkout.dart ที่เราสร้างไว้

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key); // แก้ไขตรงนี้

  @override
  Widget build(BuildContext context) {
    return _MyCart(); // แก้ไขตรงนี้
  }
}

class _MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<_MyCart> {
  int _quantity = 1;
  int _totalPrice = 100; // ราคาเริ่มต้น
  bool _itemSelected = true; // เพิ่มตัวแปรเก็บว่าสินค้าถูกเลือกหรือไม่

  void _updateTotalPrice(int? value) {
    if (value != null) {
      setState(() {
        _quantity = value;
        _totalPrice = _quantity * 100; // 100 บาทต่อชิ้น
      });
    }
  }

  void _removeItem() {
    setState(() {
      // เมื่อกด remove ให้เปลี่ยนค่า _itemSelected เป็น false เพื่อซ่อนสินค้าทิ้งไป
      _itemSelected = false;
      // ล้างค่าราคาสินค้าให้เป็น 0 เมื่อสินค้าถูกลบทิ้ง
      _totalPrice = 0;
      // ล้างจำนวนสินค้าให้เป็น 0 เมื่อสินค้าถูกลบทิ้ง
      _quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar background color to black
        centerTitle: true, // Center align the title
        title: const Text(
          'CART',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Image.asset('assets/images/PannmLogo.PNG', width: 24, height: 24),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _totalPrice >= 300 ? 'You Just got free standard shipping.' : 'You are ${300 - _totalPrice} bath away from free standard shipping',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.close), // ใช้ไอคอน close
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homePage); // เมื่อกดปุ่มให้ปิดหน้าจอนี้
            },
          ),
        ],

        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2), // กำหนดความสูงของเส้น
          child: Divider(
            height: 2,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _itemSelected // เช็คว่าสินค้าถูกเลือกหรือไม่
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _totalPrice >= 300 ? 'You Just got free standard shipping.' : 'You are ${300 - _totalPrice} bath away from free standard shipping',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                            leading: _itemSelected ? Image.asset('assets/images/img_39816ab5_01a0_4.png', width: 50, height: 50) : null, // รูปสินค้า
                            title: _itemSelected ? const Text('Old School Shirt', style: TextStyle(color: Colors.white)) : null, // Set text color to white
                            subtitle: _itemSelected ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('ProductID: 41452'),
                                const Text('Size: XL'),
                                Text('$_totalPrice Bath'), // แสดงราคารวม
                              ],
                            ) : null,
                            trailing: _itemSelected ? DropdownButton<int>(
                              value: _quantity,
                              onChanged: (value) {
                                _updateTotalPrice(value); // อัพเดทราคารวมเมื่อมีการเลือกจำนวนสินค้า
                              },
                              items: List.generate(4, (index) => index + 1)
                                  .map((value) => DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      ))
                                  .toList(),
                            ) : null,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              _removeItem(); // ให้เมื่อกด remove สินค้าที่เลือก
                            },
                            child: const Text('Remove'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // กำหนดสีพื้นหลังของปุ่ม
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    thickness: 2, // กำหนดความหนาของเส้นเป็น 2 pixel
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Order summary ${_itemSelected ? _quantity : 0} Item(s)',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text('${_itemSelected ? 'Old School Shirt x$_quantity $_totalPrice' : '0'} Bath'),
                  const SizedBox(height: 8),
                  const Text('Shipping TBD'),
                  const Text('Estimated Tax TBD'),
                  const SizedBox(height: 16),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Order Total $_totalPrice Bath',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    child: const Text('CHECKOUT', style: TextStyle(color: Colors.white)), // Set text color to white
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Set background color to black
                    ),
                  ),
                ],
              )
            : const SizedBox(), // ถ้าไม่เลือกสินค้าให้แสดงช่องว่าง
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // กำหนดสีพื้นหลังของ BottomAppBar เป็นสีดำ
        child: Container(
          height: 50,
          child: const Center(
            child: Text(
              'Get FREE shipping with order 300+ Bath OR Pick your order At Store',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
