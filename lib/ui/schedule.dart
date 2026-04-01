import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key, required this.title});

  final String title;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text(
              'Event',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 45,
                color: const Color.fromARGB(255, 46, 46, 46),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              'Schedule.',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 45,
                color: const Color.fromARGB(255, 22, 67, 171),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Text(
              'Design your career path. Connect with industry leaders in real-time sessions.',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: const Color.fromARGB(255, 78, 78, 78),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: List.generate(3, (index) {
                final isSelected = _selectedDay == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ChoiceChip(
                    label: Text(
                      'Day ${index + 1}',
                      style: GoogleFonts.plusJakartaSans(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedDay = index;
                      });
                    },
                    elevation: 1,
                    selectedShadowColor: Colors.blue,
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    side: BorderSide.none,
                    showCheckmark: false,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
