import 'package:flutter/material.dart';
import 'quote_request_page.dart';

class WebServicesPage extends StatelessWidget {
  const WebServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Development Services'),
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
                    'Web Development Services',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We create powerful, responsive web solutions designed for modern businesses.',
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
                      const SizedBox(height: 12),
                      _WebServiceCard(
                        icon: Icons.language,
                        title: 'Website Development',
                        description: 'Custom responsive websites built with modern frameworks like React, Vue, and Next.js. Includes SEO optimization, fast loading times, and mobile-first design. Perfect for portfolios, blogs, and business websites.',
                      ),
                      const SizedBox(height: 16),
                      _WebServiceCard(
                        icon: Icons.business,
                        title: 'CRM Solution',
                        description: 'Enterprise Customer Relationship Management systems tailored to your workflow. Features include contact management, sales tracking, email integration, reporting analytics, and task automation. Improve customer relationships and boost sales.',
                      ),
                      const SizedBox(height: 16),
                      _WebServiceCard(
                        icon: Icons.shopping_cart,
                        title: 'E-Commerce',
                        description: 'Full-featured online stores with product catalogs, inventory management, secure payment processing, and order tracking. Integration with Stripe, PayPal, and major marketplaces. Includes analytics and customer review systems.',
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuoteRequestPage(serviceType: 'Web Development')));
                          },
                          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16)),
                          child: const Text('Request a Web Solution'),
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

class _WebServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _WebServiceCard({
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
