import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CART',
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.attach_money),
              onPressed: () {
                // รหัสสำหรับการประมวลผลเมื่อคลิกที่เครื่องหมายกากบาท
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                        'You are 100 Bath away from free standard shipping.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Old School Shirt'),
                      Text('ProductID: 41452'),
                      Text('Size: XL'),
                      Text('100 Bath'),
                      SizedBox(height: 8),
                      Text('Quantity'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 1; i <= 4; i++)
                            ElevatedButton(
                              onPressed: () {
                                // รหัสสำหรับการเลือกปริมาณสินค้า
                              },
                              child: Text('$i'),
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // รหัสสำหรับการลบสินค้า
                        },
                        child: Text('Remove'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // กำหนดสีพื้นหลังของปุ่ม
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Order summary 2 Item(s)',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text('Old School Shirt x2 200 Bath'),
              SizedBox(height: 8),
              Text('Shipping TBD'),
              Text('Estimated Tax TBD'),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Order Total 200 Bath',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // รหัสสำหรับการสั่งซื้อ
                },
                child: Text('CHECKOUT'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            color: Colors.grey[200],
            child: Center(
              child: Text(
                'Get FREE shipping with order 300+ Bath OR Pick your order At Store',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
