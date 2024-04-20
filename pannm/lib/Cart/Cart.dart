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
          title: const Text(
            'CART',
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.attach_money),
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
                      const Text(
                        'You are 100 Bath away from free standard shipping.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('Old School Shirt'),
                      const Text('ProductID: 41452'),
                      const Text('Size: XL'),
                      const Text('100 Bath'),
                      const SizedBox(height: 8),
                      const Text('Quantity'),
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
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // รหัสสำหรับการลบสินค้า
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
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Order summary 2 Item(s)',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text('Old School Shirt x2 200 Bath'),
              const SizedBox(height: 8),
              const Text('Shipping TBD'),
              const Text('Estimated Tax TBD'),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Order Total 200 Bath',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // รหัสสำหรับการสั่งซื้อ
                },
                child: const Text('CHECKOUT'),
                style: ElevatedButton.styleFrom(
                  // primary: Colors.black,
                  // onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            color: Colors.grey[200],
            child: const Center(
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
