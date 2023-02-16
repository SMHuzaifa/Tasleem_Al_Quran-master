import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:tasleem_al_quran/slide_images.dart';

import '../bottom_navigation_bar.dart';
import '../util/utility.dart';

class Register extends StatefulWidget {
  static String id = "Register_id";
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final firestore = FirebaseFirestore.instance.collection("Registration");
  bool err = false;
  String msgErr = '';
  bool showSpinner = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);
    Navigator.pushNamed(context, MyNavigationBar.id); // Do some stuff.
    return true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: key,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tasleem Al-Quran Academy',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
          //automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            tooltip: 'Contact Us',
            child: Image.asset('assets/WhatsApp.png'),
            onPressed: () {
              openWhatsapp();
            }),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 180,
                    width: 5000,
                    child: SlideImage(),
                  ),
                  SizedBox(
                    width: 500,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
                              child: Text(
                                'Registration Form',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(10, 91, 144, 1),
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            width: 300,
                            child: Form(

                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(

                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.person,
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      label: const Text('Name'),
                                      hintText: 'Enter Full Name',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(10, 91, 144, 1),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Contact';
                                      }
                                    },
                                    keyboardType: TextInputType.phone,
                                    controller: contactController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.contact_page,
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      label: const Text('Contact'),
                                      hintText: 'Contact / Whatsapp Number',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(10, 91, 144, 1),
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Email';
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.email,
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      label: const Text('Email'),
                                      hintText: 'Enter Email',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(10, 91, 144, 1),
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Country';
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: countryController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.account_balance_rounded,
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      label: const Text('Country'),
                                      hintText: 'Country Name',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(10, 91, 144, 1),
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter City';
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.location_city,
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      label: const Text('Your City'),
                                      hintText: 'Enter Your City Name',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(10, 91, 144, 1),
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: 150,
                                      height: 35,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13.0),
                                            ),
                                            backgroundColor: const Color.fromRGBO(
                                                10, 91, 144, 1),
                                          ),
                                          onPressed:  () {


                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                showSpinner = true;
                                              });

                                              firestore.doc(emailController.text.toString()).set({
                                                "Registration Date": DateTime.now(),
                                                "Name": nameController.text
                                                    .toString(),
                                                "Contact": contactController.text
                                                    .toString(),
                                                "Email": emailController.text
                                                    .toString(),
                                                "Country": countryController.text
                                                    .toString(),
                                                "City": cityController.text
                                                    .toString(),
                                              }).then((value) {
                                                setState(() {

                                                    nameController.clear();
                                                    contactController.clear();
                                                    emailController.clear();
                                                    countryController.clear();
                                                    cityController.clear();

                                                  showSpinner = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg:"Registration Successful",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.black,
                                                    textColor: Colors.white,
                                                    fontSize: 16);
                                              }).onError((error, stackTrace){
                                                setState(() {
                                                  showSpinner = false;
                                                  Utils().toastMessage("Registration Failed");
                                                });
                                              });
                                            } else {}
                                          },
                                          child: const Text(
                                            'Submit',
                                            style: TextStyle(fontSize: 20),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
