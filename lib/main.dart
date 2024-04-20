import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_blog1/screens/audio_articles.dart';
import 'package:news_blog1/screens/audio_news_details.dart';
import 'package:news_blog1/screens/bookmarked.dart';
import 'package:news_blog1/screens/comments.dart';
import 'package:news_blog1/screens/create_article_screen.dart';
import 'package:news_blog1/screens/forgot_password.dart';
import 'package:news_blog1/screens/home.dart';
import 'package:news_blog1/screens/latest_news.dart';
import 'package:news_blog1/screens/login.dart';
import 'package:news_blog1/screens/news_details.dart';
import 'package:news_blog1/screens/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  // Determine the initial route based on the token
  String initialRoute = token != null ? Home.id : LoginScreen.id;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scrollBehavior: const ScrollBehavior(),
      debugShowCheckedModeBanner: true,
      title: 'News Blog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginScreen(),
      initialRoute: initialRoute,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        Home.id: (context) => const Home(),
        LatestNews.id: (context) => const LatestNews(),
        NewsDetails.id: (context) => const NewsDetails(),
        CommentsScreen.id: (context) => const CommentsScreen(),
        AudioArticlesScreen.id: (context) => const AudioArticlesScreen(),
        AudioNewsDetails.id: (context) => const AudioNewsDetails(),
        CreateArticleScreen.id: (context) => const CreateArticleScreen(),
        BookMarked.id: (context) => const BookMarked()
      },
    );
  }
}

