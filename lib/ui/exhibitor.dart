import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExhibitorPage extends StatefulWidget {
  const ExhibitorPage({super.key, required this.title});

  final String title;

  @override
  State<ExhibitorPage> createState() => _ExhibitorPageState();
}

class _ExhibitorPageState extends State<ExhibitorPage> {
  final List<String> categories = [
    'Internship',
    'Full-Time',
    'Fresh Grads',
    'Energy',
    'Fintech',
  ];
  String selectedCategory = 'Internship';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  'Exhibitor',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: const Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                Text(
                  '.',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: const Color.fromARGB(255, 22, 67, 171),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20, 15, 20, 15),
            child: SearchBar(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              hintText: 'Search',
              leading: const Icon(Icons.search),
              elevation: WidgetStatePropertyAll(0),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: categories.map((category) {
                final isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = category;
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

                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
