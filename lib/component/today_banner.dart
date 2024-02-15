import 'package:flutter/material.dart';
import 'package:flutter_calender/const/colors.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const TodayBanner({
    super.key,
    required this.selectedDay,
    required this.scheduleCount,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
              style: textStyle,
            ),
            Text(
              '${scheduleCount}개',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
