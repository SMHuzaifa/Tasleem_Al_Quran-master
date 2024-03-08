import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:share_plus/share_plus.dart';


import 'package:tasleem_al_quran/quran_files/screens/qari_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/quran_screen.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';
import 'package:tasleem_al_quran/zakat.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';

import '../branch.dart';
import '../hadees_of_the_day.dart';
import '../islamic_calendar.dart';
import '../islamic_date_in_history.dart';
import 'home.dart';
import '../quran_files/ayat_of_the_day.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../qibla_files/compass_file.dart';
import '../util/open_whatsapp.dart';
import '../util/routes_name.dart';

class MyMenue extends StatefulWidget {
  static String id = "MyMenue_id";

  const MyMenue({super.key});

  @override
  State<MyMenue> createState() => _MyMenueState();
}

class _MyMenueState extends State<MyMenue> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  BranchContentMetaData metadata = BranchContentMetaData();
  BranchUniversalObject? buo;
  BranchLinkProperties lp = BranchLinkProperties();
  BranchEvent? eventStandard;
  BranchEvent? eventCustom;

  StreamSubscription<Map>? streamSubscription;
  StreamController<String> controllerData = StreamController<String>();
  StreamController<String> controllerInitSession = StreamController<String>();

  void listenDynamicLinks() async {
    streamSubscription = FlutterBranchSdk.initSession().listen((data) {
      print('listenDynamicLinks - DeepLink Data: $data');
      controllerData.sink.add((data.toString()));
      if (data.containsKey('+clicked_branch_link') &&
          data['+clicked_branch_link'] == true) {
        print(
            '------------------------------------Link clicked----------------------------------------------');
        print('Custom string: ${data['custom_string']}');
        print('Custom number: ${data['custom_number']}');
        print('Custom bool: ${data['custom_bool']}');
        print('Custom list number: ${data['custom_list_number']}');
        print(
           '------------------------------------------------------------------------------------------------');
        showSnackBar(
            message: 'Link clicked: Custom string - ${data['custom_string']}',
            duration: 10);
      }
    }, onError: (error) {
      print('InitSesseion error: ${error.toString()}');
    });
  }

  void initDeepLinkData() {
    metadata = BranchContentMetaData()
      ..addCustomMetadata('custom_string', 'abcd')
      ..addCustomMetadata('custom_number', 12345)
      ..addCustomMetadata('custom_bool', true)
      ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
      ..addCustomMetadata('custom_list_string', ['a', 'b', 'c'])
    //--optional Custom Metadata
      ..contentSchema = BranchContentSchema.COMMERCE_PRODUCT
      ..price = 50.99
      ..currencyType = BranchCurrencyType.BRL
      ..quantity = 50
      ..sku = 'sku'
      ..productName = 'productName'
      ..productBrand = 'productBrand'
      ..productCategory = BranchProductCategory.ELECTRONICS
      ..productVariant = 'productVariant'
      ..condition = BranchCondition.NEW
      ..rating = 100
      ..ratingAverage = 50
      ..ratingMax = 100
      ..ratingCount = 2
      ..setAddress(
          street: 'street',
          city: 'city',
          region: 'ES',
          country: 'Brazil',
          postalCode: '99999-987')
      ..setLocation(31.4521685, -114.7352207);

    buo = BranchUniversalObject(
        canonicalIdentifier: 'flutter/branch',
        //parameter canonicalUrl
        //If your content lives both on the web and in the app, make sure you set its canonical URL
        // (i.e. the URL of this piece of content on the web) when building any BUO.
        // By doing so, we’ll attribute clicks on the links that you generate back to their original web page,
        // even if the user goes to the app instead of your website! This will help your SEO efforts.
        canonicalUrl: 'https://flutter.dev',
        title: 'Flutter Branch Plugin',
       // imageUrl: imageURL,
        contentDescription: 'Flutter Branch Description',
        /*
        contentMetadata: BranchContentMetaData()
          ..addCustomMetadata('custom_string', 'abc')
          ..addCustomMetadata('custom_number', 12345)
          ..addCustomMetadata('custom_bool', true)
          ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
          ..addCustomMetadata('custom_list_string', ['a', 'b', 'c']),
         */
        contentMetadata: metadata,
        keywords: ['Plugin', 'Branch', 'Flutter'],
        publiclyIndex: true,
        locallyIndex: true,
        expirationDateInMilliSec: DateTime.now()
            .add(const Duration(days: 365))
            .millisecondsSinceEpoch);

    lp = BranchLinkProperties(
        channel: 'facebook',
        feature: 'sharing',
        //parameter alias
        //Instead of our standard encoded short url, you can specify the vanity alias.
        // For example, instead of a random string of characters/integers, you can set the vanity alias as *.app.link/devonaustin.
        // Aliases are enforced to be unique** and immutable per domain, and per link - they cannot be reused unless deleted.
        //alias: 'https://branch.io' //define link url,
        stage: 'new share',
        campaign: 'campaign',
        tags: ['one', 'two', 'three'])
      ..addControlParam('\$uri_redirect_mode', '1')
      ..addControlParam('\$ios_nativelink', true)
      ..addControlParam('\$match_duration', 7200)
      ..addControlParam('\$always_deeplink', true)
      ..addControlParam('\$android_redirect_timeout', 750)
      ..addControlParam('referring_user_id', 'user_id');

    eventStandard = BranchEvent.standardEvent(BranchStandardEvent.ADD_TO_CART)
    //--optional Event data
      ..transactionID = '12344555'
      ..currency = BranchCurrencyType.BRL
      ..revenue = 1.5
      ..shipping = 10.2
      ..tax = 12.3
      ..coupon = 'test_coupon'
      ..affiliation = 'test_affiliation'
      ..eventDescription = 'Event_description'
      ..searchQuery = 'item 123'
      ..adType = BranchEventAdType.BANNER
      ..addCustomData(
          'Custom_Event_Property_Key1', 'Custom_Event_Property_val1')
      ..addCustomData(
          'Custom_Event_Property_Key2', 'Custom_Event_Property_val2');

    eventCustom = BranchEvent.customEvent('Custom_event')
      ..addCustomData(
          'Custom_Event_Property_Key1', 'Custom_Event_Property_val1')
      ..addCustomData(
          'Custom_Event_Property_Key2', 'Custom_Event_Property_val2');
  }
  void generateLink(BuildContext context) async {
    BranchResponse response =
    await FlutterBranchSdk.getShortUrl(buo: buo!, linkProperties: lp);
    if (response.success) {
      if (context.mounted) {
        showGeneratedLink(context, response.result);
        //controllerData.sink.add('${response.result}');
        print(response.result);
      }
    } else {
      showSnackBar(
          message: 'Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }
  void showGeneratedLink(BuildContext context, String url) async {
    showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(12),
            height: 200,
            child: Column(
              children: <Widget>[
                const Center(
                    child: Text(
                      'Link created',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(url),
                const SizedBox(
                  height: 10,
                ),
                IntrinsicWidth(
                  stepWidth: 300,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: url));
                        if (context.mounted) {
                          Navigator.pop(this.context);
                        }
                      },
                      child: const Center(child: Text('Copy link'))),
                ),
                const SizedBox(
                  height: 10,
                ),
                IntrinsicWidth(
                  stepWidth: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        FlutterBranchSdk.handleDeepLink(url);
                        Navigator.pop(this.context);
                      },
                      child: const Center(child: Text('Handle deep link'))),
                ),
              ],
            ),
          );
        });
  }




  void showSnackBar({required String message, int duration = 1}) {
    scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
      ),
    );
  }









