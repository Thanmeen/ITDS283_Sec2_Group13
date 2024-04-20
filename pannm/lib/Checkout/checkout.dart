import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Delivery Option',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: const Text(
                    'Ship to address',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: const Text(
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
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: const Text(
                    'Pick up at store',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: const Text(
                    'Shipping: Free',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle pick up at store
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Handle edit shipping address
                  },
                  child: const Text('Edit'),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                '2. Payment Option',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: const Text(
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
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: const Text(
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
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: const Text(
                    'Cash (Only For Self Pickup)',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle cash payment
                  },
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Image.asset('assets/images/lock_icon.png', width: 30),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'We protect all your sensitive information with TLS (Transport Layer Security) encryption technology',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConfirmCheckoutPage()),
                  );
                },
                child: const SizedBox.expand(
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
  const ConfirmCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFIRM CHECK OUT'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit card number',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Please enter the credit card number.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Expiration date',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Month',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Year',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Security code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Security Code here',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/images/lock_icon.png', width: 30),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'We protect all your sensitive information with TLS (Transport Layer Security) encryption technology',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Order summary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ListTile(
                title: Text('Old School Shirt x2'),
              ),
              const ListTile(
                title: Text('Shipping'),
                trailing: Text('100 Bath'),
              ),
              const ListTile(
                title: Text('Estimated Tax'),
                trailing: Text('TBD'),
              ),
              const ListTile(
                title: Text('1 Item(s)'),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Order Total',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: Text(
                  '100 Bath',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle place order
                },
                child: const Text('PLACE ORDER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
