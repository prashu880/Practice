import 'package:flutter/material.dart';
import '../data/booking_data.dart';
import '../widgets/booking_card.dart';

class OngoingPage extends StatelessWidget {
  const OngoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ongoingList = bookingList
        .where((booking) => booking.bookingType == 'Ongoing')
        .toList();

    return ListView.separated(
      padding: const EdgeInsets.only(top: 23),
      itemCount: ongoingList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 23),
      itemBuilder: (context, index) {
        return BookingCard(booking: ongoingList[index]);
      },
    );
  }
}
