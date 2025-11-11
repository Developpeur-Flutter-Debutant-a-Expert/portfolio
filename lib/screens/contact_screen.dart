import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';
import '../utils/app_colors.dart';
import '../widgets/web_layout.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message envoyé avec succès !'),
          backgroundColor: AppColors.success,
        ),
      );

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copié dans le presse-papiers'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return WebLayout(
      currentRoute: '/contact',
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: isMobile ? 20 : 80,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Text(
                  'Restons en Contact',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 28 : null,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'N\'hésitez pas à me contacter pour toute collaboration ou question',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Contact Info Cards
                _ContactInfoCard(
                  icon: Icons.email,
                  title: 'Email',
                  value: UserInfoConfig.email,
                  color: AppColors.primary,
                  onTap: () => _copyToClipboard(UserInfoConfig.email, 'Email'),
                ),
                const SizedBox(height: 12),

                _ContactInfoCard(
                  icon: Icons.phone,
                  title: 'Téléphone',
                  value: UserInfoConfig.phone,
                  color: AppColors.secondary,
                  onTap: () =>
                      _copyToClipboard(UserInfoConfig.phone, 'Téléphone'),
                ),
                const SizedBox(height: 32),

                // Social Links
                Text(
                  'Réseaux Sociaux',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),

                isMobile
                    ? Column(
                        children: [
                          _SocialCard(
                            icon: Icons.code,
                            label: 'GitHub',
                            color: AppColors.textPrimary,
                            onTap: () {},
                          ),
                          const SizedBox(height: 12),
                          _SocialCard(
                            icon: Icons.work,
                            label: 'LinkedIn',
                            color: const Color(0xFF0A66C2),
                            onTap: () {},
                          ),
                          const SizedBox(height: 12),
                          _SocialCard(
                            icon: Icons.telegram,
                            label: 'Telegram',
                            color: const Color(0xFF0088CC),
                            onTap: () {},
                          ),
                          const SizedBox(height: 12),
                          _SocialCard(
                            icon: Icons.phone,
                            label: 'WhatsApp',
                            color: const Color(0xFF25D366),
                            onTap: () {},
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: _SocialCard(
                              icon: Icons.code,
                              label: 'GitHub',
                              color: AppColors.textPrimary,
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _SocialCard(
                              icon: Icons.work,
                              label: 'LinkedIn',
                              color: const Color(0xFF0A66C2),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _SocialCard(
                              icon: Icons.telegram,
                              label: 'Telegram',
                              color: const Color(0xFF0088CC),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _SocialCard(
                              icon: Icons.phone,
                              label: 'WhatsApp',
                              color: const Color(0xFF25D366),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 32),

                // Contact Form
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Envoyez-moi un Message',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),

                          // Name Field
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Nom complet',
                              hintText: 'Votre nom',
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre nom';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Email Field
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'votre.email@example.com',
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre email';
                              }
                              if (!value.contains('@')) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Message Field
                          TextFormField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              labelText: 'Message',
                              hintText: 'Votre message...',
                              prefixIcon: Icon(Icons.message),
                              alignLabelWithHint: true,
                            ),
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer un message';
                              }
                              if (value.length < 10) {
                                return 'Le message doit contenir au moins 10 caractères';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),

                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _submitForm,
                              icon: const Icon(Icons.send),
                              label: const Text('Envoyer le Message'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 4),
                    Text(value, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              const Icon(Icons.content_copy, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _SocialCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(label, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}
