import 'package:flutter/material.dart';

import 'package:tasleem_al_quran/quran_files/constants/constants.dart';

import '../models/juz.dart';
import '../services/api_services.dart';
import '../widgets/juz_custom_tile.dart';

class JuzScreen extends StatefulWidget {
  static const String id = 'juz_screen';

  const JuzScreen({super.key});

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
          future: apiServices.getJuzz(Constants.juzIndex!),
          builder: (context, AsyncSnapshot<JuzModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else if(snapshot.hasData){

              return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                itemBuilder: (context, index) {
                  return JuzCustomTile(list: snapshot.data!.juzAyahs,index: index,);
                },
              );
            }
            else{
              return const Center(child: Text('Data not found'),);
            }
          },
        ),
      ),
    );
  }
}