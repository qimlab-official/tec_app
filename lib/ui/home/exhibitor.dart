import 'package:flutter/material.dart';

class Exhibitor {
  final String name;
  final String logo;
  final List<String> industries;
  final String booth;
  final bool isHiring;
  final bool hasRoles;
  final Color? color;

  Exhibitor({
    required this.name,
    required this.logo,
    required this.industries,
    required this.booth,
    this.isHiring = false,
    this.hasRoles = false,
    this.color,
  });
}

class ExhibitorPage extends StatefulWidget {
  const ExhibitorPage({super.key, required this.title});

  final String title;

  @override
  State<ExhibitorPage> createState() => _ExhibitorPageState();
}

class _ExhibitorPageState extends State<ExhibitorPage> {
  final List<String> categories = [
    'All',
    'Software',
    'AI & ML',
    'Fintech',
    'Energy',
    'Robotica',
  ];
  String selectedCategory = 'All';

  final List<Exhibitor> exhibitors = [
    Exhibitor(
      name: 'Nexus AI',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['Artificial Intelligence', 'Cloud Systems'],
      booth: 'Booth A-12',
      isHiring: true,
      hasRoles: true,
      color: Colors.blue[100],
    ),
    Exhibitor(
      name: 'EcoStream',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['SustainTech', 'Data Visualization'],
      booth: 'Booth C-04',
      isHiring: false,
      hasRoles: false,
      color: Colors.teal[100],
    ),
    Exhibitor(
      name: 'VaultCore',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['Fintech', 'Cybersecurity'],
      booth: 'Booth B-21',
      isHiring: true,
      hasRoles: true,
      color: Colors.purple[100],
    ),
    Exhibitor(
      name: 'Kinetica',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['Robotics', 'Automation'],
      booth: 'Booth D-15',
      isHiring: false,
      hasRoles: false,
      color: Colors.orange[100],
    ),
    Exhibitor(
      name: 'HealthPixel',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['HealthTech', 'Software Engineering'],
      booth: 'Booth A-08',
      isHiring: true,
      hasRoles: true,
      color: Colors.red[100],
    ),
    Exhibitor(
      name: 'QuantumFlow',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['Software', 'Cloud Infrastructure'],
      booth: 'Booth E-02',
      isHiring: true,
      hasRoles: true,
      color: Colors.indigo[100],
    ),
    Exhibitor(
      name: 'AetherAI',
      logo: 'https://placehold.jp/150x150.png',
      industries: ['AI & ML', 'Deep Learning'],
      booth: 'Booth F-11',
      isHiring: false,
      hasRoles: false,
      color: Colors.lightBlue[100],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Exhibitors',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 36,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                            color: const Color(0xFF1643AB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.surfaceContainerLow,
                ),
                // controller: _searchController,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                hintText: 'Search booth, company, or tag...',
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(
                    // color: const Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                leading: Icon(Icons.search),

                elevation: const WidgetStatePropertyAll(0),
                onChanged: (value) {
                  setState(() {
                    //_searchQuery = value;
                  });
                },
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: categories.map((category) {
                    final isSelected = selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ChoiceChip(
                        label: Text(
                          category,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        elevation: 0,
                        selectedColor: const Color(0xFF4A80F0),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHigh,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide.none,
                        showCheckmark: false,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF666666),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Exhibitor List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemCount: exhibitors.length,
                itemBuilder: (context, index) {
                  final exhibitor = exhibitors[index];
                  // Basic filtering for demo
                  if (selectedCategory != 'All' &&
                      !exhibitor.industries.any(
                        (i) => i.contains(selectedCategory),
                      )) {
                    return const SizedBox.shrink();
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Logo Placeholder
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  exhibitor.logo,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.business,
                                        //color: Colors.grey,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            // Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        exhibitor.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                        ),
                                      ),
                                      if (exhibitor.isHiring) ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF9FFFE0),
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Text(
                                            'HIRING',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: const Color(0xFF00A272),
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exhibitor.industries.join(' • '),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Footer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  exhibitor.booth,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: exhibitor.hasRoles
                                    ? const Color(0xFF0059C1)
                                    : Colors.grey[200],
                                foregroundColor: exhibitor.hasRoles
                                    ? Colors.white
                                    : Colors.black87,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              child: Text(
                                exhibitor.hasRoles ? 'View Roles' : 'Details',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
