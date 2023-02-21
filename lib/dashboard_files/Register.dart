import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:tasleem_al_quran/slide_images.dart';

import '../admin_files/admin_login_page.dart';
import '../bottom_navigation_bar.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../qibla_files/compass_file.dart';
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
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;



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
        drawer: buildDrawer(),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                  width: 5000,
                  child: SlideImage(),
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
                          child: Text(
                            'Registration Form',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(10, 91, 144, 1),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(

                        width: 300,
                        child: Form(

                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 55,
                                child: TextFormField(

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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: TextFormField(
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: TextFormField(
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: TextFormField(
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 55,
                                child: TextFormField(
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
                              ),
                              const SizedBox(
                                height: 3,
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
                )
              ],
            ),
          ),
        ));
  }
  buildDrawer() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary,
              boxShadow: const [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 80.0),
                  _buildRow(Icons.compass_calibration, "Qibla Direction", () {
                    Navigator.pushNamed(context, Compass.id);
                  }),
                  _buildDivider(),
                  _buildRow(Icons.calendar_month, "Ramazan Calendar", () {
                    // Navigator.pushNamed(context, Calendar.id);
                    Fluttertoast.showToast(
                        msg:'Coming Soon',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16);
                  }),
                  _buildDivider(),
                  _buildRow(
                    Icons.access_time_filled,
                    "Namaz Timing",
                        () {
                      Navigator.pushNamed(context, NamazLoccheck.id);
                    },
                    showBadge: true,
                  ),
                  _buildDivider(),
                  _buildRow(Icons.admin_panel_settings, "For Admin", () {
                    Navigator.pushNamed(context, AdminPage.id);

                  }, showBadge: true),
                  _buildDivider(),
                  // // _buildRow(Icons.settings, "Settings", () {
                  // //   print('Tapped setting');
                  // // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.email, "Contact us", () {
                  // //   print('Tapped contct');
                  // // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.info_outline, "Help", () {
                  // //   print('Tapped help');
                  // }),
                  SizedBox(
                    height: 350,
                  ),
                  Text("Powered By IT Artificer",style: TextStyle(color: Colors.white),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title, onTap,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: tStyle,
          ),
        ),
        //const Spacer(),
      ]),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
