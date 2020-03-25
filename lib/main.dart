import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/splash_page.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/brazilian_cupertinolocalization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          BrazilianCupertinoLocalization.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff0051FF),
            scaffoldBackgroundColor: Colors.white,
            cursorColor: Colors.white),
      ),
    );
  }
}
