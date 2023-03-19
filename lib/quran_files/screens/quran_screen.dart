import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:tasleem_al_quran/quran_files/constants/constants.dart';
import 'package:tasleem_al_quran/quran_files/screens/surah_detail.dart';
import 'package:tasleem_al_quran/util/routes_name.dart';


import '../models/sajda.dart';
import '../models/surah.dart';

import '../services/api_services.dart';
import '../widgets/sajda_custom_tile.dart';
import '../widgets/surah_custem_tile.dart';
import 'jus_screen.dart';

class QuranScreen extends StatefulWidget {
  static String id = "Quran Screen";
   const QuranScreen({Key? key}) : super(key: key);

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  ApiServices apiServices = ApiServices();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3, // Added
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
            title: const Text('Quran'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),//index - 0
                Text(
                  'Sajda',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),//index - 1
                Text(
                  'Juz',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),// index - 2
              ],
            ),
          ),
          body: TabBarView(
            children:  <Widget>[
              FutureBuilder(
                future: apiServices.getSurah(),
                builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surah = snapshot.data;
                    return ListView.builder(
                      itemCount: surah!.length,
                      itemBuilder: (context, index) => SurahCustomListTile(surah: surah[index],
                          context: context, ontap: (){
                            setState(() {
                              Constants.surahIndex = (index + 1);
                            });
                            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(name: RoutesName.surahDetails),
                              screen: const Surahdetail(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                           // Navigator.pushNamed(context, RoutesName.surahDetails);
                          }),
                     );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              FutureBuilder(
                future: apiServices.getSajda(),
                builder: (context,AsyncSnapshot<SajdaList> snapshot){
                  if(snapshot.hasError){
                    return const Center(child: Text('Something went wrong'),);
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.sajdaAyahs.length,
                    itemBuilder: (context , index) => SajdaCustomTile(snapshot.data!.sajdaAyahs[index], context),
                  );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: 30,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            Constants.juzIndex = (index + 1);
                          });
                          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(name: RoutesName.juzScreen),
                            screen: const JuzScreen(),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );


                  //        Navigator.pushNamed(context, RoutesName.juzScreen);
                        },
                        child: Card(
                          elevation: 4,
                          color: Colors.blueGrey,
                          child: Center(
                            child: Text('${index+1} ',style: const TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
