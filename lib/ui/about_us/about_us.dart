import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        left: _selectedIndex == 0 ? 0 : width / 2,
                        right: _selectedIndex == 1 ? 0 : width / 2,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: theme.colorScheme.primary.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                                _pageController.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: _selectedIndex == 0
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.onSurface,
                                    fontWeight: _selectedIndex == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  child: const Text('Overview'),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                                _pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: _selectedIndex == 1
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.onSurface,
                                    fontWeight: _selectedIndex == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  child: const Text('Milestone'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                _buildOverviewTab(theme),
                _buildMilestoneTab(theme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Icon(Icons.info_outline, size: 64, color: theme.colorScheme.primary),
        const SizedBox(height: 24),
        Text(
          'About TEC26',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'The Technology Exhibition and Conference (TEC) 2026 is the premier event for showcasing cutting-edge technological innovations and connecting industry leaders, startups, and tech enthusiasts.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildInfoCard(
          theme,
          title: 'Our Mission',
          content: 'To foster collaboration and drive technological advancement by providing a platform for networking, learning, and discovery.',
          icon: Icons.rocket_launch,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          theme,
          title: 'Our Vision',
          content: 'To be the catalyst for the next generation of technological breakthroughs that will shape our future.',
          icon: Icons.visibility,
        ),
      ],
    );
  }

  Widget _buildMilestoneTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text(
          'Our Journey',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildMilestoneItem(
          theme,
          year: '2024',
          title: 'The Beginning',
          description: 'TEC was conceptualized and the first planning committee was formed.',
          isFirst: true,
        ),
        _buildMilestoneItem(
          theme,
          year: '2025',
          title: 'Growing Partnerships',
          description: 'Secured major partnerships with leading tech companies and universities.',
        ),
        _buildMilestoneItem(
          theme,
          year: '2026',
          title: 'TEC26 Event',
          description: 'The inaugural TEC event opens its doors to thousands of attendees globally.',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildInfoCard(ThemeData theme, {required String title, required String content, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: theme.colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneItem(
    ThemeData theme, {
    required String year,
    required String title,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 2,
                height: 24,
                color: isFirst ? Colors.transparent : theme.colorScheme.primary.withOpacity(0.5),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  year,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : theme.colorScheme.primary.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0, top: 20.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.outlineVariant.withOpacity(0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
