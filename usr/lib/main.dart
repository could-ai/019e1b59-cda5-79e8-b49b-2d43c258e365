import 'package:flutter/material.dart';

void main() {
  runApp(const ResearchReportApp());
}

class ResearchReportApp extends StatelessWidget {
  const ResearchReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism Research Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppShell(),
      },
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeSection(),
    IntroductionSection(),
    MethodologySection(),
    ResultsSection(),
    ConclusionSection(),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.article_outlined), selectedIcon: Icon(Icons.article), label: 'Intro'),
    NavigationDestination(icon: Icon(Icons.science_outlined), selectedIcon: Icon(Icons.science), label: 'Method'),
    NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Results'),
    NavigationDestination(icon: Icon(Icons.check_circle_outline), selectedIcon: Icon(Icons.check_circle), label: 'Conclusion'),
  ];

  final List<NavigationRailDestination> _railDestinations = const [
    NavigationRailDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: Text('Home')),
    NavigationRailDestination(icon: Icon(Icons.article_outlined), selectedIcon: Icon(Icons.article), label: Text('Introduction')),
    NavigationRailDestination(icon: Icon(Icons.science_outlined), selectedIcon: Icon(Icons.science), label: Text('Methodology')),
    NavigationRailDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: Text('Results')),
    NavigationRailDestination(icon: Icon(Icons.check_circle_outline), selectedIcon: Icon(Icons.check_circle), label: Text('Conclusion')),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: isDesktop ? null : AppBar(
        title: const Text('Research Report'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              extended: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: _railDestinations,
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: isDesktop ? null : NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _destinations,
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text(
          'The Impact of Time Spent at Tourism Sites and Student Expenditure',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'among First-Year Tourism and Hospitality Management Undergraduates at Sabaragamuwa University of Sri Lanka',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Abstract', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(
                  'This report examines the relationship between the duration of time students spend at various tourism sites and their corresponding expenditure. Focusing on first-year undergraduates in the Tourism and Hospitality Management program at Sabaragamuwa University of Sri Lanka, the study aims to uncover spending patterns and how engagement with local tourism infrastructure impacts student budgets. The findings provide insights into the economic behavior of tourism students when acting as tourists themselves.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text('Introduction', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Text(
          'Understanding student expenditure in relation to tourism activities is crucial, particularly for students whose academic focus lies in tourism and hospitality management. These students frequently engage with tourism sites for educational purposes, leisure, and practical experience.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'The primary objective of this study is to investigate whether longer durations spent at tourism sites lead to proportionally higher expenditures among these first-year students at Sabaragamuwa University of Sri Lanka. By analyzing these variables, the research seeks to establish if there is a significant correlation and what factors drive spending at these locations.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class MethodologySection extends StatelessWidget {
  const MethodologySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text('Methodology', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Text(
          'Research Design',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'A quantitative research approach was adopted for this study to statistically analyze the relationship between time spent and expenditure.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Participants',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'The sample consisted of first-year undergraduates enrolled in the Tourism and Hospitality Management degree program at Sabaragamuwa University of Sri Lanka. Participants were selected using simple random sampling techniques.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Data Collection',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Data was gathered through structured questionnaires distributed among the selected students. The questionnaire captured details regarding the average hours spent per visit to local tourism sites and the corresponding monetary expenditure incurred during these visits, including transport, food, entrance fees, and souvenirs.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class ResultsSection extends StatelessWidget {
  const ResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text('Results', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Text(
          'The analysis of the collected data revealed several key trends regarding student behavior at tourism sites.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.arrow_right, size: 32),
          title: Text('Positive Correlation', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          subtitle: const Text('A strong positive correlation was observed between the time spent at a tourism site and the total expenditure. Students who spent more than 4 hours at a location generally reported significantly higher spending.'),
        ),
        ListTile(
          leading: const Icon(Icons.arrow_right, size: 32),
          title: Text('Primary Expenditure Categories', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          subtitle: const Text('Food and beverage accounted for the largest share of expenditure, followed closely by transportation costs to and from the sites.'),
        ),
        ListTile(
          leading: const Icon(Icons.arrow_right, size: 32),
          title: Text('Frequency vs. Duration', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          subtitle: const Text('While frequency of visits had some impact, the duration of a single visit was a stronger predictor of high expenditure.'),
        ),
      ],
    );
  }
}

class ConclusionSection extends StatelessWidget {
  const ConclusionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text('Conclusion', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Text(
          'The findings of this study confirm that there is a significant impact of the time spent at tourism sites on the expenditure of first-year Tourism and Hospitality Management undergraduates at Sabaragamuwa University of Sri Lanka.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'As the duration of a visit increases, students tend to spend more, primarily on food, beverages, and incidental activities. These insights are valuable for understanding the economic footprint of domestic tourism driven by students and can help local tourism operators better cater to the student demographic.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
