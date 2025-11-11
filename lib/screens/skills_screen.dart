import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/app_colors.dart';
import '../widgets/web_layout.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return WebLayout(
      currentRoute: '/skills',
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: isMobile ? 20 : 80,
        ),
        child: Column(
          children: [
          Text(
            'Compétences Techniques',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 28 : null,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Technologies et outils que je maîtrise',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 40),
          // Languages
          _SkillSection(
            title: 'Langages de Programmation',
            icon: Icons.code,
            color: AppColors.primary,
            skills: UserInfoConfig.skills['languages'] as List<String>,
          ),
          const SizedBox(height: 24),

          // Frameworks
          _SkillSection(
            title: 'Frameworks & Bibliothèques',
            icon: Icons.layers,
            color: AppColors.secondary,
            skills: UserInfoConfig.skills['frameworks'] as List<String>,
          ),
          const SizedBox(height: 24),

          // Tools
          _SkillSection(
            title: 'Outils & Technologies',
            icon: Icons.build,
            color: AppColors.accent,
            skills: UserInfoConfig.skills['tools'] as List<String>,
          ),
          const SizedBox(height: 24),

          // Concepts
          _SkillSection(
            title: 'Concepts & Architectures',
            icon: Icons.architecture,
            color: AppColors.accentOrange,
            skills: UserInfoConfig.skills['concepts'] as List<String>,
          ),
          const SizedBox(height: 24),

          // Skill Progress Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progression',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _SkillProgress(
                    label: 'Flutter / Dart',
                    progress: 0.9,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 12),
                  _SkillProgress(
                    label: 'Firebase',
                    progress: 0.85,
                    color: AppColors.accentOrange,
                  ),
                  const SizedBox(height: 12),
                  _SkillProgress(
                    label: 'State Management',
                    progress: 0.8,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(height: 12),
                  _SkillProgress(
                    label: 'REST APIs',
                    progress: 0.85,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 12),
                  _SkillProgress(
                    label: 'UI/UX Design',
                    progress: 0.75,
                    color: AppColors.accentPink,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _SkillSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;

  const _SkillSection({
    required this.title,
    required this.icon,
    required this.color,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 12),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) {
            return Chip(
              label: Text(skill),
              backgroundColor: color.withOpacity(0.1),
              side: BorderSide(color: color.withOpacity(0.3)),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SkillProgress extends StatelessWidget {
  final String label;
  final double progress;
  final Color color;

  const _SkillProgress({
    required this.label,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '${(progress * 100).toInt()}%',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
