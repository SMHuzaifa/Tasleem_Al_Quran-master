import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:tasleem_al_quran/quran_files/constants/constants.dart';


import '../models/translation.dart';
import '../services/api_services.dart';
import '../widgets/custom_translation.dart';



enum Translation { urdu,hindi,english, spanish }

class Surahdetail extends StatefulWidget {
  const Surahdetail({Key? key}) : super(key: key);

  static const String id = 'surahDetail_screen';

  @override
  _SurahdetailState createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {

  ApiServices _apiServices = ApiServices();
 // SolidController _controller = SolidController();
  Translation? _translation = Translation.urdu;


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:Color.fromRGBO(10, 91, 144, 1),leading: BackButton(onPressed:(){
          Navigator.pop;
        },),),
        body: FutureBuilder(
          future: _apiServices.getTranslation(Constants.surahIndex!,_translation!.index),
          builder: (BuildContext context, AsyncSnapshot<SurahTranslationList> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(backgroundColor: Color.fromRGBO(10, 91, 144, 1),),);
            }
            else if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context,index){
                    return TranslationTile(index: index,
                        surahTranslation: snapshot.data!.translationList[index],
                    );
                  },
                ),
              );
            }
            else {
              return const Center(child: Text('Translation Not found'),);
            }
          },
        ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Color.fromRGBO(10, 91, 144, 1),
            height: 50,
            child: const Center(
              child: Text("Swipe me!",style: TextStyle(color: Colors.white),),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Urdu'),
                      leading: Radio<Translation>(
                        value: Translation.urdu,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Hindi'),
                      leading: Radio<Translation>(
                        value: Translation.hindi,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<Translation>(
                        value: Translation.english,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Spanish'),
                      leading: Radio<Translation>(
                        value: Translation.spanish,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
