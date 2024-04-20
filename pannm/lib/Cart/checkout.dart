import 'package:flutter/material.dart';
import 'confirm.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String name = '';
  String address = '';
  String city = '';
  String postalCode = '';
  String deliveryOption = '';
  String paymentOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Check Out',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '1. Delivery Option',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  setState(() {
                    deliveryOption = 'ship';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: deliveryOption == 'ship' ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Ship to address',
                    style: TextStyle(
                      color: deliveryOption == 'ship' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (deliveryOption == 'ship') ...[
                SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      postalCode = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Postal Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              SizedBox(height: 16.0),
              Divider(height: 1.0, color: Colors.grey),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  setState(() {
                    deliveryOption = 'store';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: deliveryOption == 'store' ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Pick up at store',
                    style: TextStyle(
                      color: deliveryOption == 'store' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Payment Option',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentOption = 'creditCard';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: paymentOption == 'creditCard' ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Credit Card',
                    style: TextStyle(
                      color: paymentOption == 'creditCard' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentOption = 'paypal';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: paymentOption == 'paypal' ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'PayPal',
                    style: TextStyle(
                      color: paymentOption == 'paypal' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentOption = 'cash';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: paymentOption == 'cash' ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Cash (Only For Self Pickup)',
                    style: TextStyle(
                      color: paymentOption == 'cash' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/lock_icon.png',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'We protect all your sensitive information with TLS',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    maxLines: null,
                  ),
                  
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (deliveryOption == 'ship' &&
                      name.isNotEmpty &&
                      address.isNotEmpty &&
                      city.isNotEmpty &&
                      postalCode.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmPage(
                          name: name,
                          address: address,
                          city: city,
                          postalCode: postalCode,
                          deliveryOption: deliveryOption,
                          paymentOption: paymentOption,
                        ),
                      ),
                    );
                  } else if (deliveryOption == 'store') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmPage(
                          name: '',
                          address: '',
                          city: '',
                          postalCode: '',
                          deliveryOption: deliveryOption,
                          paymentOption: paymentOption,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('กรอกข้อมูลให้ครบจ้า.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // ส่วนของการแสดงข้อความว่าให้กรอกข้อมูล ship to address อะไรไปบ้สง
              if (deliveryOption == 'ship' &&
                  (name.isNotEmpty || address.isNotEmpty || city.isNotEmpty || postalCode.isNotEmpty))
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'กรุณากรอกข้อมูลที่อยู่สำหรับการจัดส่ง',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page.'),
      ),
    );
  }
}
