import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key, required this.title});

  final String title;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class ScheduleEvent {
  final int day;
  final String time;
  final String title;
  final String location;
  final String speakerName;
  final String speakerRole;
  final String? speakerImage;
  final String? tag;
  final bool isPrimary;

  ScheduleEvent({
    required this.day,
    required this.time,
    required this.title,
    required this.location,
    required this.speakerName,
    required this.speakerRole,
    this.speakerImage,
    this.tag,
    this.isPrimary = true,
  });
}

class _SchedulePageState extends State<SchedulePage> {
  int? _selectedDay;

  final List<ScheduleEvent> events = [
    // Day 1
    ScheduleEvent(
      day: 1,
      time: "09:00 AM — 10:30 AM",
      title: "The Future of AI in Modern Software Architecture",
      location: "Grand Ballroom A",
      speakerName: "Dr. Sarah Jenkins",
      speakerRole: "Chief Architect, Neural Systems",
      tag: "KEYNOTE",
      isPrimary: true,
      speakerImage: 'https://randomuser.me/api/portraits/women/44.jpg',
    ),
    ScheduleEvent(
      day: 1,
      time: "11:00 AM — 12:00 PM",
      title: "Scaling Frontend Engineering in Hybrid Teams",
      location: "Tech Lab 2",
      speakerName: "Marcus Chen",
      speakerRole: "Principal Engineer, WebFlow Inc.",
      isPrimary: false,
      speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
    ScheduleEvent(
      day: 1,
      time: "02:00 PM — 03:30 PM",
      title: "Flutter & Dart: The Next Chapter",
      location: "Grand Ballroom B",
      speakerName: "James Wilson",
      speakerRole: "Senior Engineer, Google",
      isPrimary: true,
      speakerImage: 'https://randomuser.me/api/portraits/men/45.jpg',
    ),

    // Day 2
    ScheduleEvent(
      day: 2,
      time: "09:30 AM — 11:00 AM",
      title: "Cloud Native Security in 2026",
      location: "Security Room 101",
      speakerName: "Elena Rodriguez",
      speakerRole: "Cybersecurity Lead, CloudSafe",
      tag: "SECURITY",
      isPrimary: true,
      speakerImage: 'https://randomuser.me/api/portraits/women/65.jpg',
    ),
    ScheduleEvent(
      day: 2,
      time: "11:30 AM — 01:00 PM",
      title: "The Rise of Distributed Databases",
      location: "Database Hall",
      speakerName: "David Kim",
      speakerRole: "CTO, DataStream",
      isPrimary: false,
      speakerImage: 'https://randomuser.me/api/portraits/men/12.jpg',
    ),
    ScheduleEvent(
      day: 2,
      time: "02:30 PM — 04:00 PM",
      title: "Design Systems for Global Scale",
      location: "Creative Corner",
      speakerName: "Sophia Martinez",
      speakerRole: "Head of Design, GlobalUX",
      isPrimary: true,
      speakerImage: 'https://randomuser.me/api/portraits/women/22.jpg',
    ),

    // Day 3
    ScheduleEvent(
      day: 3,
      time: "09:00 AM — 10:30 AM",
      title: "Quantum Computing: Reality vs Hype",
      location: "Innovation Lab",
      speakerName: "Prof. Alan Turing",
      speakerRole: "Quantum Researcher, MIT",
      tag: "RESEARCH",
      isPrimary: true,
      speakerImage: 'https://randomuser.me/api/portraits/men/78.jpg',
    ),
    ScheduleEvent(
      day: 3,
      time: "11:00 AM — 12:30 PM",
      title: "Sustainable Tech: Earth-Friendly Dev",
      location: "Eco Room",
      speakerName: "Green Dev Community",
      speakerRole: "Collaborative Session",
      isPrimary: false,
      speakerImage: 'https://randomuser.me/api/portraits/lego/1.jpg',
    ),
    ScheduleEvent(
      day: 3,
      time: "02:00 PM — 04:00 PM",
      title: "Closing Ceremony & Hackathon Awards",
      location: "Main Stage",
      speakerName: "Event Committee",
      speakerRole: "TEC 2026 Organizers",
      tag: "FINALE",
      isPrimary: true,
      speakerImage: 'https://randomuser.me/api/portraits/men/52.jpg',
    ),
  ];

  Widget _buildScheduleCard(ScheduleEvent event) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(30),
              boxShadow: event.isPrimary
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Positioned(
                    top: -60,
                    right: -30,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHigh,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.title,
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    event.location,
                                    style: GoogleFonts.plusJakartaSans(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                event.time,
                                style: GoogleFonts.plusJakartaSans(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 11,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        //backgroundColor: Colors.grey[300],
                                        child: const Icon(
                                          Icons.person,
                                          //color: Colors.grey,
                                        ),
                                      ),
                                      if (event.tag != null)
                                        Positioned(
                                          bottom: -6,
                                          left: -12,
                                          right: -12,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF4EE6C4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              event.tag!,
                                              textAlign: TextAlign.center,
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 8,
                                                    letterSpacing: 0.5,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.speakerName,
                                          style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          event.speakerRole,
                                          style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: const Color(0xFF888888),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: event.isPrimary
                                ? const Color(0xFF0052CC)
                                : const Color(0xFFE5E7EB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.star,
                            color: event.isPrimary
                                ? Colors.white
                                : const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
            child: Text(
              'Event',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w800,
                fontSize: 36,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
              'Schedule.',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w800,
                fontSize: 36,
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
                color: Theme.of(context).colorScheme.onSurface,
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
                        color: isSelected
                            ? Theme.of(
                                context,
                              ).colorScheme.surfaceContainerLowest
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedDay = selected ? index : null;
                      });
                    },
                    elevation: 1,
                    selectedShadowColor: Colors.blue,
                    selectedColor: Colors.blue,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
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
          const SizedBox(height: 20),
          Expanded(
            child: Builder(
              builder: (context) {
                final filteredEvents = _selectedDay == null
                    ? events
                    : events.where((e) => e.day == _selectedDay! + 1).toList();

                if (filteredEvents.isEmpty) {
                  return Center(
                    child: Text(
                      'No events scheduled for this day.',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    return _buildScheduleCard(filteredEvents[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
