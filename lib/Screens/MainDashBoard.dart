import 'dart:io';
import 'package:amat_foodies/First_Row_Items.dart';
import 'package:amat_foodies/Models/DrawerListTile.dart';
import 'package:amat_foodies/Models/DrawerSwitchButton.dart';
import 'package:amat_foodies/Models/theme_provider.dart';
import 'package:amat_foodies/Second_Row_Items.dart';
import 'package:amat_foodies/SliderScreen.dart';
import 'package:amat_foodies/Third_Row_Items.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'ProfilePage.dart';

class MainDashBoard extends StatefulWidget {
  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  File _imageFile;
  final picker = ImagePicker();
  String _imagePath;

  //Method to Fetch image from the gallery or camera
  _pickImage(ImageSource source) async {
    final selected = await picker.getImage(
      source: source,
      maxWidth: 200.0,
      maxHeight: 300.0,
    );
    if (selected != null) {
      saveImage(selected.path);
      loadImage();
      setState(() {});
    }
  }

  void saveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('Imagepath', path);
  }

  void loadImage() async {
    SharedPreferences loadImage = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = loadImage.getString('Imagepath');
    });
  }

  // List storyList = [
  //   {
  //     "name": "Novac",
  //     "imageUrl": "https://static.toiimg.com/photo/72975551.cms",
  //   },
  //   {
  //     "name": "Derick",
  //     "imageUrl": "https://static.toiimg.com/photo/72975551.cms",
  //   },
  //   {
  //     "name": "Mevis",
  //     "imageUrl": "https://static.toiimg.com/photo/72975551.cms",
  //   },
  //   {
  //     "name": "Emannual",
  //     "imageUrl": "https://static.toiimg.com/photo/72975551.cms",
  //   },
  //   {
  //     "name": "Gracy",
  //     "imageUrl": "https://static.toiimg.com/photo/72975551.cms",
  //   },
  //   {
  //     "name": "Robert",
  //     "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
  //   },
  // ];

  // List<Widget> _widgetOptions = <Widget>[
  //
  //   Text(
  //     'Index 1: Profile',
  //   ),
  //   Text(
  //     'Index 2: Home',
  //   ),
  //   Text(
  //     'Index 3: Shopping Cart',
  //   ),
  //   Text(
  //     'Index 4: Wallet',
  //   ),
  // ];

  //Alert Dialog for picking profile picture
  _pickPicture(mCtx) {
    return showDialog(
        context: mCtx,
        builder: (context) {
          return SimpleDialog(
            title: Center(
              child: Text(
                'Upload Profile Image',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.red),
              ),
            ),
            children: [
              SimpleDialogOption(
                child: Center(
                  child: Text('Capture with Camera'),
                ),
                onPressed: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: Center(
                  child: Text('Select from gallery'),
                ),
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: Center(
                  child: Text('Cancel'),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  SharedPreferences prefs;
  String userEmail;
  String userNumber;
  String userName;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    loadImage();
  }

  void fetchUserData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('Email');
      userNumber = prefs.getString('PhoneNumber');
      userName = prefs.getString('FirstName');
    });
  }

  void clearImage() async {
    SharedPreferences loadImage = await SharedPreferences.getInstance();
    await loadImage.remove('Imagepath');
  }

  _logOut() {
    clearImage();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => SliderScreen()));
  }

  //Alert dialog for Signing Out
  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("Cancel"),
    );
    Widget continueButton = TextButton(
      onPressed: () {
        _logOut();
      },
      child: Text("Continue"),
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        "Sign Out",
        style: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 25, color: Colors.red),
      ),
      content: Text(
          "If you continue, you will be logged out of AmatFoodies. Are you sure you want to continue?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _getEmail() {
    return Text(
      '${prefs.getString('Email')}',
      style: TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    );
  }

  _getPhoneNumber() {
    return Text(
      '${prefs.getString('PhoneNumber')}',
      style: TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    );
  }

  _getName() {
    return Text(
      '${prefs.getString('Name')}',
      style: TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    );
  }

  int _selectedIndex = 0;
  Widget getwidget() {
    if (_selectedIndex == 0) {
      return buildHome();
    } else if (_selectedIndex == 1) {
      return buildHome();
    }
    if (_selectedIndex == 2) {
      return buildHome();
    }
    if (_selectedIndex == 3) {
      return buildHome();
    }
    if (_selectedIndex == 4) {
      return buildHome();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildHome() {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'What is your favourite food?',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(firstList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        width: 130,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/loading_image.gif',
                                          image: firstList[index]['imageUrl'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Color(0xFFe9eaec),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              cursorHeight: 20,
                              cursorColor: Colors.red,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Color(0xFF000000).withOpacity(0.5),
                                  ),
                                  hintText: "      Search Specific food",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Text(
                              "Most Popular",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Spacer(),
                            Text("View all"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(secondList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                width: 280,
                                height: 140,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: Container(
                                              width: 120,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/loading_image.gif',
                                                image: secondList[index]
                                                    ['imageUrl'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Swallow",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Spacer(),
                                        Text(
                                          "SOUP",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          "Nigerian native soups\nPlace your demand now!",
                                          //overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 8,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Quantity:",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            _buildButton2()
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          "#100",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        _buildButton1(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Text(
                              "All The Dishes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Spacer(),
                            Text("View all"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(thirdList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/loading_image.gif',
                                          image: thirdList[index]['imageUrl'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })),
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildButton1() => Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Container(
          height: 15,
          width: 70,
          child: Center(
              child: Text(
            "Order now",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
        ),
      );

  _buildButton2() => Padding(
        padding: const EdgeInsets.only(right: 2, bottom: 30),
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            theme: notifier.darkTheme ? dark : light,
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                     backgroundColor: Colors.red,
                    centerTitle: true,
                    elevation: 10,
                    title: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "DARKARS \n",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "       Cafe",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ]),
                    )),
                body: getwidget(),
                bottomNavigationBar: BottomNavigationBar(
                  showUnselectedLabels: true,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.star_rounded),
                      label: 'Favorite',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'School',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_balance_wallet),
                      label: 'Wallet',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.black,
                  onTap: _onItemTapped,
                ),
                drawer: Drawer(
                    elevation: 16.0,
                    child: ListView(
                      children: [
                        DrawerHeader(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.red,
                                  Colors.red,
                                ],
                              ),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  InkWell(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 45,
                                      child: _imagePath == null
                                          ? Icon(
                                              Icons.camera_alt_rounded,
                                              size: 70,
                                              color: Colors.red,
                                            )
                                          : null,
                                      backgroundImage: _imagePath != null
                                          ? FileImage(File(_imagePath))
                                          : null,
                                    ),
                                    onTap: () => _pickPicture(context),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  _getName(),
                                  SizedBox(height: 2),
                                  _getEmail(),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  _getPhoneNumber(),
                                ],
                              ),
                            )),
                        customListTile(
                            Icons.person,
                            'Profile',
                            () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                  )
                                }),
                        Divider(),
                        customListTile(
                            Icons.notifications, 'Notification', () => {}),
                        Divider(),
                        customListTile(Icons.settings, 'Settings', () => {}),
                        Divider(),
                        customListTile(Icons.logout, 'Logout',
                            () => {showAlertDialog(context)}),
                        Divider(),
                        customSwitchButton(Icons.nightlight_round, 'Dark Mode'),
                        // Consumer<ThemeNotifier>(
                        //     builder: (context, notifier, child) => SwitchListTile(
                        //       title: Text('Dark Mode'),
                        //       onChanged: (value) {
                        //         notifier.toggleTheme();
                        //       },
                        //       value: notifier.darkTheme,
                        //     )
                        // ),
                      ],
                    )),
              ),
            ),
          );
        }));
  }
}
