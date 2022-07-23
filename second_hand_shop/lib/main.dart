import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:second_hand_shop/homePage/searchscreen.dart';
import 'package:second_hand_shop/screens/add_product.dart';

import 'Authentication/login.dart';
import 'Authentication/registration.dart';
import 'navigationdrawer.dart';

const String API_BOX = "api_data";
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(API_BOX);

  AwesomeNotifications().initialize('resource://drawable/launcher', [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic test',
        defaultColor: const Color(0xFF9D50DD),
        importance: NotificationImportance.Default,
        ledColor: Colors.white,
        channelShowBadge: true)
  ]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyLogin(),
        '/register': (context) => const MyRegister(),
        '/nav': (context) => const DashboardScreen(),
        '/addProduct': (context) => const AddProductScreen(),
        '/search': (context) => const Search()
      },
    ),
  );
}
