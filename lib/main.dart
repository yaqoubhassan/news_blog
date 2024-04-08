import 'package:flutter/material.dart';
import 'package:news_blog1/screens/forgot_password.dart';
import 'package:news_blog1/screens/home.dart';
import 'package:news_blog1/screens/latest_news.dart';
import 'package:news_blog1/screens/login.dart';
import 'package:news_blog1/screens/news_details.dart';
import 'package:news_blog1/screens/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Blog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        Home.id: (context) => const Home(),
        LatestNews.id: (context) => const LatestNews(),
        NewsDetails.id: (context) => const NewsDetails()
      },
    );
  }
}

