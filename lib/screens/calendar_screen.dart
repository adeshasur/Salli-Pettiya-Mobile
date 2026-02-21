import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../theme/app_colors.dart';
import '../services/storage_service.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureBlack,
      appBar: AppBar(
        title: const Text(
          'SAVINGS CALENDAR',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.neonGreen,
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2025, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.darkCard,
              title: const Text(
                'Salli Dammada?',
                style: TextStyle(color: AppColors.neonGreen),
              ),
              content: Text(
                '${selectedDay.day}/${selectedDay.month} අද රු. 1,000 දැම්මද?',
                style: const TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Naha', style: TextStyle(color: Colors.grey)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neonGreen,
                  ),
                  onPressed: () async {
                    await StorageService.saveSavedDate(selectedDay.toString());
                    Navigator.pop(context);
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                  child: const Text('Ow', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          );
        },
        eventLoader: (day) {
          // පස්සේ කාලෙක මෙතනට සේව් කරපු දත්ත ලෝඩ් කරන ලොජික් එක දාමු
          return [];
        },
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColors.neonGreen,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(color: Colors.black),
          defaultTextStyle: TextStyle(color: Colors.white),
          weekendTextStyle: TextStyle(color: Colors.redAccent),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: AppColors.neonGreen,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
