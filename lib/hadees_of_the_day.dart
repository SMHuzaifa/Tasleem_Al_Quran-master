import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';

class HadeesOfTheDay extends StatefulWidget {
  const HadeesOfTheDay({Key? key}) : super(key: key);

  @override
  State<HadeesOfTheDay> createState() => _HadeesOfTheDayState();
}

class _HadeesOfTheDayState extends State<HadeesOfTheDay> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tasleem Al-Quran Academy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        //automaticallyImplyLeading: false,
      ),
      //drawer: _buildDrawer(),
      body: Column(
        children: [
          const PicDate(),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.all(16),
                  padding: const EdgeInsetsDirectional.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        )
                      ]),
                  child: const Column(
                    children: [
                      Text(
                        "Hadees of the Day",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                      Text(
                        'حَدَّثَنَا أَصْبَغُ، قَالَ أَخْبَرَنِي ابْنُ وَهْبٍ، قَالَ أَخْبَرَنِي عَمْرٌو، عَنْ عَبْدِ الرَّحْمَنِ بْنِ الْقَاسِمِ، حَدَّثَهُ عَنْ أَبِيهِ، عَنِ ابْنِ عُمَرَ ـ رضى الله عنهما ـ أَنَّهُ كَانَ يُخْبِرُ عَنِ النَّبِيِّ صلى الله عليه وسلم‏.‏ ‏ "‏ إِنَّ الشَّمْسَ وَالْقَمَرَ لاَ يَخْسِفَانِ لِمَوْتِ أَحَدٍ وَلاَ لِحَيَاتِهِ، وَلَكِنَّهُمَا آيَتَانِ مِنْ آيَاتِ اللَّهِ، فَإِذَا رَأَيْتُمُوهَا فَصَلُّوا.',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'The Prophet (ﷺ) said, "The sun and the moon do not eclipse because of the death or life (i.e. birth) of someone but they are two signs amongst the signs of Allah. When you see them offer the prayer.',
                        style: TextStyle(
                            color: Colors.black54, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hadith 3',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 20),
                          Text('Sahih al-Bukhari 1042',
                              style: TextStyle(
                                  fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
