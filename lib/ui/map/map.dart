import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Data Models ---

enum BoothCategory { internship, fullTime, freshGrads, energy, fintech }

extension BoothCategoryExt on BoothCategory {
  String get label {
    switch (this) {
      case BoothCategory.internship:
        return 'Internship';
      case BoothCategory.fullTime:
        return 'Full-Time';
      case BoothCategory.freshGrads:
        return 'Fresh Grads';
      case BoothCategory.energy:
        return 'Energy';
      case BoothCategory.fintech:
        return 'Fintech';
    }
  }

  Color get color {
    switch (this) {
      case BoothCategory.internship:
        return const Color(0xFF6366F1); // Indigo
      case BoothCategory.fullTime:
        return const Color(0xFF0EA5E9); // Sky blue
      case BoothCategory.freshGrads:
        return const Color(0xFF10B981); // Emerald
      case BoothCategory.energy:
        return const Color(0xFFF59E0B); // Amber
      case BoothCategory.fintech:
        return const Color(0xFFEF4444); // Red
    }
  }

  IconData get icon {
    switch (this) {
      case BoothCategory.internship:
        return Icons.school_rounded;
      case BoothCategory.fullTime:
        return Icons.work_rounded;
      case BoothCategory.freshGrads:
        return Icons.rocket_launch_rounded;
      case BoothCategory.energy:
        return Icons.bolt_rounded;
      case BoothCategory.fintech:
        return Icons.account_balance_rounded;
    }
  }
}

class Booth {
  final String id;
  final String name;
  final String company;
  final String description;
  final BoothCategory category;
  final Rect rect; // position on the floor map canvas
  final String? logoUrl;
  final String location;
  final List<String> tags;
  final String openHours;

  const Booth({
    required this.id,
    required this.name,
    required this.company,
    required this.description,
    required this.category,
    required this.rect,
    this.logoUrl,
    required this.location,
    this.tags = const [],
    this.openHours = '9:00 AM – 5:00 PM',
  });
}

