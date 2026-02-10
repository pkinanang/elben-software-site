import 'package:flutter/material.dart';
import 'quote_request_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Elben Software'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primaryContainer,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Who We Are',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Crafting reliable, modern applications.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'About Us',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Elben Software crafts reliable, modern applications for businesses of all sizes. We focus on clean architecture, accessibility, and measurable outcomes.',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      // Mission/Values
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: const [
                          _ValueCard(title: 'Quality', body: 'Robust code and thorough testing.'),
                          _ValueCard(title: 'Performance', body: 'Fast, efficient user experiences.'),
                          _ValueCard(title: 'Collaboration', body: 'Clear communication with stakeholders.'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Team
                      Text('Team', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      const Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Icon(Icons.person)),
                          title: Text('Peter Kinanang'),
                          subtitle: Text('Founder • Software Engineer'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Icon(Icons.person_outline)),
                          title: Text('Design & Dev Team'),
                          subtitle: Text('Cross-functional product teams on demand.'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // CTA
                      Center(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuoteRequestPage()));
                          },
                          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16)),
                          child: const Text('Work With Us'),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final String title;
  final String body;
  const _ValueCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(body, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
