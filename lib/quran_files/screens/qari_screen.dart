import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../util/routes_name.dart';
import '../models/qari.dart';

import '../services/api_services.dart';
import '../widgets/qari_custom_tile.dart';
import 'audio_surah_list_screen.dart';

class QariListScreen extends StatefulWidget {
  static String id = "QariList";
  const QariListScreen({Key? key}) : super(key: key);

  @override
  _QariListScreenState createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: const Text('Select Qari'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Qari>> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Qari\'s data not found '),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return QariCustomTile(
                            qari: snapshot.data![index],
                            ontap: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: RoutesName.audioSurahListScreen),
                                screen: AudioSurahListScreen(
                                    qari: snapshot.data![index]),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );

                              // Navigator.push(context,
                              //     MaterialPageRoute(builder:(context)=>
                              //         AudioSurahListScreen(qari: snapshot.data![index])));
                            });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
