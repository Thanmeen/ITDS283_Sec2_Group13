import 'package:flutter/material.dart';
import 'cart.dart'; // import ไฟล์ CartPage เพื่อใช้งานคลาส CartPage

class ConfirmPage extends StatelessWidget {
  final String name;
  final String address;
  final String city;
  final String postalCode;
  final String deliveryOption;
  final String paymentOption;

  ConfirmPage({
    required this.name,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.deliveryOption,
    required this.paymentOption,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONFIRM CHECK OUT'), // เปลี่ยน title เป็น 'CONFIRM CHECK OUT'
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Delivery Option
            Text(
              'Delivery Option',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(), // เส้นคั่น

            // Ship to address
            Text(
              'Ship to address',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Shipping: 50 Bath',
              style: TextStyle(fontSize: 16),
            ),
            // Shipping Address (ให้เปลี่ยนเป็นข้อมูลที่มาจากหน้า Cart)
            Text(
              'Shipping Address\n$name\n$address\n$city\n$postalCode',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                // ปุ่ม Edit ที่สามารถแก้ไขข้อมูล
                Navigator.pop(context); // นำกลับไปยังหน้า CheckoutPage
              },
              child: Text('Edit'),
            ),
            Divider(), // เส้นคั่น

            // 2. Payment Option
            Text(
              'Payment Option',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(), // เส้นคั่น

            // Credit Card
            Container(
              color: Colors.grey[200], // กำหนดสีพื้นหลัง
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Credit Card',
                      style: TextStyle(fontSize: 16),
                    ),
                    // Credit card number
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Please enter the credit card number.',
                      ),
                    ),
                    // Expiration date
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Month/Year',
                            ),
                          ),
                        ),
                        Icon(Icons.clear), // Icon X
                      ],
                    ),
                    // Security code
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Security code',
                      ),
                    ),
                    // ข้อความ We protect all your sensitive information with TLS (Transport Layer Security) encryption technology
                    Wrap(
                      children: [
                        Image.asset(
                          'assets/images/lock_icon.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'We protect all your sensitive information with TLS (Transport Layer Security) encryption technology',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Divider(), // เส้นคั่น

            // Order summary
            Text(
              'Order summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(), // เส้นคั่น

            // Old School Shirt
            Text('Old School Shirt x1  100 Bath'),
            Text('Shipping TBD'),
            Text('Estimated Tax TBD'),
            Divider(), // เส้นคั่น

            // Order Total
            Text('Order Total 100 Bath'),
            Divider(), // เส้นคั่น

            // PLACE ORDER button
            ElevatedButton(
              onPressed: () {
                // ปุ่ม PLACE ORDER
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // กำหนดสีพื้นหลังของปุ่มเป็นสีดำ
              ),
              child: Text(
                'PLACE ORDER',
                style: TextStyle(color: Colors.white), // กำหนดสีของตัวอักษรเป็นสีขาว
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // กำหนดสีพื้นหลังของ BottomAppBar เป็นสีขาว
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // ปุ่ม Cancel Order
              },
              child: Text(
                'Cancel Order',
                style: TextStyle(color: Colors.red), // กำหนดสีของตัวอักษรเป็นสีแดง
              ),
            ),
            TextButton(
              onPressed: () {
                // ปุ่ม Add more items
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart())); // เปิดหน้า MyCart
              },
              child: Text(
                'Add more items',
                style: TextStyle(color: Colors.black), // กำหนดสีของตัวอักษรเป็นสีดำ
              ),
            ),
          ],
        ),
      ),
    );
  }
}
