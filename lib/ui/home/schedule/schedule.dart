import 'package:flutter/material.dart';

import 'schedule_data.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int? _selectedDay;

  Widget _buildScheduleCard(ScheduleEvent event) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
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
                                event.time,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                event.title,
                                style: TextStyle(
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
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),

                              if (event.speakerName != null ||
                                  event.speakerRole != null ||
                                  event.tag != null) ...[
                                const SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (event.speakerImage != null ||
                                        event.tag != null)
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage:
                                                event.speakerImage != null
                                                ? NetworkImage(
                                                    event.speakerImage!,
                                                  )
                                                : null,
                                            child: event.speakerImage == null
                                                ? const Icon(Icons.person)
                                                : null,
                                          ),
                                          if (event.tag != null)
                                            Positioned(
                                              bottom: -6,
                                              left: -12,
                                              right: -12,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFF4EE6C4,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  event.tag!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
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
                                    if (event.speakerImage != null ||
                                        event.tag != null)
                                      const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (event.speakerName != null)
                                            Text(
                                              event.speakerName!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                              ),
                                            ),
                                          if (event.speakerName != null &&
                                              event.speakerRole != null)
                                            const SizedBox(height: 2),
                                          if (event.speakerRole != null)
                                            Text(
                                              event.speakerRole!,
                                              style: TextStyle(
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
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton.filled(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark_outline_rounded,
                            color: Colors.white,
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
              style: TextStyle(
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
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 36,
                color: const Color.fromARGB(255, 45, 96, 215),
              ),
            ),
          ),
          /*
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Text(
              'Design your career path. Connect with industry leaders in real-time sessions.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          
          */
          const SizedBox(height: 10),
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
                      style: TextStyle(
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
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
