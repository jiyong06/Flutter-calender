import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calender/database/drift_database.dart';
import 'package:flutter_calender/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get_it/get_it.dart';

const DEFAULT_COLORS = [
  'F44336',
  'FF9800',
  'FFEB3B',
  'FCAF50',
  '2196F3',
  '3F51B5',
  '9C27B0',
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  final colors = await database.getCategoryColors();

  if(colors.isEmpty){
    for(String hexCode in DEFAULT_COLORS){
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexCode: Value(hexCode),
        ),
      );
    }
  }
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
