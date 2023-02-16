// import 'package:flutter/material.dart';
//
// import 'home.dart';
//
//
//
//
//  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//  // onPrimary: Colors.black87,
// primary: Color.fromRGBO(10,91,144 ,1),
//  // primary: Colors.grey[300],
//   minimumSize: Size(88, 36),
//   padding: EdgeInsets.symmetric(horizontal: 16),
//   shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//
//   );
//
//
// const TextStyle ktextStyle = TextStyle(
//   color: Colors.white,
//   fontFamily: 'Audiowide',
//   fontWeight: FontWeight.normal,
//   fontSize: 15.0,
// );
//
// class KReusableButton extends StatelessWidget {
//   const KReusableButton({required this.cardChild, required this.onPress});
//
//   final Widget cardChild;
//   final Function onPress;
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonTheme(
//       minWidth: 100.0,
//       height: 100.0,
//       child: ElevatedButton(
//         style: raisedButtonStyle,
//        onPressed: () {  Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => Home()),
//        ); },
//        child: cardChild,
//       ));
//     //);
//   }
// }
//
// class KIconContent extends StatelessWidget {
//   const KIconContent({required this.label, required this.assetImage, required this.color,});
//   final String label;
//   final String assetImage;
//   final Color color;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//
//         Text(
//           label,
//           style: ktextStyle,
//
//         ),
//         const SizedBox(
//           height: 25.0,
//         ),
//
//         Image.asset(
//           assetImage,
//           height: 35.0,
//           color: Colors.white,
//
//
//         ),
//       ],
//     );
//   }
// }
//
// class KBackground extends StatelessWidget {
//   const KBackground({required this.assetImage});
//   final String assetImage;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             assetImage,
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
//
// class KMyButton extends StatelessWidget {
//   const KMyButton({required this.label, required this.size, required this.onPress, required this.height, required this.radius});
//   final String label;
//   final double size;
//   final Function onPress;
//   final double height;
//   final double radius;
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonTheme(
//       height: height,
//       child: ElevatedButton(
//         style: raisedButtonStyle,
//         onPressed: () {  },
//         child: Center(
//           child: Text(
//             label,
//             style: ktextStyle.copyWith(fontSize: size),
//           ),
//         ),
//       ) );
//     //);
//   }
// }
//
// class KReusableName extends StatelessWidget {
//   const KReusableName({required this.nameField, required this.icon});
//
//   final String nameField;
//   final IconData icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Icon(
//           icon,
//           color: const Color(0xFF3B2E7E),
//         ),
//         Text(
//           nameField,
//           style: ktextStyle.copyWith(
//             fontSize: 20.0,
//             color: const Color(0xFF3B2E7E),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// const kTextFieldDecoration = InputDecoration(
//   filled: true,
//   fillColor: Colors.white,
//   errorStyle: TextStyle(fontSize: 20.0, color: Colors.orange),
//   focusedErrorBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.orange),
//   ),
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(32.0),
//     ),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Color(0xFF3B2E7E), width: 1.0),
//     borderRadius: BorderRadius.all(
//       Radius.circular(32.0),
//     ),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Color(0xFF3B2E7E), width: 2.0),
//     borderRadius: BorderRadius.all(
//       Radius.circular(32.0),
//     ),
//   ),
// );
