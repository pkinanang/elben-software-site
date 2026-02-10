import 'package:flutter/material.dart';
import 'quote_request_page.dart';

class UiUxDesignPage extends StatelessWidget {
  const UiUxDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI / UX Design Services')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
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
                    'UI / UX Design',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'User-centered Design for Digital Excellence',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuoteRequestPage(serviceType: 'UI / UX Design')));
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                    ),
                    child: const Text('Get a Design Quote'),
                  ),
                ],
              ),
            ),
            // Services Detail
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'Our Design Services',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _DesignServiceCard(
                        icon: Icons.design_services,
                        title: 'User Research & Strategy',
                        description:
                            'In-depth user research, competitive analysis, and strategic planning to understand your audience and market. We create detailed user personas and journey maps.',
                      ),
                      const SizedBox(height: 16),
                      _DesignServiceCard(
                        icon: Icons.palette,
                        title: 'Visual Design',
                        description:
                            'Modern, beautiful interfaces with consistent branding, typography, and color systems. Our designs are both aesthetic and functional.',
                      ),
                      const SizedBox(height: 16),
                      _DesignServiceCard(
                        icon: Icons.touch_app,
                        title: 'Interaction Design',
                        description:
                            'Smooth, intuitive interactions and animations. Every element is designed for optimal user engagement and conversion.',
                      ),
                      const SizedBox(height: 16),
                      _DesignServiceCard(
                        icon: Icons.phone_iphone,
                        title: 'Responsive Design',
                        description:
                            'Designs that work seamlessly across all devices—mobile, tablet, and desktop. One design system, infinite possibilities.',
                      ),
                      const SizedBox(height: 16),
                      _DesignServiceCard(
                        icon: Icons.code,
                        title: 'Build Prototype',
                        description:
                            'Interactive prototypes and clickable mockups. We bring designs to life with working prototypes that you can test and validate with users.',
                      ),
                      const SizedBox(height: 32),
                      // Design Process
                      Text(
                        'Our Design Process',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          _ProcessStep(step: '01', title: 'Discover', description: 'Research & Strategy'),
                          _ProcessStep(step: '02', title: 'Design', description: 'Wireframes & Mockups'),
                          _ProcessStep(step: '03', title: 'Prototype', description: 'Interactive Testing'),
                          _ProcessStep(step: '04', title: 'Deliver', description: 'Hand-off & Support'),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuoteRequestPage(serviceType: 'UI / UX Design')));
                          },
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                          ),
                          child: const Text('Start Your Design Project'),
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

class _DesignServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _DesignServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String step;
  final String title;
  final String description;

  const _ProcessStep({
    required this.step,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    step,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
