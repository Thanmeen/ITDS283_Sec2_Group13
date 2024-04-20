
import 'package:pannm/Sort/Sortpage.dart';
import '../Widget/ClassRoutes/app_routes.dart';
import '../navbar/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:pannm/sellpage/Topmenpage.dart';
import 'package:pannm/sellpage/Topwomenpage.dart';
import 'package:pannm/sellpage/kidpage.dart';

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
      home: Toppage(),
    );
  }
}

class Toppage extends StatefulWidget {
  @override
  _ToppageState createState() => _ToppageState();
}

class _ToppageState extends State<Toppage> with SingleTickerProviderStateMixin {
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
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sort() ));
          },
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
      bottomNavigationBar: NavBar(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Center(
              child: ProductTopPage(),
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
  final String IconUrl;

  Product({required this.name, required this.imageUrl, required this.price,required this.IconUrl});
}

class ProductTopPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Black hoodie',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228032152848039966/blackhood.jpg?ex=662a9110&is=66181c10&hm=9320b66f22894b4341d2ee714aa2285122a7bfdbec962d8cced1dd202a63033d&',
      price: 350,
      IconUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1229844277958410250/add.png?ex=663128bd&is=661eb3bd&hm=68066cdf998f175c3a401eadf1431188212822055e92897d7bf35c3d1a3f7f26&'
    ),
    Product(
      name: 'Calvin Klein Bra',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228051985962500179/ck.jpg?ex=662aa389&is=66182e89&hm=c0b72a3bf453d5adf3dddfe010fb532dc1f2cdec811a345edf0f8e70fcd7d6b0&',
      price: 500,
      IconUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1229844277958410250/add.png?ex=663128bd&is=661eb3bd&hm=68066cdf998f175c3a401eadf1431188212822055e92897d7bf35c3d1a3f7f26&'
    ),
    Product(
      name: 'Red kid T-shirt', 
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1228055488822906941/Red.png?ex=662aa6cc&is=661831cc&hm=f711e12c5e6333af025d1d6fc17fce546dca945ff953c57f1f3784efef67874e&',
      price: 200,
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

Widget NavBar(BuildContext context) {
  return CustomBottomBar(
    onChanged: (BottomBarEnum type) {
      switch (type) {
        case BottomBarEnum.Home:
          Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
          break;
        case BottomBarEnum.Menu:
          Navigator.of(context).pushReplacementNamed(AppRoutes.setting);
          break;
        case BottomBarEnum.Notification:
          Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
          break;
        case BottomBarEnum.Contractus:
          Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
         break;
        case BottomBarEnum.Profile:
         Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
        break;
         default:
          break;
      }
    },
  );
}