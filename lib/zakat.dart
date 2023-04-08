import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const ZakatApp());
}

class ZakatApp extends StatelessWidget {
  const ZakatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zakat Calculator'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
      ),
      body: const ZakatForm(),
    );
  }
}

class ZakatInput {
  double cash;
  double bankBalance;
  double stocks;
  double gold;
  double property;

  ZakatInput({
    required this.cash,
    required this.bankBalance,
    required this.stocks,
    required this.gold,
    required this.property,
  });
}

class ZakatForm extends StatefulWidget {
  const ZakatForm({super.key});

  @override
  State<ZakatForm> createState() => _ZakatFormState();
}

class _ZakatFormState extends State<ZakatForm> {
  final TextEditingController _cashController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _goldController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _propertyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late ZakatInput _input;

  double zakatAmount = 0.0;


  @override
  void initState() {
    super.initState();
    _input = ZakatInput(
      cash: 0,
      bankBalance: 0,
      stocks: 0,
      gold: 0,
      property: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _cashController,
                decoration: const InputDecoration(
                  labelText: 'Cash in Hand',
                  prefixIcon: Icon(
                    Icons.money,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
                  hintText: 'Enter Cash in Hand',
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'Please enter a value';
                //   // }
                //   return null;
                // },
                onChanged: (value) {
                  _input.cash = double.parse(value);
                },
              ),
              TextFormField(
                controller: _bankController,
                decoration: const InputDecoration(
                  labelText: 'Bank Balance',
                  prefixIcon: Icon(
                    Icons.account_balance,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
                  hintText: 'Enter Bank Balance',
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'Please enter a value';
                //   // }
                //   return null;
                // },
                onChanged: (value) {
                  _input.bankBalance = double.parse(value);
                },
              ),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(
                  labelText: 'Stocks',
                  prefixIcon: Icon(
                    Icons.show_chart,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
                  hintText: 'Enter Stocks Value',
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'Please enter a value';
                //   // }
                //   return null;
                // },
                onChanged: (value) {
                  _input.stocks = double.parse(value);
                },
              ),
              TextFormField(
                controller: _goldController,
                decoration: InputDecoration(
                  labelText: 'Gold',
                  prefixIcon: Image.asset('assets/pkr.png'),
                  hintText: 'Enter Gold Value',
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'Please enter a value';
                //   // }
                //   return null;
                // },
                onChanged: (value) {
                  _input.gold = double.parse(value);
                },
              ),
              TextFormField(
                controller: _propertyController,
                decoration: InputDecoration(
                  labelText: 'Property',
                  prefixIcon: Image.asset('assets/pkr.png'),
                  hintText: 'Enter Property Value',
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'Please enter a value';
                //   // }
                //   return null;
                // },
                onChanged: (value) {
                  _input.property = double.parse(value);
                },
              ),

              // TextFormField(
              //     decoration: const InputDecoration(
              //       labelText: 'Property',
              //       prefixIcon: Icon(Icons.home),
              //       hintText: 'Enter property value',
              //     ),
              //     keyboardType: TextInputType.number,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter a value';
              //       }
              //
              //       onChanged:
              //       (value) {
              //         _input.property = double.parse(value!);
              //       };
              //     }),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromRGBO(10, 91, 144, 1), // Change the color here..
                  elevation: 0,
                  // ...
                ),
                onPressed: () {
                  // Fluttertoast.showToast(
                  //     msg: 'Please Enter atleast one Value',
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16);
                 setState(() {
                   ZakatInput input = ZakatInput(
                     cash: double.tryParse(_cashController.text) ?? 0,
                     bankBalance: double.tryParse(_bankController.text) ?? 0,
                     stocks: double.tryParse(_stockController.text) ?? 0,
                     gold: double.tryParse(_goldController.text) ?? 0,
                     property: double.tryParse(_propertyController.text) ?? 0,
                   );
                   _showZakatDialog(context, input);

                 });
                },
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Your Zakat amount in PKR is:',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),),
                    const SizedBox(height: 10),
                    Container(
                      //margin: const EdgeInsets.only(),
                      height: 45,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(10, 91, 144, 1),
                          width: 2
                        )
                      ),
                      child: Center(
                        child: Text( zakatAmount.toStringAsFixed(2),style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _calculateZakat(ZakatInput input) {
    double totalWealth = input.cash +
        input.bankBalance +
        input.stocks +
        input.gold +
        input.property;
    return totalWealth * 0.025;
  }

  void _showZakatDialog(BuildContext context, ZakatInput input) {
    if (input.cash <= 0 &&
        input.bankBalance <= 0 &&
        input.stocks <= 0 &&
        input.gold <= 0 &&
        input.property <= 0) {
      Fluttertoast.showToast(
          msg: 'Please Enter atleast one Value',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    } else {
      zakatAmount = _calculateZakat(input);
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: const Text('Zakat Amount'),
      //       content: Text('Your Zakat amount is: ${zakatAmount.toStringAsFixed(2)}'),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: const Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }

}
