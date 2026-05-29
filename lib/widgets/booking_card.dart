import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/booking_model.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 397,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Section
          // Top Section
          SizedBox(
            width: 390,
            height: 120,
            child: Row(
              children: [
                // Image
                Padding(
                  padding: const EdgeInsets.only(left: 7, top: 9, bottom: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.asset(
                      booking.image,
                      width: 95,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      top: 9,
                      bottom: 9,
                      right: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.hotelName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            height: 1.4,
                            letterSpacing: 0.2,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 95,
                          height: 46,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booking.location,
                                style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 84.98,
                                height: 18,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 13,
                                      color: Color(0xFF878787),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      booking.date,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.5,
                                        letterSpacing: 0,
                                        color: const Color(0xFF242424),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Badge
                Padding(
                  padding: const EdgeInsets.only(
                    top: 85,
                    bottom: 9,
                    right: 0.49,
                  ),
                  child: Container(
                    width: booking.bookingType == 'Cancelled' ? 117 : 67.5,
                    height: 21,
                    decoration: BoxDecoration(
                      color: _badgeColor(),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        _badgeText(),
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          height: 1.4,
                          letterSpacing: 0.2,
                          color: _badgeTextColor(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEFF1F4),
            indent: 9,
            endIndent: 9,
          ),

          // Bottom Section
          _buildBottomSection(),
        ],
      ),
    );
  }

  // Badge color based on booking type
  Color _badgeColor() {
    switch (booking.bookingType) {
      case 'Completed':
        return const Color(0xFFC1D3E9);
      case 'Cancelled':
        return const Color(0xFFFDDDDD);
      default:
        return const Color(0xFFC1D3E9);
    }
  }

  // Badge text based on booking type
  String _badgeText() {
    switch (booking.bookingType) {
      case 'Completed':
        return 'Completed';
      case 'Cancelled':
        return 'Canceled & Refunded';
      default:
        return 'Paid';
    }
  }

  // Badge text color based on booking type
  Color _badgeTextColor() {
    switch (booking.bookingType) {
      case 'Cancelled':
        return const Color(0xFFF86666);
      default:
        return const Color(0xFF000000);
    }
  }

  // Bottom section based on booking type
  Widget _buildBottomSection() {
    switch (booking.bookingType) {
      case 'Completed':
        return Padding(
          padding: const EdgeInsets.only(
            left: 9,
            top: 15,
            right: 168,
            bottom: 15,
          ),
          child: Container(
            width: 213,
            height: 27,
            decoration: BoxDecoration(
              color: const Color(0xFFC1D3E9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: const Color(0xFF023F88),
                  size: 13,
                ),
                const SizedBox(width: 6),
                Text(
                  'You have completed',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    height: 1.4,
                    letterSpacing: 0.2,
                    color: const Color(0xFF023F88),
                  ),
                ),
              ],
            ),
          ),
        );

      case 'Cancelled':
        return Padding(
          padding: const EdgeInsets.only(
            left: 9,
            top: 15,
            right: 168,
            bottom: 15,
          ),
          child: Container(
            width: 213,
            height: 27,
            decoration: BoxDecoration(
              color: const Color(0xFFFDDDDD),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: const Color(0xFFF86666),
                  size: 13,
                ),
                const SizedBox(width: 6),
                Text(
                  'You canceled this hotel booking',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    height: 1.4,
                    letterSpacing: 0.2,
                    color: const Color(0xFFF86666),
                  ),
                ),
              ],
            ),
          ),
        );

      default: // Ongoing
        return Padding(
          padding: const EdgeInsets.only(
            left: 56,
            right: 68,
            top: 16,
            bottom: 16,
          ),
          child: Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(125, 31),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF023F88), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Cancel Booking',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 1.4,
                    letterSpacing: 0.2,
                    color: const Color(0xFF023F88),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(125, 31),
                  backgroundColor: const Color(0xFF023F88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                child: Text(
                  'View Ticket',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 1.4,
                    letterSpacing: 0.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
