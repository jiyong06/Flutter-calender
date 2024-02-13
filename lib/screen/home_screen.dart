import 'package:flutter/material.dart';

import '../component/calender.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calender(),
          ],
        ),
      )
    );
  }
}