import 'package:flutter/material.dart';

import 'Cart.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final String description;
  final String imagePath;
  final String price;

  ProductDetailsPage({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.imagePath,
            width: MediaQuery.of(context).size.width/1.1,
            height: 500, // Adjust height as needed
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.price,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (itemCount > 0) {
                      itemCount--;
                    }
                  });
                },
              ),
              Text(
                itemCount.toString(),
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    itemCount++;
                  });
                },
              ),
              SizedBox(height:5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
                child: Text("Cart",style: TextStyle(color: Colors.blue),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
