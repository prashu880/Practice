import 'package:flutter/material.dart';
import '../data/booking_data.dart';
import '../widgets/booking_card.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final completedList = bookingList
        .where((booking) => booking.bookingType == 'Completed')
        .toList();

    return ListView.separated(
      padding: const EdgeInsets.only(top: 23),
      itemCount: completedList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 23),
      itemBuilder: (context, index) {
        return BookingCard(booking: completedList[index]);
      },
    );
  }
}
