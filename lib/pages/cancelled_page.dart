import 'package:flutter/material.dart';
import '../data/booking_data.dart';
import '../widgets/booking_card.dart';

class CancelledPage extends StatelessWidget {
  const CancelledPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cancelledList = bookingList
        .where((booking) => booking.bookingType == 'Cancelled')
        .toList();

    return ListView.separated(
      padding: const EdgeInsets.only(top: 23),
      itemCount: cancelledList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 23),
      itemBuilder: (context, index) {
        return BookingCard(booking: cancelledList[index]);
      },
    );
  }
}
