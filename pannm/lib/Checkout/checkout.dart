import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Delivery Option',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(
                    'Ship to address',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    'Shipping: 50 Bath',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle shipping to address
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(
                    'Pick up at store',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    'Shipping: Free',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle pick up at store
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Handle edit shipping address
                  },
                  child: Text('Edit'),
                ),
              ),
              SizedBox(height: 40),
              Text(
                '2. Payment Option',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(
                    'Credit Card',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle credit card payment
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(
                    'PayPal',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle PayPal payment
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(
                    'Cash (Only For Self Pickup)',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle cash payment
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Image.asset('assets/images/lock_icon.png', width: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'We protect all your sensitive information with TLS (Transport Layer Security) encryption technology',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmCheckoutPage()),
                  );
                },
                child: SizedBox.expand(
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 24), // Make the text larger
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONFIRM CHECK OUT'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit card number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Please enter the credit card number.',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Expiration date',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Month',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Year',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Security code',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Security Code here',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/images/lock_icon.png', width: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'We protect all your sensitive information with TLS (Transport Layer Security) encryption technology',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Order summary',
                style: Theme.of(context).textTheme.headline6,
              ),
              ListTile(
                title: Text('Old School Shirt x2'),
              ),
              ListTile(
                title: Text('Shipping'),
                trailing: Text('100 Bath'),
              ),
              ListTile(
                title: Text('Estimated Tax'),
                trailing: Text('TBD'),
              ),
              ListTile(
                title: Text('1 Item(s)'),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Order Total',
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Text(
                  '100 Bath',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle place order
                },
                child: Text('PLACE ORDER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