@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDeepLinkData();
    listenDynamicLinks();
    FlutterBranchSdk.setIdentity('branch_user_test');
  }






  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    // onPrimary: Colors.black87,
    primary: const Color.fromRGBO(10, 91, 144, 1),
    // primary: Colors.grey[300],
    maximumSize: const Size(88, 75),
    elevation: 15,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  );

  final Color active = const Color(0xBAFFFFFF);
  //
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  tooltip: "Share App",
                  onPressed:(){
                    generateLink(context);
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                    //debugPrint('gghfghghfg');
                    //generateLink(context),


                  icon: const Icon(Icons.share))
            ],
            centerTitle: true,
            title: const Column(
              children: [
                Text(
                  'Tasleem Al-Quran Academy',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
            //automaticallyImplyLeading: false,
          ),
          drawer: buildDrawer(),
          floatingActionButton: LargeFloatingActionButton(),
          // FloatingActionButton(
          //   backgroundColor: Colors.green,
          //   tooltip: 'Contact Us',
          //   child: Padding(
          //     padding: const EdgeInsets.all(7.0),
          //     child: Text('Get Free Tutors Help',style: TextStyle(fontSize: 10),),
          //   ),
          //   onPressed: () {
          //     openWhatsapp();
          //   },
          // ),

          body: UpgradeAlert(
            upgrader: Upgrader(shouldPopScope: () => true,
            canDismissDialog: true,
            durationUntilAlertAgain: const Duration(days:1),
            dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material,
             ),

            child: SingleChildScrollView(

              child: Column(
                children: <Widget>[
                  const PicDate(),

                  Container(
                    margin: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 80.0),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(10, 91, 144, 0.4),
                        borderRadius: BorderRadius.circular(15.0)),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings:
                                      const RouteSettings(name: RoutesName.home),
                                  screen: const Home(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'TAQ Academy',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(FlutterIslamicIcons.mosque,size: 40,)
                                  // Image.asset(
                                  //   height: 45,
                                  //   'assets/home.png',
                                  //   color: Colors.white,
                                  // )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: RoutesName.quranScreen),
                                  screen: const QuranScreen(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Read Quran',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(FlutterIslamicIcons.quran,size: 45,)
                                  // Image.asset(
                                  //   height: 45,
                                  //   'assets/holyQuran.png',
                                  //   color: Colors.white,
                                  // )
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: RoutesName.qariListScreen),
                                  screen: const QariListScreen(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Listen Quran',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Image.asset(
                                    height: 45,
                                    'assets/holyQuran.png',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings:
                                      const RouteSettings(name: RoutesName.compass),
                                  screen: Compass(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Qibla Direction',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(FlutterIslamicIcons.qibla,size: 45,)
                                  // Image.asset(
                                  //   height: 45,
                                  //   'assets/qibla_icon.png',
                                  //   color: Colors.white,
                                  // ),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: RoutesName.namazLocCheck),
                                  screen: const NamazLoccheck(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Prayer Times',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Icon(FlutterIslamicIcons.prayingPerson,size: 45,)
                                  // Image.asset(
                                  //   height: 45,
                                  //   'assets/mosque.png',
                                  //   color: Colors.white,
                                  // ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: RoutesName.calendar),
                                  screen: const CalenderPage(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                                );




                                // Fluttertoast.showToast(
                                //     msg: 'Coming Soon',
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.CENTER,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor: Colors.red,
                                //     textColor: Colors.white,
                                //     fontSize: 16);

                              },
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Islamic Calendar',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Image.asset(
                                    height: 45,
                                    'assets/calendar.png',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings:
                                      const RouteSettings(name: RoutesName.ayat),
                                  screen: const Ayat(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Ayat of the Day',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Icon(FlutterIslamicIcons.quran2,size: 40,)
                                  // Image.asset(
                                  //   height: 45,
                                  //   'assets/ayat.png',
                                  //   color: Colors.white,
                                  // ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings:
                                  const RouteSettings(name: RoutesName.zakat),
                                  screen:  const ZakatApp(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Calculate Zakat',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 0.1,
                                  ),
                                  Icon(FlutterIslamicIcons.zakat,size: 42,)
                                ],
                              ),
                            )),
                          ],
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    PersistentNavBarNavigator
                                        .pushNewScreenWithRouteSettings(
                                      context,
                                      settings:
                                      const RouteSettings(name: RoutesName.ayat),
                                      screen: HadeesOfTheDay(),
                                      withNavBar: true,
                                      pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: Column(
                                    children:  <Widget>[
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'Hadith of the Day',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 0.1,
                                      ),
                                      Image.asset('assets/hadees.png',height: 40,color: Colors.white,)
                                      // Image.asset(
                                      //   height: 45,
                                      //   'assets/ayat.png',
                                      //   color: Colors.white,
                                      // ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    PersistentNavBarNavigator
                                        .pushNewScreenWithRouteSettings(
                                      context,
                                      settings:
                                      const RouteSettings(name: RoutesName.zakat),
                                      screen:  IslamicDateInHistory(),
                                      withNavBar: true,
                                      pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'Islamic History',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 0.1,
                                      ),
                                      Image.asset('assets/calendar.png',height: 40,color: Colors.white,)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );

  }


  buildDrawer() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary,
              boxShadow: const [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    child: Image.asset('assets/Tasleem white copy.png'),
                  ),

                  const SizedBox(height: 20.0),
                  _buildRow(FontAwesomeIcons.facebook, "Facebook", () async {
                    final Uri url =
                    Uri.parse("https://www.facebook.com/tasleemalquran/");
                    if (await canLaunchUrl((url))) {
                      await launchUrl((url));
                    } else {
                      throw 'Could not launch try again $url';
                    }
                  }),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.instagram, "Instagram", () async {
                    // Navigator.pushNamed(context, Calendar.id);
                    final Uri url = Uri.parse(
                        "https://www.instagram.com/tasleemalquran/?hl=en");
                    if (await canLaunchUrl((url))) {
                      await launchUrl((url));
                    } else {
                      throw 'Could not launch try again $url';
                    }
                  }),
                  _buildDivider(),
                  _buildRow(
                    FontAwesomeIcons.linkedin,
                    "Linkedin",
                        () async {
                      final Uri url = Uri.parse(
                          "https://pk.linkedin.com/in/tasleemalquran");
                      if (await canLaunchUrl((url))) {
                        await launchUrl((url));
                      } else {
                        throw 'Could not launch try again $url';
                      }
                    },
                    showBadge: true,
                  ),
                  _buildDivider(),
                  _buildRow(Icons.admin_panel_settings, "For Admin", () {
                    if (auth.currentUser != null) {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                        const RouteSettings(name: RoutesName.userData),
                        screen: const UserData(),
                        withNavBar: true,
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );
                    } else {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                        const RouteSettings(name: RoutesName.adminPage),
                        screen: const AdminPage(),
                        withNavBar: true,
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );
                    }
                  }, showBadge: true),
                  _buildDivider(),
                  // _buildRow(Icons.book, "Quran", () {
                  //   Navigator.pushNamed(context, Quran.id);
                  // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.email, "Contact us", () {
                  // //   print('Tapped contct');
                  // // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.info_outline, "Help", () {
                  // //   print('Tapped help');
                  // }),
                  const SizedBox(
                    height: 300,
                  ),
                  const Text(
                    "Powered By IT Artificer",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title, onTap,
      {bool showBadge = false}) {
    const TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: tStyle,
          ),
        ),
        //const Spacer(),
      ]),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
class LargeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0, // Set the desired width
      height: 50.0, // Set the desired height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.5), // Half of the height to make it circular
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: RawMaterialButton(
        onPressed: () {
          openWhatsapp();
          // Add your onPressed functionality here.
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.5),
        ),
        elevation: 0.0,
        child: const Padding(
          padding: EdgeInsets.only(left: 1.0),
          child: Text(
            'Get Free Help\n From Tutors',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

}
