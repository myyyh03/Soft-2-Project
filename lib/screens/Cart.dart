import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/database/database_handler.dart';
import 'package:shopping_app/database/tables_classes.dart';
import 'package:shopping_app/screens/product_details.dart';
import 'package:shopping_app/shared_pref.dart';

class Cart extends StatefulWidget {
  //const Cart({super.key});

  @override
  _CartState createState() => _CartState();
  
}


class _CartState extends State<Cart>{

    DataBaseHandler db = new DataBaseHandler();
    List<int>ids = [];
    List<cart>mp = [];
    Future<void>get_mp()async{mp = await db!.getAllcart(sharedPref.id!);}

  @override
  build(BuildContext context) async {
    get_mp();
    for(cart c in mp){
      ids.add(c.productID!);
    }
    setState(() {
      1;
    });
    //db?.get_db();
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart' , ),),
      body: Container(
        child: FutureBuilder(
          future: db!.getProductsById(ids),
          builder: (BuildContext context , AsyncSnapshot<List<product>> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return GridView.count(
                  childAspectRatio: .4,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  //physics: NeverScrollableScrollPhysics(),
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to details page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              name: snapshot.data![index].name,
                              description: snapshot.data![index].desc,
                              imagePath: snapshot.data![index].image,
                              price: "${snapshot.data?[index].price} EGP",
                            ),
                          ), 
                        );
                      },
                      child: Container(
                        width: 200,
                        //color: isDarkMode ? Colors.grey[800] : Colors.white,
                        margin: EdgeInsets.only(top: 10,left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                snapshot.data![index].image,
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data![index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                //color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                                "${snapshot.data?[index].price} EGP",
                                style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Implement add to cart function
                              },
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}