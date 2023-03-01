import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tasleem_al_quran/slide_images.dart';

class UserData extends StatefulWidget {
  static String id = "User data";

  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final firestore =
      FirebaseFirestore.instance.collection("Registration").snapshots();

  String formattedate(timestamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat('dd-MM-yy').format(dateFromTimeStamp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _showDialog(context);
            },
            icon: const Icon(Icons.logout_outlined),
            tooltip: "Logout",
          )
        ],
        centerTitle: true,
        title: const Text(
          'Tasleem Al-Quran Academy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        //automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 180,
            width: 360,
            child: SlideImage(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Registered Users",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF3B2E7E),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 420,
            width: 400,
            color: const Color.fromRGBO(10, 91, 144, 1),
            child: StreamBuilder<QuerySnapshot>(
                stream: firestore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        "Some Error",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }
                  return ListView.builder(
                      //scrollDirection: Axis.vertical,

                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final result = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Are you sure?'),
                                content: const Text(
                                    'This action will permanently delete this data'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('Registration')
                                          .doc(
                                            '${snapshot.data!.docs[index]['Email']}',
                                          )
                                          .delete();
                                      Navigator.pop(context, true);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Card(
                              color: Colors.white70,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Table(
                                        defaultColumnWidth:
                                            const FixedColumnWidth(160.0),
                                        defaultVerticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        border: TableBorder.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 1),
                                        children: [
                                          TableRow(children: [
                                            Column(children: const [
                                              Text('Name',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                            Column(children: [
                                              Text(
                                                  snapshot
                                                      .data!.docs[index]['Name']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17.0))
                                            ]),
                                          ]),
                                          TableRow(children: [
                                            Column(children: const [
                                              Text('Email',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                            Column(children: [
                                              Text(
                                                  snapshot.data!
                                                      .docs[index]['Email']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17.0))
                                            ]),
                                          ]),
                                          TableRow(children: [
                                            Column(children: const [
                                              Text('Contact',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                            Column(children: [
                                              Text(
                                                  snapshot.data!
                                                      .docs[index]['Contact']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17.0))
                                            ]),
                                          ]),
                                          TableRow(children: [
                                            Column(children: const [
                                              Text('Country',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                            Column(children: [
                                              Text(
                                                  snapshot.data!
                                                      .docs[index]['Country']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17.0))
                                            ]),
                                          ]),
                                          TableRow(children: [
                                            Column(children: const [
                                              Text('City',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                            Column(children: [
                                              Text(
                                                  snapshot
                                                      .data!.docs[index]['City']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17.0))
                                            ]),
                                          ]),
                                          TableRow(children: [
                                            Column(children: const [
                                              Text('Date',
                                                  style:
                                                      TextStyle(fontSize: 20.0))
                                            ]),
                                            Column(children: [
                                              Text(
                                                  formattedate(
                                                    snapshot.data!.docs[index]
                                                        ["Registration Date"],
                                                  ),
                                                  style: const TextStyle(
                                                      fontSize: 17.0))
                                            ]),
                                          ]),
                                        ],
                                      ),
                                    ]),
                              )),
                        );
                      });
                }),
          ),
        ])),
      ),
    );
  }

  // final auth = FirebaseAuth.instance;
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Alert!!"),
          content: const Text("You want to Logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}
