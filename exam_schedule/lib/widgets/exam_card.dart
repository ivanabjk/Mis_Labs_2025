import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback? onTap;

  const ExamCard({
    Key? key,
    required this.exam,
    this.onTap,
  }) : super(key: key);

  bool get isPast => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime);
    final roomText = exam.examRooms.join(', ');

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isPast ? Colors.brown[100] : Colors.lightBlue[100],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 20),
                      const SizedBox(width: 6),
                      Text(formattedDate,
                      style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 20),
                      const SizedBox(width: 6),
                      Expanded(child: Text(roomText, style: TextStyle(fontSize: 16),)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}