

import 'package:flutter/material.dart';

import 'package:pannm/Sellpage/Topmenpage.dart';
import 'package:pannm/Sellpage/kidpage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Topwomenpage(),
    );
  }
}

class Topwomenpage extends StatefulWidget {
  @override
  _TopwomenpageState createState() => _TopwomenpageState();
}

class _TopwomenpageState extends State<Topwomenpage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.sort),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 253, 0, 0),
          labelColor: Colors.red,
          tabs: [
            Tab(
              text: 'TOP',                          
            ),
            Tab(
              text: 'MEN',
            ),
            Tab(
              text: 'WOMEN',
            ),
            Tab(
              text: 'KIDS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Center(
              child: Text('TOP'),
            ),

          ),
          
          // เพิ่มหน้าอื่น ๆ ที่ต้องการเชื่อมโยงที่นี่
          Container(
            child: Center(
              child: ProductMenPage(),
            ),
          ),
          Container(
            
            child: Center(
              child: ProductWomenPage(),
            ),
          ),
          Container(
            
            child: Center(
              child: ProductKidPage(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}



class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductWomenPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Calvin Klein Bra',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228051985962500179/ck.jpg?ex=662aa389&is=66182e89&hm=c0b72a3bf453d5adf3dddfe010fb532dc1f2cdec811a345edf0f8e70fcd7d6b0&',
      price: 500,
    ),
    Product(
      name: 'Cargo pant',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228051985656320020/cargo.jpg?ex=662aa389&is=66182e89&hm=dc5a73bc28da67686ac1f2ab659c5751e02e76cd427bc1c3c0945647731c932a&',
      price: 250,
    ),
    Product(
      name: 'Black Crop shirt', 
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228051986264625154/crop.jpg?ex=662aa389&is=66182e89&hm=fd79142b194492c8b4eaf896c9362627ed3ba28b7b0f5dfa78211173f81c1207&', 
      price: 150)
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  product.imageUrl,
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8), // ระยะห่างระหว่างรูปภาพและข้อความ
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\฿${product.price.toStringAsFixed(2)}',
                  style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