// --- Mockup Booth Data ---
final List<Booth> _allBooths = [
  // Row A — Top section (Internship)
  Booth(
    id: 'A01',
    name: 'Booth A01',
    company: 'TechCorp Malaysia',
    description:
        'Leading software company offering internship placements for computer science and IT students. Gain hands-on experience in cloud computing, DevOps, and full-stack development.',
    category: BoothCategory.internship,
    rect: const Rect.fromLTWH(40, 60, 110, 80),
    location: 'Hall A – Row 1',
    tags: ['Cloud', 'DevOps', 'Full-Stack'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'A02',
    name: 'Booth A02',
    company: 'InnoHub Labs',
    description:
        'A research-driven startup offering 3-6 month internships in AI/ML research, data engineering, and product prototyping.',
    category: BoothCategory.internship,
    rect: const Rect.fromLTWH(170, 60, 110, 80),
    location: 'Hall A – Row 1',
    tags: ['AI/ML', 'Data', 'Research'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'A03',
    name: 'Booth A03',
    company: 'GradPath Academy',
    description:
        'Education technology platform connecting students with structured internship programs across Southeast Asia.',
    category: BoothCategory.internship,
    rect: const Rect.fromLTWH(300, 60, 110, 80),
    location: 'Hall A – Row 1',
    tags: ['EdTech', 'Mentorship'],
    openHours: '9:00 AM – 4:30 PM',
  ),

  // Row B — Full-Time
  Booth(
    id: 'B01',
    name: 'Booth B01',
    company: 'Petronas Digital',
    description:
        'Digital transformation arm of PETRONAS, hiring full-time software engineers, data scientists, and UX designers for enterprise-scale projects.',
    category: BoothCategory.fullTime,
    rect: const Rect.fromLTWH(40, 190, 110, 80),
    location: 'Hall A – Row 2',
    tags: ['Enterprise', 'Digital Transformation'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'B02',
    name: 'Booth B02',
    company: 'Grab Engineering',
    description:
        'Southeast Asia\'s leading superapp is hiring backend engineers, mobile developers, and platform engineers for its food, transport, and financial services divisions.',
    category: BoothCategory.fullTime,
    rect: const Rect.fromLTWH(170, 190, 110, 80),
    location: 'Hall A – Row 2',
    tags: ['Mobile', 'Backend', 'Superapp'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'B03',
    name: 'Booth B03',
    company: 'Accenture MY',
    description:
        'Global consulting giant with full-time roles in technology consulting, cloud strategy, and cybersecurity across Malaysian operations.',
    category: BoothCategory.fullTime,
    rect: const Rect.fromLTWH(300, 190, 110, 80),
    location: 'Hall A – Row 2',
    tags: ['Consulting', 'Cybersecurity'],
    openHours: '9:00 AM – 5:00 PM',
  ),

  // Row C — Fresh Grads
  Booth(
    id: 'C01',
    name: 'Booth C01',
    company: 'Maybank IT',
    description:
        'Malaysia\'s largest banking group recruiting fresh graduates for its digital banking, IT infrastructure, and innovation lab divisions.',
    category: BoothCategory.freshGrads,
    rect: const Rect.fromLTWH(40, 320, 110, 80),
    location: 'Hall B – Row 1',
    tags: ['Banking', 'Digital', 'Innovation'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'C02',
    name: 'Booth C02',
    company: 'FutureMakers',
    description:
        'A talent accelerator program for fresh grads — offering 12-month rotational programs in product management, engineering, and design.',
    category: BoothCategory.freshGrads,
    rect: const Rect.fromLTWH(170, 320, 110, 80),
    location: 'Hall B – Row 1',
    tags: ['Rotational', 'Product', 'Design'],
    openHours: '9:00 AM – 4:00 PM',
  ),
  Booth(
    id: 'C03',
    name: 'Booth C03',
    company: 'Dell Technologies',
    description:
        'Fresh graduate development program in systems engineering, technical support, and sales engineering with global career progression.',
    category: BoothCategory.freshGrads,
    rect: const Rect.fromLTWH(300, 320, 110, 80),
    location: 'Hall B – Row 1',
    tags: ['Systems', 'Engineering', 'Global'],
    openHours: '9:00 AM – 5:00 PM',
  ),

  // Row D — Energy
  Booth(
    id: 'D01',
    name: 'Booth D01',
    company: 'TNB Energy Services',
    description:
        'Tenaga Nasional Berhad (TNB) presenting careers in smart grid technologies, renewable energy projects, and power systems engineering.',
    category: BoothCategory.energy,
    rect: const Rect.fromLTWH(460, 60, 110, 80),
    location: 'Hall C – Row 1',
    tags: ['Smart Grid', 'Renewable', 'Power Systems'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'D02',
    name: 'Booth D02',
    company: 'Solarvest Holdings',
    description:
        'Leading solar energy company in Malaysia offering roles in project engineering, solar system design, and sustainability consulting.',
    category: BoothCategory.energy,
    rect: const Rect.fromLTWH(460, 190, 110, 80),
    location: 'Hall C – Row 2',
    tags: ['Solar', 'Sustainability', 'Engineering'],
    openHours: '9:00 AM – 4:30 PM',
  ),
  Booth(
    id: 'D03',
    name: 'Booth D03',
    company: 'Yinson GreenTech',
    description:
        'Green technology and offshore energy solutions company recruiting engineers for EV charging infrastructure and green hydrogen projects.',
    category: BoothCategory.energy,
    rect: const Rect.fromLTWH(460, 320, 110, 80),
    location: 'Hall C – Row 3',
    tags: ['EV', 'Green Hydrogen', 'Offshore'],
    openHours: '9:00 AM – 5:00 PM',
  ),

  // Row E — Fintech
  Booth(
    id: 'E01',
    name: 'Booth E01',
    company: 'Touch \'n Go eWallet',
    description:
        'Malaysia\'s most popular e-wallet and fintech platform is hiring engineers, product designers, and security analysts to shape the future of digital payments.',
    category: BoothCategory.fintech,
    rect: const Rect.fromLTWH(600, 60, 110, 80),
    location: 'Hall D – Row 1',
    tags: ['Payments', 'Mobile', 'Security'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'E02',
    name: 'Booth E02',
    company: 'Wise (TransferWise)',
    description:
        'International money transfer platform looking for Kuala Lumpur-based engineers, compliance analysts, and data scientists.',
    category: BoothCategory.fintech,
    rect: const Rect.fromLTWH(600, 190, 110, 80),
    location: 'Hall D – Row 2',
    tags: ['Payments', 'Global', 'Data Science'],
    openHours: '9:00 AM – 5:00 PM',
  ),
  Booth(
    id: 'E03',
    name: 'Booth E03',
    company: 'BigPay',
    description:
        'A homegrown Malaysian fintech offering roles in mobile development, financial product design, and regulatory compliance.',
    category: BoothCategory.fintech,
    rect: const Rect.fromLTWH(600, 320, 110, 80),
    location: 'Hall D – Row 3',
    tags: ['Mobile', 'Fintech', 'Compliance'],
    openHours: '9:00 AM – 4:30 PM',
  ),
];

// --- Floor Map Painter ---

class FloorMapPainter extends CustomPainter {
  final List<Booth> booths;
  final String? highlightedBoothId;
  final BoothCategory? selectedCategory;

  FloorMapPainter({
    required this.booths,
    this.highlightedBoothId,
    this.selectedCategory,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawGrid(canvas, size);
    _drawHallLabels(canvas);
    _drawCorridors(canvas);
    _drawBooths(canvas);
    _drawFacilities(canvas);
    _drawEntrance(canvas, size);
  }

  void _drawBackground(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFFF8FAFC);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(20),
      ),
      bgPaint,
    );

    // Outer border
    final borderPaint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(10, 10, size.width - 20, size.height - 20),
        const Radius.circular(16),
      ),
      borderPaint,
    );
  }

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFFE2E8F0).withOpacity(0.4)
      ..strokeWidth = 0.5;

    for (double x = 20; x < size.width; x += 30) {
      canvas.drawLine(Offset(x, 20), Offset(x, size.height - 20), gridPaint);
    }
    for (double y = 20; y < size.height; y += 30) {
      canvas.drawLine(Offset(20, y), Offset(size.width - 20, y), gridPaint);
    }
  }

  void _drawHallLabels(Canvas canvas) {
    final labels = [
      {'text': 'HALL A', 'offset': const Offset(180, 35)},
      {'text': 'HALL C', 'offset': const Offset(485, 35)},
      {'text': 'HALL B', 'offset': const Offset(180, 300)},
      {'text': 'HALL D', 'offset': const Offset(620, 35)},
    ];

    for (final label in labels) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: label['text'] as String,
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, label['offset'] as Offset);
    }
  }

  void _drawCorridors(Canvas canvas) {
    final corridorPaint = Paint()..color = const Color(0xFFEEF2FF);

    // Horizontal corridors
    canvas.drawRect(Rect.fromLTWH(20, 150, 420, 30), corridorPaint);
    canvas.drawRect(Rect.fromLTWH(20, 280, 700, 30), corridorPaint);

    // Vertical corridor
    canvas.drawRect(Rect.fromLTWH(420, 40, 30, 400), corridorPaint);

    // Corridor labels
    final corridorLabel = TextPainter(
      text: TextSpan(
        text: 'CORRIDOR',
        style: TextStyle(
          color: const Color(0xFFBDC7DB),
          fontSize: 8,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    corridorLabel.layout();
    corridorLabel.paint(canvas, const Offset(190, 161));
    corridorLabel.paint(canvas, const Offset(330, 288));
  }

  void _drawBooths(Canvas canvas) {
    for (final booth in booths) {
      final isHighlighted = highlightedBoothId == booth.id;
      final isDimmed =
          selectedCategory != null && booth.category != selectedCategory;

      final boothColor = isDimmed
          ? booth.category.color.withOpacity(0.15)
          : booth.category.color;

      // Shadow
      if (isHighlighted) {
        final shadowPaint = Paint()
          ..color = boothColor.withOpacity(0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            booth.rect.inflate(4),
            const Radius.circular(10),
          ),
          shadowPaint,
        );
      }

      // Booth fill
      final fillPaint = Paint()
        ..color = isDimmed
            ? boothColor.withOpacity(0.08)
            : boothColor.withOpacity(isHighlighted ? 0.25 : 0.15);
      canvas.drawRRect(
        RRect.fromRectAndRadius(booth.rect, const Radius.circular(10)),
        fillPaint,
      );

      // Booth border
      final borderPaint = Paint()
        ..color = isDimmed ? boothColor.withOpacity(0.3) : boothColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = isHighlighted ? 2.5 : 1.5;
      canvas.drawRRect(
        RRect.fromRectAndRadius(booth.rect, const Radius.circular(10)),
        borderPaint,
      );

      // Booth ID label
      final idPainter = TextPainter(
        text: TextSpan(
          text: booth.id,
          style: TextStyle(
            color: isDimmed ? boothColor.withOpacity(0.4) : boothColor,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      idPainter.layout();
      idPainter.paint(canvas, Offset(booth.rect.left + 8, booth.rect.top + 6));

      // Company name (abbreviated)
      final companyName = booth.company.length > 14
          ? '${booth.company.substring(0, 12)}..'
          : booth.company;
      final namePainter = TextPainter(
        text: TextSpan(
          text: companyName,
          style: TextStyle(
            color: isDimmed
                ? const Color(0xFF64748B).withOpacity(0.3)
                : const Color(0xFF334155),
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 2,
      );
      namePainter.layout(maxWidth: booth.rect.width - 16);
      namePainter.paint(
        canvas,
        Offset(booth.rect.left + 8, booth.rect.top + 22),
      );

      // Category icon background
      final iconBgPaint = Paint()
        ..color = isDimmed
            ? boothColor.withOpacity(0.1)
            : boothColor.withOpacity(0.2);
      canvas.drawCircle(
        Offset(booth.rect.right - 18, booth.rect.bottom - 18),
        12,
        iconBgPaint,
      );
    }
  }

  void _drawFacilities(Canvas canvas) {
    // Restroom
    _drawFacilityIcon(canvas, const Offset(435, 420), Icons.wc_rounded, 'WC');
    // Info desk
    _drawFacilityIcon(
      canvas,
      const Offset(380, 420),
      Icons.info_outline_rounded,
      'Info',
    );
    // Coffee
    _drawFacilityIcon(
      canvas,
      const Offset(500, 420),
      Icons.coffee_rounded,
      'Café',
    );
  }

  void _drawFacilityIcon(
    Canvas canvas,
    Offset center,
    IconData icon,
    String label,
  ) {
    final bgPaint = Paint()..color = const Color(0xFFE2E8F0);
    canvas.drawCircle(center, 14, bgPaint);

    final labelPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: Color(0xFF64748B),
          fontSize: 8,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    labelPainter.layout();
    labelPainter.paint(
      canvas,
      Offset(center.dx - labelPainter.width / 2, center.dy + 18),
    );

    // Draw a simple symbol in the circle
    final symbolPainter = TextPainter(
      text: TextSpan(
        text: label == 'WC'
            ? '🚻'
            : label == 'Info'
            ? 'ℹ'
            : '☕',
        style: const TextStyle(fontSize: 12),
      ),
      textDirection: TextDirection.ltr,
    );
    symbolPainter.layout();
    symbolPainter.paint(
      canvas,
      Offset(
        center.dx - symbolPainter.width / 2,
        center.dy - symbolPainter.height / 2,
      ),
    );
  }

  void _drawEntrance(Canvas canvas, Size size) {
    // Entrance arrow at bottom center
    final entrancePaint = Paint()
      ..color = const Color(0xFF0EA5E9)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final entranceX = size.width / 2;
    final entranceY = size.height - 25;

    // Arrow pointing up
    final path = Path()
      ..moveTo(entranceX - 20, entranceY + 5)
      ..lineTo(entranceX, entranceY - 8)
      ..lineTo(entranceX + 20, entranceY + 5);

    canvas.drawPath(path, entrancePaint);

    final labelPainter = TextPainter(
      text: const TextSpan(
        text: 'ENTRANCE',
        style: TextStyle(
          color: Color(0xFF0EA5E9),
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    labelPainter.layout();
    labelPainter.paint(
      canvas,
      Offset(entranceX - labelPainter.width / 2, entranceY + 8),
    );
  }

  @override
  bool shouldRepaint(covariant FloorMapPainter oldDelegate) {
    return oldDelegate.highlightedBoothId != highlightedBoothId ||
        oldDelegate.selectedCategory != selectedCategory;
  }
}

// --- Map Page Widget ---

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<BoothCategory> categories = BoothCategory.values;
  BoothCategory? selectedCategory;
  String? highlightedBoothId;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  // Canvas constants
  static const double canvasWidth = 750;
  static const double canvasHeight = 470;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Booth> get _filteredBooths {
    List<Booth> result = _allBooths;
    if (selectedCategory != null) {
      result = result.where((b) => b.category == selectedCategory).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      result = result
          .where(
            (b) =>
                b.company.toLowerCase().contains(query) ||
                b.name.toLowerCase().contains(query) ||
                b.id.toLowerCase().contains(query) ||
                b.tags.any((t) => t.toLowerCase().contains(query)),
          )
          .toList();
    }
    return result;
  }

  Booth? _hitTestBooth(Offset localPosition) {
    for (final booth in _allBooths) {
      if (booth.rect.contains(localPosition)) {
        // If a category filter is active and this booth doesn't match, skip it
        if (selectedCategory != null && booth.category != selectedCategory) {
          continue;
        }
        return booth;
      }
    }
    return null;
  }

  void _showBoothDetail(Booth booth) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _BoothDetailSheet(booth: booth),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredBooths = _filteredBooths;
    final displayCount = filteredBooths.length;
    final totalCount = _allBooths.length;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  'Floor',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: const Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Map',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: const Color.fromARGB(255, 22, 67, 171),
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

          // Subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 4, 30, 0),
            child: Text(
              'Explore booths and discover opportunities across the venue.',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF64748B),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(
              controller: _searchController,
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              hintText: 'Search booth, company, or tag...',
              hintStyle: WidgetStatePropertyAll(
                GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              leading: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.search, color: Color(0xFF94A3B8)),
              ),
              trailing: _searchQuery.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      ),
                    ]
                  : null,
              elevation: const WidgetStatePropertyAll(0),
              onChanged: (value) {
                setState(() => _searchQuery = value);
              },
            ),
          ),

          const SizedBox(height: 12),

          // Category chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // "All" chip
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    avatar: selectedCategory == null
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                    label: Text(
                      'All ($totalCount)',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    selected: selectedCategory == null,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = null;
                        highlightedBoothId = null;
                      });
                    },
                    elevation: 0,
                    selectedColor: const Color(0xFF334155),
                    backgroundColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    side: BorderSide.none,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: selectedCategory == null
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                ...categories.map((category) {
                  final isSelected = selectedCategory == category;
                  final count = _allBooths
                      .where((b) => b.category == category)
                      .length;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      avatar: isSelected
                          ? Icon(category.icon, size: 16, color: Colors.white)
                          : Icon(
                              category.icon,
                              size: 16,
                              color: category.color,
                            ),
                      label: Text(
                        '${category.label} ($count)',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategory = selected ? category : null;
                          highlightedBoothId = null;
                        });
                      },
                      elevation: 0,
                      selectedColor: category.color,
                      backgroundColor: category.color.withOpacity(0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: isSelected
                          ? BorderSide.none
                          : BorderSide(color: category.color.withOpacity(0.3)),
                      showCheckmark: false,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : category.color,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // Result count + legend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  '$displayCount booths',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: const Color(0xFF94A3B8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'Pinch to zoom • Tap booth for details',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: const Color(0xFFCBD5E1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Interactive Floor Map
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4.0,
                    boundaryMargin: const EdgeInsets.all(60),
                    child: GestureDetector(
                      onTapDown: (details) {
                        final booth = _hitTestBooth(details.localPosition);
                        if (booth != null) {
                          setState(() => highlightedBoothId = booth.id);
                          _showBoothDetail(booth);
                        } else {
                          setState(() => highlightedBoothId = null);
                        }
                      },
                      child: SizedBox(
                        width: canvasWidth,
                        height: canvasHeight,
                        child: CustomPaint(
                          painter: FloorMapPainter(
                            booths: _allBooths,
                            highlightedBoothId: highlightedBoothId,
                            selectedCategory: selectedCategory,
                          ),
                          size: const Size(canvasWidth, canvasHeight),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom legend
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Wrap(
              spacing: 12,
              runSpacing: 6,
              children: categories.map((cat) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: cat.color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      cat.label,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        color: const Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Bottom Sheet Detail ---

class _BoothDetailSheet extends StatelessWidget {
  final Booth booth;
  const _BoothDetailSheet({required this.booth});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.3,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Header with category color bar
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        booth.category.color.withOpacity(0.08),
                        booth.category.color.withOpacity(0.02),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: booth.category.color.withOpacity(0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Booth ID badge
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: booth.category.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            booth.id,
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: booth.category.color,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booth.company,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xFF1E293B),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  booth.category.icon,
                                  size: 14,
                                  color: booth.category.color,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  booth.category.label,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: booth.category.color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Info rows
                _buildInfoRow(
                  Icons.location_on_rounded,
                  'Location',
                  booth.location,
                ),
                _buildInfoRow(
                  Icons.access_time_rounded,
                  'Open Hours',
                  booth.openHours,
                ),
                _buildInfoRow(Icons.meeting_room_rounded, 'Booth', booth.name),

                const SizedBox(height: 16),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'About',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    booth.description,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      color: const Color(0xFF475569),
                      height: 1.6,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Tags
                if (booth.tags.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Tags',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: booth.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: booth.category.color.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: booth.category.color.withOpacity(0.2),
                            ),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: booth.category.color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // Action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.navigation_rounded, size: 18),
                          label: Text(
                            'Navigate',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: booth.category.color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border_rounded),
                          color: const Color(0xFF64748B),
                          padding: const EdgeInsets.all(14),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_rounded),
                          color: const Color(0xFF64748B),
                          padding: const EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF64748B)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF334155),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
