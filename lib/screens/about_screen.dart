import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/image_generator.dart';
import '../utils/app_colors.dart';
import '../widgets/web_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return WebLayout(
      currentRoute: '/about',
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: isMobile ? 20 : 80,
        ),
        child: Column(
          children: [
            // Profile Section
            Center(
              child: Column(
                children: [
                  ImageGenerator.generateProfileAvatar(
                    UserInfoConfig.fullName,
                    size: isMobile ? 100 : 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    UserInfoConfig.fullName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: isMobile ? 20 : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    UserInfoConfig.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Bio Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: AppColors.primary),
                        const SizedBox(width: 12),
                        Text(
                          'Biographie',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      UserInfoConfig.bio,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Education Section
            Text('Formation', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),

            ...UserInfoConfig.formations.map((formation) {
              return _EducationCard(
                title: formation['title'] as String,
                institution: formation['institution'] as String,
                period: formation['period'] as String,
                description: formation['description'] as String,
              );
            }),

            const SizedBox(height: 24),

            // Stats Section
            Text(
              'En Chiffres',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: isMobile ? 20 : null,
              ),
            ),
            const SizedBox(height: 16),

            isMobile
                ? Column(
                    children: [
                      _StatCard(
                        icon: Icons.code,
                        value: '10',
                        label: 'Projets Réalisés',
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 16),
                      _StatCard(
                        icon: Icons.school,
                        value: '2',
                        label: 'Formations',
                        color: AppColors.secondary,
                      ),
                      const SizedBox(height: 16),
                      _StatCard(
                        icon: Icons.devices,
                        value: '15+',
                        label: 'Technologies',
                        color: AppColors.accent,
                      ),
                      const SizedBox(height: 16),
                      _StatCard(
                        icon: Icons.workspace_premium,
                        value: '4',
                        label: 'Niveaux Maîtrisés',
                        color: AppColors.accentOrange,
                      ),
                    ],
                  )
                : Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 160 - 48) / 2,
                        child: _StatCard(
                          icon: Icons.code,
                          value: '10',
                          label: 'Projets Réalisés',
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 160 - 48) / 2,
                        child: _StatCard(
                          icon: Icons.school,
                          value: '2',
                          label: 'Formations',
                          color: AppColors.secondary,
                        ),
                      ),
                      SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 160 - 48) / 2,
                        child: _StatCard(
                          icon: Icons.devices,
                          value: '15+',
                          label: 'Technologies',
                          color: AppColors.accent,
                        ),
                      ),
                      SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 160 - 48) / 2,
                        child: _StatCard(
                          icon: Icons.workspace_premium,
                          value: '4',
                          label: 'Niveaux Maîtrisés',
                          color: AppColors.accentOrange,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 24),

            // Journey Timeline
            Text(
              'Mon Parcours',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            _TimelineItem(
              title: 'Début Flutter',
              date: '2023',
              description: 'Découverte de Flutter et premiers projets simples',
              color: AppColors.beginner,
            ),
            _TimelineItem(
              title: 'Projets Intermédiaires',
              date: '2024',
              description:
                  'Développement d\'applications avec APIs et bases de données',
              color: AppColors.intermediate,
            ),
            _TimelineItem(
              title: 'Projets Avancés',
              date: '2024',
              description:
                  'Intégration de paiements, authentification et architectures complexes',
              color: AppColors.advanced,
            ),
            _TimelineItem(
              title: 'Niveau Expert',
              date: '2025',
              description:
                  'Plateforme e-learning complète avec toutes les fonctionnalités avancées',
              color: AppColors.expert,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String title;
  final String institution;
  final String period;
  final String description;

  const _EducationCard({
    required this.title,
    required this.institution,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.school,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        institution,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(period, style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final Color color;
  final bool isLast;

  const _TimelineItem({
    required this.title,
    required this.date,
    required this.description,
    required this.color,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 20),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: color.withOpacity(0.3),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: color),
                  ),
                  const SizedBox(height: 4),
                  Text(date, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
