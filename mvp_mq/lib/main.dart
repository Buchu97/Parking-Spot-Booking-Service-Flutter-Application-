import 'package:flutter/material.dart';
import 'package:mvp_mq/mq_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mvp_mq/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyBn_Rl5SFo-uHB3q2wyYtgpGQB3s1JZY4k", 
      appId:
          "1:1057609430885:android:60e009f1f69e08c5cd138c", 
      messagingSenderId: "1057609430885", 
      projectId: "mvp-mq", 
    ),
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
  ],
  child: const MQApp()));
}