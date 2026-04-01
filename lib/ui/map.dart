import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: SearchBar(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              hintText: 'Search',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
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
