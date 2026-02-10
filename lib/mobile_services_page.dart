import 'package:flutter/material.dart';
import 'quote_request_page.dart';

class MobileServicesPage extends StatelessWidget {
  const MobileServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Development Services'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Mobile App Services',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'We build custom mobile applications tailored to your business needs using modern frameworks and best practices.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _MobileServiceCard(
                    icon: Icons.style,
                    title: 'Salon App',
                    description: 'Online booking, appointment scheduling, service catalog, and customer management. Features include staff management, real-time notifications, and payment integration.',
                  ),
                  const SizedBox(height: 16),
                  _MobileServiceCard(
                    icon: Icons.cleaning_services,
                    title: 'Laundry Service App',
                    description: 'Pickup & delivery scheduling, order tracking, pricing calculator, and customer ratings. Includes SMS notifications, route optimization, and wallet features.',
                  ),
                  const SizedBox(height: 16),
                  _MobileServiceCard(
                    icon: Icons.delivery_dining,
                    title: 'Food Delivery App',
                    description: 'Restaurant catalog, real-time order tracking, payment gateway, and driver management. Features push notifications, location tracking, and multi-language support.',
                  ),
                  const SizedBox(height: 16),
                  _MobileServiceCard(
                    icon: Icons.restaurant_menu,
                    title: 'Restaurant App',
                    description: 'Digital menu, table reservations, order management, inventory tracking, and customer loyalty programs. Analytics and reporting included.',
                  ),
                  const SizedBox(height: 16),
                  _MobileServiceCard(
                    icon: Icons.cut,
                    title: 'Barber Shop Appointments',
                    description: 'Easy booking system, stylist profiles, service pricing, customer reviews, and reminder notifications. Perfect for salons and barbershops.',
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuoteRequestPage(serviceType: 'Mobile Development')));
                      },
                      style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16)),
                      child: const Text('Get a Quote for Your App'),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _MobileServiceCard({
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
