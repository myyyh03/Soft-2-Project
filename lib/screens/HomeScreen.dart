import 'package:flutter/material.dart';
import 'package:shopping_app/screens/HomeScreen.dart';
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0XFF3A3B3C),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
          padding: EdgeInsets.only(top:20,left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //for search container
                    Container(
                      width: MediaQuery.of(context).size.width/1.5,

                      decoration: BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text("find your product",style: TextStyle(fontSize: 20),),
                          border: InputBorder.none,
                          prefixIcon:Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ) ,
                        ),
                      ),
                    ),
                    //for ring icon container
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:Icon(
                        Icons.notification_important,
                        size:30,
                        color: Colors.blue,
                      ) ,
                    ),
                ],
                ),
              ),
           //photo for big sales
                   Container(
                     margin: EdgeInsets.only(right: 25,top: 20),
                     alignment: Alignment.center,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(30),
                       child: Image.asset('assets/images/letters-label-wooden-background.jpg',
                       width: MediaQuery.of(context).size.width/1.1,
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
                      for(int i=0;i<catlist.length;i++)
                          Container(
                    padding: EdgeInsets.only(left: 18,right: 18,top: 10,bottom: 10),
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                             color:catlist[i]=="All"
                             ? Color(0xfff44336) :Color(0xFFF7F8FA),
                            borderRadius: BorderRadius.circular(15),
                          ),
                            child: Text(catlist[i]),
                          ),

                    ],
                  ),

                ),
              ),

            ],
          ),
          ),
          ),
        ),

    );
  }
}

