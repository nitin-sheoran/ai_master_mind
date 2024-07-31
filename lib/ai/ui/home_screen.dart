import 'package:ai_master_mind/ai/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _isDarkMode = Pref.isDarkMode.obs;
  //final _isDarkMode = Get.isDarkMode.obs; //bug fix

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    //sample api call
    // APIs.getAnswer('hii');

    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text(appName),
        // actions: [
        //   IconButton(
        //       padding: const EdgeInsets.only(right: 10),
        //       onPressed: () {
        //         Get.changeThemeMode(
        //             _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
        //
        //         _isDarkMode.value = !_isDarkMode.value;
        //         Pref.isDarkMode = _isDarkMode.value;
        //       },
        //       icon: Obx(() => Icon(
        //           _isDarkMode.value
        //               ? Icons.brightness_2_rounded
        //               : Icons.brightness_5_rounded,
        //           size: 26)))
        // ],
      ),

      //bottomNavigationBar: AdHelper.nativeBannerAd(),

      // body: ListView(
      //   padding: EdgeInsets.symmetric(
      //       horizontal: mq.width * .04, vertical: mq.height * .015),
      //   children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      // ),
    );
  }
}