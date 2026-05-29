import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/ongoing_page.dart';
import 'pages/completed_page.dart';
import 'pages/cancelled_page.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Color _tabTextColor(int tabIndex) {
    double distance = (_currentPage - tabIndex).abs();

    // If tab is far away, just show blue text
    if (distance > 1) return const Color(0xFF023F88);

    // Mix white and blue text based on distance
    // Active tab = white text (on blue background)
    // Inactive tab = blue text (on white background)
    return Color.lerp(
      Colors.white, // start color = white text
      const Color(0xFF023F88), // end color = blue text
      distance, // how much to mix
    )!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF023F88),
        toolbarHeight: 117,
        titleSpacing: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 39, top: 69, bottom: 20, right: 22),
          child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 22,
            top: 62,
            right: 69,
            bottom: 13,
          ),
          child: Text(
            'My Booking',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 1.4,
              letterSpacing: 0.2,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 27,
          bottom: 52,
        ),
        child: Column(
          children: [
            // Tab Buttons
            // Tab Buttons
            SizedBox(
              height: 31,
              child: Stack(
                children: [
                  // Sliding Pill
                  AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      // Tab widths and positions
                      final List<double> tabWidths = [110, 128, 128];
                      final List<double> tabPositions = [
                        0,
                        110 + 14,
                        110 + 14 + 128 + 14,
                      ];

                      double page = _currentPage.clamp(0, 2);
                      int currentIndex = page.floor();
                      double fraction = page - currentIndex;

                      double startX = tabPositions[currentIndex];
                      double startWidth = tabWidths[currentIndex];

                      double endX = currentIndex < 2
                          ? tabPositions[currentIndex + 1]
                          : startX;
                      double endWidth = currentIndex < 2
                          ? tabWidths[currentIndex + 1]
                          : startWidth;

                      double pillX = startX + (endX - startX) * fraction;
                      double pillWidth =
                          startWidth + (endWidth - startWidth) * fraction;

                      return Positioned(
                        left: pillX,
                        child: Container(
                          width: pillWidth,
                          height: 31,
                          decoration: BoxDecoration(
                            color: const Color(0xFF023F88),
                            borderRadius: BorderRadius.circular(15.5),
                            border: Border.all(color: const Color(0xFF023F88)),
                          ),
                        ),
                      );
                    },
                  ),

                  // Tab Labels
                  Row(
                    children: [
                      // Ongoing
                      GestureDetector(
                        onTap: () => _onTabTapped(0),
                        child: Container(
                          width: 110,
                          height: 31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.5),
                            border: Border.all(color: const Color(0xFF023F88)),
                          ),
                          child: Center(
                            child: Text(
                              'Ongoing',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: _tabTextColor(0),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Completed
                      GestureDetector(
                        onTap: () => _onTabTapped(1),
                        child: Container(
                          width: 128,
                          height: 31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.5),
                            border: Border.all(color: const Color(0xFF023F88)),
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: _tabTextColor(1),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Cancelled
                      GestureDetector(
                        onTap: () => _onTabTapped(2),
                        child: Container(
                          width: 128,
                          height: 31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.5),
                            border: Border.all(color: const Color(0xFF023F88)),
                          ),
                          child: Center(
                            child: Text(
                              'Cancelled',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: _tabTextColor(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 23),

            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  OngoingPage(),
                  CompletedPage(),
                  CancelledPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
