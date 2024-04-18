
import '../navbar/NavBar.dart';
import 'package:flutter/material.dart';

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
      home: Topdealpage(),
    );
  }
}

class Topdealpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // จำนวนแท็บ
      child: Scaffold(
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
          // bottom: TabBar(
          //   tabs: [
          //     Tab(
          //       child: Text(
          //         'Today Special Deal',
          //         style: TextStyle(
          //           color: Colors.white, 
          //           fontSize: 14, 
          //           fontWeight: FontWeight.bold, 
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
        bottomNavigationBar: NavBar(context),
        body: Container(
          alignment: Alignment.center,
          child: Column
        (
          children: [
            Text(
              'Today Special Deal',
              style: TextStyle(
                fontFamily: 'Hind',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Expanded(child: ProductTopdealPage(),
            )
            
          ],
          
          
        ),)
      ),
    );
  }
}


class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductTopdealPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Blue Shirt',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1226935166174232639/Tshirt.png?ex=6626936a&is=66141e6a&hm=a8ef44b137d711745547b83d080b0fcffd381d1443ea2d8c07d810dd1826e9ac&',
      price: 100,
    ),
    Product(
      name: 'Jeans Shirt',
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1226941236758183976/jeans.png?ex=66269912&is=66142412&hm=2e7934e598bc06b817922b80df98cb11701c19fed0eeb1817fad51b0aec47407&',
      price: 100,
    ),
    Product(
      name: 'Black Shirt', 
      imageUrl: 'https://cdn.discordapp.com/attachments/1161038713866948719/1226941236460650566/black.jpg?ex=66269912&is=66142412&hm=e905c45fa36f1ccd9db2c3e8758ca1353b3a9c07339d7d6b7ae125389d644774&', 
      price: 100)
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

Widget NavBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }