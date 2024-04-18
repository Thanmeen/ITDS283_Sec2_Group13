
import 'package:flutter/material.dart';
import 'package:pannm/Sellpage/Topwomenpage.dart';
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
      home: Topmenpage(),
    );
  }
}

class Topmenpage extends StatefulWidget {
  @override
  _TopmenpageState createState() => _TopmenpageState();
}

class _TopmenpageState extends State<Topmenpage> with SingleTickerProviderStateMixin {
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
        backgroundColor: Colors.black, // เพิ่มสีดำให้กับพื้นหลังของ AppBar
        elevation: 0, // เพื่อลบเงาที่แสดง
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: Icon(Icons.sort),
                onPressed: () {
                  // การคลิกที่ไอคอนเรียงลำดับ
                },
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // การคลิกที่ไอคอนรถเข็น
                },
              ),
            ),
          ],
        ),
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
          Container(
            child: Center(
              child: ProductMenPage(), // เชื่อมโยงกับหน้า ProductMenPage
            ),
          ),
          Container(
            child: Center(
              child: ProductWomenPage(), // เชื่อมโยงกับหน้า ProductWomenPage
            ),
          ),
          Container(
            child: Center(
              child: ProductKidPage(), // เชื่อมโยงกับหน้า ProductKidPage
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
  final String IconUrl;

  Product({required this.name, required this.imageUrl, required this.price,required this.IconUrl});
}

class ProductMenPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Black hoodie',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228032152848039966/blackhood.jpg?ex=662a9110&is=66181c10&hm=9320b66f22894b4341d2ee714aa2285122a7bfdbec962d8cced1dd202a63033d&',
      price: 350,
      IconUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1229844277958410250/add.png?ex=663128bd&is=661eb3bd&hm=68066cdf998f175c3a401eadf1431188212822055e92897d7bf35c3d1a3f7f26&'
    ),
    Product(
      name: 'White T-shirt',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228031289614139623/white.png?ex=662a9043&is=66181b43&hm=b845443135c3ce22170aafe834b81c37e5deacbf0a864022d8e76320e9d67420&',
      price: 200,
      IconUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1229844277958410250/add.png?ex=663128bd&is=661eb3bd&hm=68066cdf998f175c3a401eadf1431188212822055e92897d7bf35c3d1a3f7f26&'
    ),
    Product(
      name: 'Hawaii shirt', 
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228031289299304458/hawaii.jpg?ex=662a9043&is=66181b43&hm=338762e07290669bbf8169098384478e76fcc6d3d454974ea8e5a2ae976ea739&', 
      price: 199,
      IconUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1229844277958410250/add.png?ex=663128bd&is=661eb3bd&hm=68066cdf998f175c3a401eadf1431188212822055e92897d7bf35c3d1a3f7f26&')
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
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                SizedBox(height: 8),
                 // ระยะห่างระหว่างรูปภาพและข้อความ
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                
                Image.network(product.IconUrl,
                width: 24,
                height: 24,)
                ]),
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

