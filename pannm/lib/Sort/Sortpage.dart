import 'package:flutter/material.dart';
import 'package:pannm/HomePage/HomePage.dart';
import '../navbar/NavBar.dart';
void main() {
  runApp(Sort());
}

class Sort extends StatefulWidget {
  @override
  SortState createState() => SortState();
}

class SortState extends State<Sort> {
  int _selectedOptionRow1 = 1;
  int _selectedOptionRow2 = 1;
  int _selectedOptionRow3 = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          
          centerTitle: true,
          title: const Text(
            'Sort & Filter',
            style: TextStyle(
              fontFamily: 'Ibarra Real Nova',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen()));
    
     },
),

          
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort by:',
                style: TextStyle(
                  fontFamily: 'Ibarra Real Nova',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedOptionRow1,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionRow1 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Newest',
                    style: TextStyle(
                      fontFamily: 'Ibarra Real Nova',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _selectedOptionRow1,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionRow1 = value as int;
                      });
                    },
                  ),
                  Text(
                    'A - Z',
                    style: TextStyle(
                      fontFamily: 'Ibarra Real Nova',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              Text('Filter by',
                  style: TextStyle(
                  fontFamily: 'Ibarra Real Nova',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 16),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedOptionRow2,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionRow2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Shirt',
                    style: TextStyle(
                      fontFamily: 'Ibarra Real Nova',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _selectedOptionRow2,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionRow2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'T-Shirt',
                    style: TextStyle(
                      fontFamily: 'Ibarra Real Nova',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _selectedOptionRow2,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionRow2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'White',
                    style: TextStyle(
                      fontFamily: 'Ibarra Real Nova',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 4,
                    groupValue: _selectedOptionRow2,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionRow2 = value as int;
                      });
                    },
                  ),
                  Text(
                    'Black',
                    style: TextStyle(
                      fontFamily: 'Ibarra Real Nova',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
                
            ],
          ),
        ),
      ),
      
    );
    
  }
}
