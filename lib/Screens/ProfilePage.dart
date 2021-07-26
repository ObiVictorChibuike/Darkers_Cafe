import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  SharedPreferences prefs;
  String userEmail;
  String userNumber;
  String firstName;
  String lastName;


  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('Email');
      userNumber = prefs.get('PhoneNumber');
      firstName = prefs.get('FirstName');
      lastName = prefs.get('LastName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Icon(Icons.arrow_back_ios),
              title: Text('My Profile'),
              actions: [
                IconButton( icon: Icon(Icons.edit,color: Colors.white,),
                )
              ]
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(Icons.person,size: 85,color: Colors.red,),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NAME:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                            SizedBox(height: 5,),
                            Text("EMAIL ADDRESS:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("NUMBER:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Text('About',style:TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          color: Colors.white,
                          child: Container(
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              cursorColor: Colors.red,
                              cursorHeight: 25,
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: InputBorder.none,
                                hintText: ('   Bio'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text('Contact', style:Theme.of(context).textTheme.bodyText1,),
                    Row(),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
