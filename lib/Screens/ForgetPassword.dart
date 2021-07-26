import 'package:flutter/material.dart';


class Changepassword extends StatefulWidget {
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey <ScaffoldState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isObscure = true;



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

  _confirmPassword() => Padding(
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
            controller: _confirmPasswordController,
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
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
        },
        child: Text(
          "Change PassWord",
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
                    'FORGET PASSWORD',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText( text: TextSpan(
                    children: [
                      TextSpan( text:  'Please Enter a New Password and \n',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold,color: Colors.black)),
                    TextSpan(
                        text:  ' confirm the password',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold,color: Colors.black)),
                    ],
                  ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildPassword(),
                  SizedBox(
                    height: 15,
                  ),
                  _confirmPassword(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
