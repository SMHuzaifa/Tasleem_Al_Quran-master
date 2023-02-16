import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tasleem_al_quran/admin_files/user_data.dart';

import 'package:tasleem_al_quran/slide_images.dart';
import 'package:tasleem_al_quran/util/utility.dart';

import '../../bottom_navigation_bar.dart';
import '../dashboard_files/Register.dart';

class AdminPage extends StatefulWidget {
  static String id = "AdminPage";
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool showSpinner = false;
  bool err = false;
  String msgErr = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);
    Navigator.pushNamed(context, MyNavigationBar.id); // Do some stuff.
    return true;
  }

  bool _obscureText = true;

  final _auth = FirebaseAuth.instance;
  void login() {


      _auth
          .signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text.toString())
          .then((value) {
        setState(() {
          _passwordController.clear();
          showSpinner = false;
        });
        Fluttertoast.showToast(
            msg: "Login Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        // Utils().toastMessage(value.user!.emailVeri.toString());
        Navigator.push(context, MaterialPageRoute(builder:(context)=>const UserData()));

      })
          .onError((error, stackTrace) {
        setState(() {
          showSpinner = false;
        });
        debugPrint(error.toString());
        // Utils().toastMessage(error.toString());
        Fluttertoast.showToast(
            msg: "Bad Email or Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      });

  }

  // void islogin(BuildContext context){
  //   final auth = FirebaseAuth.instance;
  //   final user = auth.currentUser;
  //
  //   if(user!=null){
  //     Navigator.pushNamed(context, UserData.id);
  //   }
  //   else{
  //     Navigator.pushNamed(context, AdminPage.id);
  //   }
  // }


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
                  const SizedBox(height: 50),
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
                                'Admin Login Page',
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
                                        return 'Please Enter Email';
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.email,
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
                                      label: const Text('Email'),
                                      hintText: 'Enter Your Email',
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
                                        return 'Please Enter Password';
                                      }
                                    },
                                    obscureText: _obscureText,
                                    keyboardType: TextInputType.text,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: _obscureText
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.lock,
                                          color: Color.fromRGBO(10, 91, 144, 1),
                                        ),
                                      ),
                                      label: const Text('Password'),
                                      hintText: 'Password',
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
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {

                                                showSpinner =true;
                                              });

                                             login();

                                            }
                                          },
                                          child: const Text(
                                            'Login',
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
