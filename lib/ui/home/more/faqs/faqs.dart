import 'package:flutter/material.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

class FaqSection {
  final String title;
  final List<FaqItem> items;

  FaqSection({required this.title, required this.items});
}

class _FaqsPageState extends State<FaqsPage> {
  final List<FaqSection> _sections = [
    FaqSection(
      title: 'General Information',
      items: [
        FaqItem(
          question: 'What is TEC 26?',
          answer:
              'Technology and Engineering Career Fair (TEC) is an annual event connecting students and alumni with top companies in the technology and engineering sectors.',
        ),
        FaqItem(
          question: 'Who can attend the career fair?',
          answer:
              'The event is open to the public. University students, fresh graduates, and experienced professionals are all welcome to attend.',
        ),
        FaqItem(
          question: 'Is there any entrance fee to attend?',
          answer:
              'No, admission to the career fair is completely free for all attendees.',
        ),
      ],
    ),
    FaqSection(
      title: 'Before Career Fair',
      items: [
        FaqItem(
          question: 'Do I need to register before the event?',
          answer:
              'Yes, prior registration is highly recommended. You can register directly through our app or website to get your entry QR code and avoid long queues.',
        ),
        FaqItem(
          question: 'What should I prepare before attending?',
          answer:
              'Prepare multiple copies of your updated resume, practice your elevator pitch, and research the companies you are interested in visiting. Updating your digital profile on the app is also recommended.',
        ),
        FaqItem(
          question: 'What is the dress code?',
          answer:
              'Business professional or smart casual attire is highly recommended. First impressions matter, so dress to impress potential employers!',
        ),
      ],
    ),
    FaqSection(
      title: 'During the Career Fair',
      items: [
        FaqItem(
          question: 'How do I find specific company booths?',
          answer:
              'You can use the interactive floor map feature in this app to locate specific company booths easily and plan your route.',
        ),
        FaqItem(
          question: 'Can I submit my resume digitally?',
          answer:
              'Yes, many returning and new exhibitors accept digital resumes. You can easily share your profile or link to your resume via the app\'s QR code scanning feature.',
        ),
        FaqItem(
          question: 'Are there any events happening besides booth visits?',
          answer:
              'Yes! We host various talks, resume review sessions, and the Career Development Series throughout the event. Be sure to check the schedule section in the app.',
        ),
      ],
    ),
    FaqSection(
      title: 'After the Career Fair',
      items: [
        FaqItem(
          question: 'When should I follow up with companies?',
          answer:
              'It is a good practice to send a thank-you email or a follow-up message on LinkedIn within 24 to 48 hours after meeting a recruiter to express your continued interest.',
        ),
        FaqItem(
          question: 'Where can I find interview resources?',
          answer:
              'We provide various resources in the "Career Development Series" section of the app to help you prepare effectively for both technical and HR interviews.',
        ),
        FaqItem(
          question: 'How do I know if I am shortlisted?',
          answer:
              'Companies will typically reach out to you directly via the email or phone number you provided during the fair or on your resume. Keep an eye on your inbox!',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
                bottom: 8.0,
              ),
              child: Text(
                'Frequently Asked Questions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Text(
                'Find answers to common questions about the event, preparation, and what to expect.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final section = _sections[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        section.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: section.items.length,
                      itemBuilder: (context, itemIndex) {
                        final item = section.items[itemIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 6.0,
                          ),
                          child: Card(
                            elevation: 0,
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: ExpansionTile(
                                childrenPadding: const EdgeInsets.fromLTRB(
                                  20.0,
                                  0.0,
                                  20.0,
                                  20.0,
                                ),
                                collapsedIconColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                iconColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                title: Text(
                                  item.question,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                ),
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      item.answer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                            height: 1.5,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }, childCount: _sections.length),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 32.0)),
        ],
      ),
    );
  }
}
