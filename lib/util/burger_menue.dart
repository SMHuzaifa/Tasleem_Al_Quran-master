// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:tasleem_al_quran/util/routes_name.dart';
//
// import '../admin_files/admin_login_page.dart';
// import '../admin_files/user_data.dart';
//
//
//
//
//
// final Color primary = const Color.fromRGBO(10, 91, 144, 1);
//
// final Color active = Colors.white;
// buildDrawer() {
//   final auth = FirebaseAuth.instance;
//  // final user = auth.currentUser;
//   return ClipPath(
//     clipper: OvalRightBorderClipper(),
//     child: Drawer(
//       child: Container(
//         padding: const EdgeInsets.only(left: 16.0, right: 40),
//         decoration: BoxDecoration(
//             color: primary,
//             boxShadow: const [BoxShadow(color: Colors.black45)]),
//         width: 300,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(height: 80.0),
//                 // _buildRow(Icons.compass_calibration, "Qibla Direction", () {
//                 //   Navigator.pushNamed(context, Compass.id);
//                 // }),
//                 // _buildDivider(),
//                 // _buildRow(Icons.calendar_month, "Ramazan Calendar", () {
//                 //   // Navigator.pushNamed(context, Calendar.id);
//                 //   Fluttertoast.showToast(
//                 //       msg:'Coming Soon',
//                 //       toastLength: Toast.LENGTH_SHORT,
//                 //       gravity: ToastGravity.CENTER,
//                 //       timeInSecForIosWeb: 1,
//                 //       backgroundColor: Colors.red,
//                 //       textColor: Colors.white,
//                 //       fontSize: 16);
//                 // }),
//                 // _buildDivider(),
//                 // _buildRow(
//                 //   Icons.access_time_filled,
//                 //   "Namaz Timing",
//                 //       () {
//                 //     Navigator.pushNamed(context, NamazLoccheck.id);
//                 //   },
//                 //   showBadge: true,
//                 // ),
//                 // _buildDivider(),
//                 _buildRow(Icons.admin_panel_settings, "For Admin", () {
//                   if (auth.currentUser != null) {
//
//                     PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
//                       context as BuildContext,
//                       settings:
//                       const RouteSettings(name: RoutesName.userData),
//                       screen: const UserData(),
//                       withNavBar: true,
//                       pageTransitionAnimation:
//                       PageTransitionAnimation.cupertino,
//                     );
//                   } else {
//                     var context;
//                     PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
//                       context,
//                       settings:
//                       const RouteSettings(name: RoutesName.adminPage),
//                       screen: const AdminPage(),
//                       withNavBar: true,
//                       pageTransitionAnimation:
//                       PageTransitionAnimation.cupertino,
//                     );
//                   }
//                 }, showBadge: true),
//                 _buildDivider(),
//                 // _buildRow(Icons.book, "Quran", () {
//                 //   Navigator.pushNamed(context, Quran.id);
//                 // }),
//                 // // _buildDivider(),
//                 // // _buildRow(Icons.email, "Contact us", () {
//                 // //   print('Tapped contct');
//                 // // }),
//                 // // _buildDivider(),
//                 // // _buildRow(Icons.info_outline, "Help", () {
//                 // //   print('Tapped help');
//                 // }),
//                 const SizedBox(
//                   height: 500,
//                 ),
//                 const Text(
//                   "Powered By IT Artificer",
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Divider _buildDivider() {
//   return Divider(
//     color: active,
//   );
// }
//
// Widget _buildRow(IconData icon, String title, onTap,
//     {bool showBadge = false}) {
//   final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 5.0),
//     child: Row(children: [
//       Icon(
//         icon,
//         color: active,
//       ),
//       const SizedBox(width: 10.0),
//       InkWell(
//         onTap: onTap,
//         child: Text(
//           title,
//           style: tStyle,
//         ),
//       ),
//       //const Spacer(),
//     ]),
//   );
// }
//
//
// class OvalRightBorderClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(size.width - 40, 0);
//     path.quadraticBezierTo(
//         size.width, size.height / 4, size.width, size.height / 2);
//     path.quadraticBezierTo(size.width, size.height - (size.height / 4),
//         size.width - 40, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }}