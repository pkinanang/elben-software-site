import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  // Helper method to launch URLs
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: theme.colorScheme.surfaceVariant.withOpacity(0.3), // A subtle background color
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIconButton(
                icon: FontAwesomeIcons.twitter,
                tooltip: 'Twitter',
                onPressed: () => _launchURL('https://twitter.com/'), // Replace with your URL
              ),
              const SizedBox(width: 24),
              _SocialIconButton(
                icon: FontAwesomeIcons.github,
                tooltip: 'GitHub',
                onPressed: () => _launchURL('https://github.com/'), // Replace with your URL
              ),
              const SizedBox(width: 24),
              _SocialIconButton(
                icon: FontAwesomeIcons.linkedinIn,
                tooltip: 'LinkedIn',
                onPressed: () => _launchURL('https://linkedin.com/'), // Replace with your URL
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} Elben Software. All Rights Reserved.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _SocialIconButton({required this.icon, required this.tooltip, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: IconButton(
          icon: FaIcon(icon, size: 24),
          onPressed: onPressed,
          splashRadius: 24,
        ),
      ),
    );
  }
}