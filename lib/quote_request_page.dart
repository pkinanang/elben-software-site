import 'package:flutter/material.dart';

class QuoteRequestPage extends StatefulWidget {
  final String? serviceType;

  const QuoteRequestPage({super.key, this.serviceType});

  @override
  State<QuoteRequestPage> createState() => _QuoteRequestPageState();
}

class _QuoteRequestPageState extends State<QuoteRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _descriptionController = TextEditingController();

  late String _selectedService;
  late String _selectedBudget;
  late String _selectedTimeline;

  @override
  void initState() {
    super.initState();
    _selectedService = widget.serviceType ?? 'Mobile Development';
    _selectedBudget = '\$5,000 - \$10,000';
    _selectedTimeline = '1-3 months';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get a Quote')),
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
                    'Request a Quote',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tell us about your project and we\'ll provide a custom quote.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Quote Form
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          'Project Details',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        // Name Field
                        MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              hintText: 'John Doe',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Email Field
                        MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              hintText: 'john@example.com',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Company Field
                        MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: TextFormField(
                            controller: _companyController,
                            decoration: InputDecoration(
                              labelText: 'Company Name',
                              hintText: 'Your Company',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.business),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter company name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Service Type Dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedService,
                          decoration: InputDecoration(
                            labelText: 'Service Type',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(Icons.category),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'Mobile Development', child: Text('Mobile Development')),
                            DropdownMenuItem(value: 'Web Development', child: Text('Web Development')),
                            DropdownMenuItem(value: 'UI / UX Design', child: Text('UI / UX Design')),
                            DropdownMenuItem(value: 'CRM Solution', child: Text('CRM Solution')),
                            DropdownMenuItem(value: 'E-Commerce', child: Text('E-Commerce')),
                            DropdownMenuItem(value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedService = value;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        // Budget Dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedBudget,
                          decoration: InputDecoration(
                            labelText: 'Budget Range',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(Icons.money),
                          ),
                          items: const [
                            DropdownMenuItem(value: '\$5,000 - \$10,000', child: Text('\$5,000 - \$10,000')),
                            DropdownMenuItem(value: '\$10,000 - \$25,000', child: Text('\$10,000 - \$25,000')),
                            DropdownMenuItem(value: '\$25,000 - \$50,000', child: Text('\$25,000 - \$50,000')),
                            DropdownMenuItem(value: '\$50,000+', child: Text('\$50,000+')),
                            DropdownMenuItem(value: 'Not sure yet', child: Text('Not sure yet')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedBudget = value;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        // Timeline Dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedTimeline,
                          decoration: InputDecoration(
                            labelText: 'Project Timeline',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(Icons.schedule),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'ASAP', child: Text('ASAP')),
                            DropdownMenuItem(value: '1-3 months', child: Text('1-3 months')),
                            DropdownMenuItem(value: '3-6 months', child: Text('3-6 months')),
                            DropdownMenuItem(value: '6+ months', child: Text('6+ months')),
                            DropdownMenuItem(value: 'Not decided', child: Text('Not decided')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedTimeline = value;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        // Project Description
                        MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Project Description',
                              hintText: 'Tell us about your project, goals, and any specific requirements...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.description),
                            ),
                            maxLines: 6,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please describe your project';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Submit Button
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Quote request submitted! We\'ll contact you within 24 hours.'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                _nameController.clear();
                                _emailController.clear();
                                _companyController.clear();
                                _descriptionController.clear();
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.of(context).pop();
                                });
                              }
                            },
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Submit Quote Request', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
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
