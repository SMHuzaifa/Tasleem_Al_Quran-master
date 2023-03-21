import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() {
  runApp(ZakatApp());
}

class ZakatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zakat Calculator'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(10, 91, 144, 1),
      ),
      body: ZakatForm(),
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
  @override
  _ZakatFormState createState() => _ZakatFormState();
}

class _ZakatFormState extends State<ZakatForm> {
  TextEditingController _cashController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _goldController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _propertyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late ZakatInput _input;

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
                decoration: const InputDecoration(
                  labelText: 'Gold',
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
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
                decoration: const InputDecoration(
                  labelText: 'Property',
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
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
                      Color.fromRGBO(10, 91, 144, 1), // Change the color here..
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
                  ZakatInput input = ZakatInput(
                    cash: double.tryParse(_cashController.text) ?? 0,
                    bankBalance: double.tryParse(_bankController.text) ?? 0,
                    stocks: double.tryParse(_stockController.text) ?? 0,
                    gold: double.tryParse(_goldController.text) ?? 0,
                    property: double.tryParse(_propertyController.text) ?? 0,
                  );
                  _showZakatDialog(context, input);
                },
                child: const Text('Calculate'),
              ),
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
      double zakatAmount = _calculateZakat(input);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Zakat Amount'),
            content: Text('Your Zakat amount is: ${zakatAmount.toStringAsFixed(2)}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

}
