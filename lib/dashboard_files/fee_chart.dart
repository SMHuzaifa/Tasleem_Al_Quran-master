import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/slide_images.dart';

import '../bottom_navigation_bar.dart';

class Fee extends StatefulWidget {
  const Fee({Key? key}) : super(key: key);
  static String id = "Fee_id";

  @override
  State<Fee> createState() => _FeeState();
}

class _FeeState extends State<Fee> {
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
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
                width: 360,
                child: SlideImage(),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 150, 10),
                  child: Text(
                    'FEE STRUCTURE',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(10, 91, 144, 0.8),
                        fontWeight: FontWeight.bold),
                  )),
              Image.asset(
                'assets/fee-banner.png',
                width: 353,
                height: 100,
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
                  child: Text(
                    'Quranic education must be much affordable to all so that everyone can learn, recite and understand Quran easily and effectively.\n\n'
                    'There will be free trial sessions for three days. After the satisfaction of our high-quality services, and our highly qualified Quranic Teaching staff, the following fee structure will be enforced on monthly basis.\n\n'
                    'Moreover, we provide considerable discounts on more than one student (siblings and family members) with 0% registration charges, and variation in fee is based on class time duration, a number of siblings and family members, course schedule plan, and Fee Chart for needy families.\n\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),
              const Padding(
                  padding: EdgeInsets.fromLTRB(3, 0, 0, 10),
                  child: Text(
                    'Our Fee Structure and Schedule Plan',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 10, 65, 0),
                child: Text(
                  '3 Days Free Trial with Each Plan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      fontWeight: FontWeight.normal,
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
                margin: const EdgeInsets.fromLTRB(3, 15, 50, 0),
                child: Table(
                  defaultColumnWidth: const FixedColumnWidth(90.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: const [
                        Text('Country',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  Classes/\n  Month',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
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
                        Text('USA',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  20 Classes/\n  Month',
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
                        Text('UK',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  20 Classes/\n  Month',
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
                        Text('Europe',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  20 Classes/\n  Month',
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
                        Text('Australia',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  20 Classes/\n  Month',
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
                        Text('UAE',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('  20 Classes/\n  Month',
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
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 15, 120, 0),
                child: Text(
                  'Get Register for a Free Trial',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 15, 120, 0),
                child: Text(
                  '2 Days & 3 Days/Weekend Packages:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 15, 60, 0),
                child: Text(
                  '08 Days & 12 Days /Monthly Plan;',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 15, 120, 0),
                child: Text(
                  'Class Type: 1 on 1 Live class.\nClass Duration: 45 Minutes/Day.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Table(
                  defaultColumnWidth: const FixedColumnWidth(110.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: const [
                        Text('Country',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('Currency',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [
                        Text('Fee/Month',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text(
                          'USA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(children: const [Text('USD')]),
                      Column(children: const [Text('40/-')]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('UK',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [Text('GBP')]),
                      Column(children: const [Text('30')]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('Europe',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [Text('EUR')]),
                      Column(children: const [Text('30')]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('Australia',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [Text('	AUD')]),
                      Column(children: const [Text('40')]),
                    ]),
                    TableRow(children: [
                      Column(children: const [
                        Text('UAE',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Column(children: const [Text('Riyal/Dirham')]),
                      Column(children: const [Text('85')]),
                    ]),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(6, 15, 10, 0),
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
}
