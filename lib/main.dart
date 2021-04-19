import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/Screens/chat_screen.dart';
import 'package:flutter_complete_guide/Screens/auth_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(stream:FirebaseAuth.instance.onAuthStateChanged ,builder: (ctx, userSnapshot) {
        if(userSnapshot.hasData){
          return ChatScreen();
        }
        return AuthScreen();
      } ,),
    );
  }
}

