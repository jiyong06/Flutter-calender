import 'package:flutter/material.dart';
import 'package:flutter_calender/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
