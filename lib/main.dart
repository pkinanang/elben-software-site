import 'package:flutter/material.dart';
import 'about_page.dart';
import 'mobile_services_page.dart';
import 'web_services_page.dart';
import 'ui_ux_design_page.dart';
import 'contact_page.dart';
import 'quote_request_page.dart';
import 'footer.dart';

void main() {
  runApp(const ElbenSoftwareApp());
}

class ElbenSoftwareApp extends StatelessWidget {
  const ElbenSoftwareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elben Software',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0b98bf)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder helps us make decisions based on screen width
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/logo.png', // Make sure you have your logo here
            height: 78, // Adjust the height for your logo
          ),
        ),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(onPressed: () {}, child: const Text('Services')),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AboutPage()));
              },
              child: const Text('About'),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ContactPage()));
              },
              child: const Text('Contact'),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
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
                    'Building the Future of Code',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'World-class software engineering solutions for modern businesses.',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuoteRequestPage()));
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      ),
                      child: const Text('Get a Quote'),
                    ),
                  ),
                ],
              ),
            ),
            // Services Section
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Services',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: 320,
                            child: Card(
                              elevation: 2,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MobileServicesPage()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ServiceTile(
                                    icon: Icons.mobile_friendly,
                                    title: 'Mobile Development',
                                    description: 'Salon, Laundry, Food Delivery, Restaurant, Booking Apps & more.',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: 320,
                            child: Card(
                              elevation: 2,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WebServicesPage()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ServiceTile(
                                    icon: Icons.web,
                                    title: 'Web Developer',
                                    description: 'Responsive, accessible web apps using modern frameworks.',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: 320,
                            child: Card(
                              elevation: 2,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const UiUxDesignPage()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ServiceTile(
                                    icon: Icons.design_services,
                                    title: 'UI / UX Design',
                                    description: 'Clean interfaces focused on usability and conversion.',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Portfolio Section
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Mobile App Examples',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: _PortfolioItem(icon: Icons.style, title: 'Salon App'),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: _PortfolioItem(icon: Icons.cleaning_services, title: 'Laundry Service'),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: _PortfolioItem(icon: Icons.delivery_dining, title: 'Food Delivery'),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: _PortfolioItem(icon: Icons.restaurant_menu, title: 'Restaurant App'),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: _PortfolioItem(icon: Icons.cut, title: 'Barber Appointments'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
    );
  }
}

class _PortfolioItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _PortfolioItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
