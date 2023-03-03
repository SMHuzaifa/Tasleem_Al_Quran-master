import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:tasleem_al_quran/quran_files/main.dart';
import 'package:tasleem_al_quran/util/slide_images.dart';

import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';
import '../not_used_files/bottom_navigation_bar.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../util/open_whatsapp.dart';
import '../qibla_files/compass_file.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

import '../util/routes_name.dart';
import 'Register.dart';
import 'about_us.dart';

class Fee extends StatefulWidget {
  const Fee({Key? key}) : super(key: key);
  static String id = "Fee_id";

  @override
  State<Fee> createState() => _FeeState();
}

class _FeeState extends State<Fee> {
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tasleem Al-Quran Academy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        //automaticallyImplyLeading: false,
      ),
      drawer: _buildDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        tooltip: 'Contact Us',
        child: Image.asset('assets/WhatsApp.png'),
        onPressed: () {
          openWhatsapp();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _size.height * 0.22, // 22% of screen
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/background_img.jpg'))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 40, 40, 6),
                      child: Text(
                        formatted,
                        style: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(75, 0, 40, 25),
                      child: RichText(
                        text: TextSpan(children: <InlineSpan>[
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _hijri.hDay.toString(),
                                style: const TextStyle(
                                    fontSize: 27, color: Colors.white),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _hijri.longMonthName,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                '${_hijri.hYear} AH',
                                style: const TextStyle(
                                    fontSize: 27, color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 190, 2),
                  child: Text(
                    'Fee Structure',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(10, 91, 144, 0.8),
                        fontWeight: FontWeight.bold),
                  )),

              const Padding(
                  padding: EdgeInsets.fromLTRB(10, 7, 15, 0),
                  child: Text(
                    'Quranic education must be much affordable to all so that everyone can learn, recite and understand Quran easily and effectively.\n\n'
                    'There will be free trial sessions for three days. After the satisfaction of our high-quality services, and our highly qualified Quranic Teaching staff, the following fee structure will be enforced on monthly basis.\n\n'
                    'Moreover, we provide considerable discounts on more than one student (siblings and family members) with 0% registration charges, and variation in fee is based on class time duration, a number of siblings and family members, course schedule plan, and Fee Chart for needy families.\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),

              const Padding(
                padding: EdgeInsets.fromLTRB(2, 1, 70, 0),
                child: Text(
                  '3 Days Free Trail with Each Plan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 15, 0),
                child: Text(
                  'The following fee plan is implemented on a monthly basis for all courses after the satisfaction of 3 days Free trial period and Fee Chart. We know that families often have to make sacrifices to afford the tuition fees. For this reason, we have made our Fee Packages low as affordable as possible.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                  textAlign: TextAlign.justify,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 20, 70, 0),
                child: Text(
                  '5 Days / Week Days Packages:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 10, 185, 0),
                child: Text(
                  '20 Days /Monthly Plan;',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(21, 15, 60, 0),
                child: Table(
                  defaultColumnWidth: const FixedColumnWidth(80.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 1),
                  children: [
                    TableRow(children: [
                      Column(children: const [
                        Text('S.no',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('Country',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      // Column(children: const [
                      //   Text('  Classes/\n  Month',
                      //       style: TextStyle(
                      //           fontSize: 15.0, fontWeight: FontWeight.bold))
                      // ]),
                      Column(children: const [
                        Text('Fee/Month',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  For 2nd\n  Student',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('1',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('USA',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('USD 50', style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('USD 48', style: TextStyle(fontSize: 15.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('2',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('UK',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('GBP 40', style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('GBP 38', style: TextStyle(fontSize: 15.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('3',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('Europe',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('EUR 40', style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('EUR 38', style: TextStyle(fontSize: 15.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('4',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('Australia',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('AUD 55', style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('AUD 53', style: TextStyle(fontSize: 15.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('5',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('UAE',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('150 Riyal/\n  Dirham',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('130 Riyal/\n  Dirham',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                    ]),
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 170, 10),
                child:  TextButton(
                  style: TextButton.styleFrom(
                     // foregroundColor: Color.fromRGBO(10, 91, 144, 1),
                      backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                      textStyle:
                      const TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: RoutesName.register),
                      screen:  const Register(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );





                //  Navigator.pushNamed(context, Register.id);
                }, child: const Text("Click For Free Trail",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),

                )
              ),
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(8, 15, 110, 0),
              //   child: Text(
              //     '2 Days & 3 Days/Weekend Packages:',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 19,
              //         ),
              //   ),
              // ),
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(2, 15, 60, 0),
              //   child: Text(
              //     '08 Days & 12 Days /Monthly Plan;',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              //   ),
              // ),
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(8, 15, 120, 0),
              //   child: Text(
              //     'Class Type: 1 on 1 Live class.\nClass Duration: 45 Minutes/Day.',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              //   child: Table(
              //     defaultColumnWidth: const FixedColumnWidth(110.0),
              //     border: TableBorder.all(
              //         color: Colors.black, style: BorderStyle.solid, width: 1),
              //     children: [
              //       TableRow(children: [
              //         Column(children: const [
              //           Text('Country',
              //               style: TextStyle(
              //                   fontSize: 17.0, fontWeight: FontWeight.bold))
              //         ]),
              //         Column(children: const [
              //           Text('Currency',
              //               style: TextStyle(
              //                   fontSize: 17.0, fontWeight: FontWeight.bold))
              //         ]),
              //         Column(children: const [
              //           Text('Fee/Month',
              //               style: TextStyle(
              //                   fontSize: 17.0, fontWeight: FontWeight.bold))
              //         ]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: const [
              //           Text(
              //             'USA',
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           )
              //         ]),
              //         Column(children: const [Text('USD')]),
              //         Column(children: const [Text('   40/-')]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: const [
              //           Text('UK',
              //               style: TextStyle(fontWeight: FontWeight.bold))
              //         ]),
              //         Column(children: const [Text('GBP')]),
              //         Column(children: const [Text('30')]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: const [
              //           Text('Europe',
              //               style: TextStyle(fontWeight: FontWeight.bold))
              //         ]),
              //         Column(children: const [Text('EUR')]),
              //         Column(children: const [Text('30')]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: const [
              //           Text('Australia',
              //               style: TextStyle(fontWeight: FontWeight.bold))
              //         ]),
              //         Column(children: const [Text('	AUD')]),
              //         Column(children: const [Text('40')]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: const [
              //           Text('UAE',
              //               style: TextStyle(fontWeight: FontWeight.bold))
              //         ]),
              //         Column(children: const [Text('Riyal/Dirham')]),
              //         Column(children: const [Text('85')]),
              //       ]),
              //     ],
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 305, 0),
                child: Text('Note',style: TextStyle(
                  color: Color.fromRGBO(10, 91, 144, 0.8),fontSize: 20,fontWeight: FontWeight.bold
                ),),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Moreover, we are also providing a 10% discount on fees to poor and needy families. We charge fees in advance after trial classes. Eid Holidays are also included in this plan. Moreover, there is no refund of the fee.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _buildDrawer() {
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
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Container(
                  //   height: 150,
                  //   width: 150,
                  //   alignment: Alignment.center,
                  //   decoration: const BoxDecoration(
                  //       //shape: BoxShape.circle,
                  //       // gradient: LinearGradient(
                  //       //     colors: [Colors.pink, Colors.deepPurple])
                  //          ),
                  //
                  //   child:  Image(image: AssetImage('assets/tasleemalquranlogo.png'),)
                  //   ),

                  const SizedBox(height: 80.0),
                  _buildRow(Icons.compass_calibration, "Qibla Direction", () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: RoutesName.compass),
                      screen:  Compass(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );



                    //Navigator.pushNamed(context, RoutesName.compass);
                  }),
                  _buildDivider(),
                  _buildRow(Icons.calendar_month, "Ramazan Calendar", () {
                    // Navigator.pushNamed(context, Calendar.id);
                    Fluttertoast.showToast(
                        msg: 'Coming Soon',
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
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: RoutesName.namazLocCheck),
                        screen: const NamazLoccheck(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );


                      // Navigator.pushNamed(context, RoutesName.namazLocCheck);
                    },
                    showBadge: true,
                  ),
                  _buildDivider(),
                  _buildRow(Icons.admin_panel_settings, "For Admin", () {
                    if (auth.currentUser != null) {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: RoutesName.userData),
                        screen: const UserData(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );




                      //Navigator.pushNamed(context, RoutesName.userData);
                    } else {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: RoutesName.adminPage),
                        screen: const AdminPage(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );


                      //Navigator.pushNamed(context, RoutesName.adminPage);
                    }
                  }, showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.book, "About Us", () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: RoutesName.ourTeam),
                      screen: const OurTeam(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      //Navigator.pushNamed(context, Quran.id);
                    );}),
                  // // _buildDivider(),
                  // // _buildRow(Icons.email, "Contact us", () {
                  // //   print('Tapped contct');
                  // // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.info_outline, "Help", () {
                  // //   print('Tapped help');
                  // }),
                  const SizedBox(
                    height: 350,
                  ),
                  const Text(
                    "Powered By IT Artificer",
                    style: TextStyle(color: Colors.white),
                  )
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
