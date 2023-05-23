import 'package:bukbazarr/provider/Authprovider.dart';
import 'package:bukbazarr/view/login.dart';
import 'package:bukbazarr/view/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController number = TextEditingController();

  var formkey = GlobalKey<FormState>();
  String num = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final register = Provider.of<AuthProvider>(context);
    print('build');
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    // color: kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Image.asset(
                        "image/1.jpg",
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 280),
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  height: size.height,
                  width: size.width,
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Create New Account',
                                style: const TextStyle(
                                    // fontFamily: 'openSans',
                                    fontSize: 25,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        TextFormField(
                          controller: nameController,
                          validator: (value) => value!.isEmpty
                              ? 'Required'
                              : RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                                  ? null
                                  : 'Enter valid name',
                          decoration: InputDecoration(
                              labelText: 'Name',
                              hintText: "Enter your name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextFormField(
                          controller: emailController,
                          validator: (value) => value!.isEmpty
                              ? 'Required'
                              : RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                      .hasMatch(value)
                                  ? null
                                  : 'Enter valid Email',
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: "Enter Email_Id",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) => value!.isEmpty
                              ? 'Required'
                              : RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{}[\]\\|;:",.<>/?]).{8,}$')
                                      .hasMatch(value)
                                  ? null
                                  : 'Enter valid password',
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: "Enter your Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        // Padding(padding: EdgeInsets.only(top: 20)),
                        // IntlPhoneField(
                        //   initialCountryCode: 'IN',
                        //   controller: number,
                        //   onChanged: (phone) {
                        //     num = phone.completeNumber;
                        //   },
                        //   decoration: InputDecoration(
                        //       labelText: 'Mobile',
                        //       hintText: "Enter your number",
                        //       suffixIcon: IconButton(
                        //         icon: Icon(Icons.send),
                        //         onPressed: () {
                        //           print(num);
                        //         },
                        //       ),
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30))),
                        // ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 60),
                            child: SizedBox(
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    try {
                                      UserCredential userCredential =
                                          await _auth
                                              .createUserWithEmailAndPassword(
                                                  email: emailController.text
                                                      .toString(),
                                                  password: passwordController
                                                      .text
                                                      .toString());
                                      await userCredential.user!
                                          .updateDisplayName(
                                              nameController.text.toString());
                                      // await userCredential.user!
                                      //     .updatePhoneNumber(
                                      //         number.text.toString()
                                      //             as PhoneAuthCredential);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  loginPage()));
                                    } catch (error) {
                                      print(error.toString());

                                      setState(() {});
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 135, 28)),
                                child: Text('Signup'),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Flexible(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have account?',
                              style: const TextStyle(
                                  fontFamily: 'openSans',
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => loginPage()));
                              },
                              child: register.loading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 135, 28),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Opensans'),
                                    ),
                            ),
                          ],
                        ))
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
