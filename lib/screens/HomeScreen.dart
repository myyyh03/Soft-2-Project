import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:shopping_app/screens/HomeScreen.dart';
import 'package:shopping_app/components/navbar.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List imglist = [
    "Warm Jackets",
    "Black T-shirt",
    "Black pant",
    "Ladies Bags",
  ];
  List catlist = [
    "All",
    "Best Selling",
    "jackets",
    "shirts",
    "pants",
    "Bags",
  ];
=======
import 'package:shopping_app/components/navbar.dart';
import 'package:shopping_app/screens/JacketsPage.dart';
import 'package:shopping_app/screens/product_details.dart';
>>>>>>> a06e3dc7a0cc553d7bb34293b735e862e9b37f8d

import '../components/list.dart';
import 'BagsPage.dart';
import 'PantsPage.dart';
import 'ShirtsPage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: Color(0XFF3A3B3C),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.155,
                        decoration: BoxDecoration(
                          color: Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              "find your product",
                              style: TextStyle(fontSize: 20),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 25, top: 20),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/letters-label-wooden-background.jpg',
                      width: MediaQuery.of(context).size.width / 1.1,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < catlist.length; i++)
                          GestureDetector(
                            onTap: () {
                              // Navigate to different pages based on index
                              if (i == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => JacketsPage()),
                                );
                              } else if (i == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShirtsPage()),
                                );
                              }
                              else if (i == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PantsPage()),
                                );
                              }
                              else if (i == 4) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BagsPage()),
                                );
                              }

                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 18, right: 18, top: 10, bottom: 10),
                              margin: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: catlist[i] == "All"
                                    ? Color(0xfff44336)
                                    : Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(catlist[i]),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // Products









                GridView.count(

                  childAspectRatio: .5,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(products.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to details page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              name: products[index]["name"]!,
                              description: products[index]["description"]!,
                              imagePath: products[index]["imagePath"]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                products[index]["imagePath"]!,
                                width: MediaQuery.of(context).size.width,
                                height: 250, // Height of the image
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              products[index]["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            // Text(
                            //   products[index]["description"]!,
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //   ),
                            // ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Implement your add to cart functionality
                              },
                              child: Text("Add To Cart",style: TextStyle(color: Colors.blue),),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
<<<<<<< HEAD
        bottomNavigationBar: CustomBottomNavigationBar(),
=======
      ),
>>>>>>> a06e3dc7a0cc553d7bb34293b735e862e9b37f8d
    );
  }
}