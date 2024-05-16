import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/database/database_handler.dart';
import 'package:shopping_app/database/tables_classes.dart';
import 'package:shopping_app/shared_pref.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isObsecurePassword = true;
    DataBaseHandler db = new DataBaseHandler();
    user? u;
    Future<user?>u_get()async{ u = await db.getUserByID(1);print(u?.name);}
  @override
  build(BuildContext context) {
    u_get();
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Your profile'),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
            backgroundColor: Colors.blue,
          ),
          body: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmLcG1vLtL7UL-KRmLrzoFlqWlsVG8_cJShmGlWYhZXSiVDhM&s'),
                            ),
                          ),
                        ),
                        Positioned(
                          width: 0,
                          height: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                color: Colors.blue),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BuildTextField('Name', '${u?.name}', false),
                  BuildTextField('Email', '${u?.mail}', false),
                  BuildTextField('Password','${u?.pass}' , true),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget BuildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObsecurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      isObsecurePassword = !isObsecurePassword;
                    });
                  },
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
