import 'package:flutter/material.dart';
import 'package:flutter_calender/component/schedule_bottom_sheet.dart';
import 'package:flutter_calender/component/schedule_card.dart';
import 'package:flutter_calender/component/today_banner.dart';
import 'package:flutter_calender/const/colors.dart';

import '../component/calender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calender(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              scheduleCount: 3,
            ),
            SizedBox(
              height: 8.0,
            ),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return ScheduleBottomSheet();
          },
        );
      },
      backgroundColor: PRIMARY_COLOR,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 8.0,
            );
          },
          itemBuilder: (context, index) {
            return ScheduleCard(
              startTime: 8,
              endTime: 9,
              content: '프로그래밍 공부하기. $index',
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
