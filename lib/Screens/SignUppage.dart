import 'package:amat_foodies/Screens/LoginPage.dart';
import 'package:amat_foodies/Screens/MainDashBoard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey <ScaffoldState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _checkBox = false;
  bool _isObscure = true;
  bool userdata;

  SharedPreferences prefs;


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }


  _buildFirstName() => Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 5,
      child: Container(
        child: TextFormField(
            autofocus: false,
            style: TextStyle(letterSpacing: 0.2),
            cursorColor: Colors.black,
            textCapitalization: TextCapitalization.words,
            cursorHeight: 25,
            cursorWidth: 2,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: _firstNameController,
            decoration: new InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black54,
              ),
              hintText: ('First Name'),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return "Please Provide your First Name";
              }else {
                return null;
              }
            }),
      ),
    ),
  );

  _buildLastName() => Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 5,
      child: Container(
        child: TextFormField(
            autofocus: false,
            style: TextStyle(letterSpacing: 0.2),
            cursorColor: Colors.black,
            textCapitalization: TextCapitalization.words,
            cursorHeight: 25,
            cursorWidth: 2,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: _lastNameController,
            decoration: new InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black54,
              ),
              hintText: ('First Name'),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return "Please Provide your First Name";
              }else {
                return null;
              }
            }),
      ),
    ),
  );

  _buildEmail() => Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 5,
      child: Container(
        child: TextFormField(
            autofocus: false,
            style: TextStyle(letterSpacing: 0.2),
            cursorColor: Colors.black,
            textCapitalization: TextCapitalization.words,
            cursorHeight: 25,
            cursorWidth: 2,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: new InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black54,
              ),
              hintText: ('Email Address'),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (!value.contains("@")) {
                return "Please Enter a Valid Email Address";
              } else if (value.isEmpty) {
                return "Email Address Cannot be Empty";
              } else if (!value.endsWith(".com")) {
                return "Please Enter a Valid Email Address";
              } else {
                return null;
              }
            }),
      ),
    ),
  );

  _buildPassword() => Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 5,
      child: Container(
        child: TextFormField(
            autofocus: false,
            style: TextStyle(letterSpacing: 0.2),
            cursorColor: Colors.red,
            textCapitalization: TextCapitalization.words,
            cursorHeight: 25,
            cursorWidth: 2,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            obscureText: _isObscure,
            controller: _passwordController,
            decoration: new InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: Colors.black54,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              hintText: ('Password'),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return "Password Cannot be Empty";
              }else if (value.length < 8){
                return "Password must be at least 8 characters";
              }else {
                return null;
              }
            }
        ),
      ),
    ),
  );

  _buildPhoneNumber() => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 5,
          child: Container(
            child: TextFormField(
              autofocus: false,
              style: TextStyle(letterSpacing: 0.2),
              cursorColor: Colors.red,
              textCapitalization: TextCapitalization.words,
              cursorHeight: 25,
              cursorWidth: 2,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              controller: _phoneNumberController,
              decoration: new InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black54,
                ),
                hintText: ('Phone Number'),
              ),
              validator: (input) {
                final isDigitsOnly = int.tryParse(input);
                return isDigitsOnly == null
                    ? 'Input needs to be digits only'
                    : null;
              },
            ),
          ),
        ),
      );

  _buildCheckBox() => Checkbox(
      activeColor: Colors.red,
      value: this._checkBox,
      onChanged: (bool value) {
        setState(() {
          _checkBox = !_checkBox;
        });
      });

  _buildButton() => Padding(
    padding: const EdgeInsets.only(
      left: 15,
      right: 15,
    ),
    child: SizedBox(
      height: 45,
      width: double.maxFinite,
      child: RaisedButton(
        onPressed: () async {
          String firstName = _firstNameController.text;
          String lastName = _lastNameController.text;
          String email = _emailController.text;
          String password = _passwordController.text;
          String phoneNumber = _phoneNumberController.text;
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            prefs.setString('FirstName', firstName);
            prefs.setString('LastName', lastName);
            prefs.setString('Email', email);
            prefs.setString('Password', password);
            prefs.setString('PhoneNumber', phoneNumber);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext ctx) => MainDashBoard()));
          }
        },
        child: Text(
          "Register",
          style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.red,
      ),
    ),
  );

  _buildText() => Row(
    children: [
      _buildCheckBox(),
      SizedBox(
        height: 2,
      ),
      Text(
        'Remember me',
        style: TextStyle(color: Colors.red),
      ),
      Spacer(),
      Text(
        'Forget Password?' + '       ',
        style: TextStyle(color: Colors.red),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pics4.jpg'),
                    fit: BoxFit.cover,
                    //colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_pizza_sharp,
                      color: Colors.red,
                      size: 70,
                    ),
                    Text(
                      'DASKARS',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 40),
                    ),
                    //Theme.of(context).textTheme.headline3
                    SizedBox(height: 5),
                    Text(
                      'Cafe',
                      textScaleFactor: 0.9,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'WELCOME!',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'SignUp to continue',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                     _buildFirstName(),
                    SizedBox(height:15
                    ),
                    _buildLastName(),
                    SizedBox(height:15),
                    _buildEmail(),
                    SizedBox(
                      height: 15,
                    ),
                    _buildPassword(),
                    SizedBox(
                      height: 15,
                    ),
                    _buildPhoneNumber(),
                    SizedBox(
                      height: 5,
                    ),
                    _buildText(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildButton(),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext ctx) => MyLoginPage()));
                      },
                      child: Text(
                        ' Already Have An Account? Sign In',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "By signing up you indicate that you have read and\n              agreed to the Terms and Service",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
