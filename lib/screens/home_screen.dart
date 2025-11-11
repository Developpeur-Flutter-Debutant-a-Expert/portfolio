import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/app_colors.dart';
import '../data/projects_data.dart';
import '../widgets/web_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            const WebNavBar(currentRoute: '/'),

            // Hero Section
            _HeroSection(),

            // Stats Section
            const _StatsSection(),

            // Projects Preview
            _ProjectsPreview(),

            // Skills Section
            const _SkillsSection(),

            // CTA Section
            const _CTASection(),

            // Footer
            const WebFooter(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 120),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.05),
            AppColors.secondary.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: WebContainer(
        child: isMobile ? _MobileHeroContent() : _DesktopHeroContent(),
      ),
    );
  }
}

class _DesktopHeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bonjour, je suis',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                UserInfoConfig.fullName,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                UserInfoConfig.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 500,
                child: Text(
                  UserInfoConfig.bio,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/projects'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      elevation: 0,
                    ),
                    child: const Text('Voir mes projets'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/contact'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                    ),
                    child: const Text('Me contacter'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 60),
        // Right - Avatar
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Center(
            child: Text(
              _getInitials(UserInfoConfig.fullName),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 120,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getInitials(String fullName) {
    final names = fullName.trim().split(' ');
    if (names.isEmpty) return '?';
    if (names.length == 1) return names[0][0].toUpperCase();
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }
}

class _MobileHeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Center(
            child: Text(
              _getInitials(UserInfoConfig.fullName),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Content
        Text(
          'Bonjour, je suis',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          UserInfoConfig.fullName,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          UserInfoConfig.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          UserInfoConfig.bio,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700], height: 1.6),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/projects'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: const Text('Voir mes projets'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/contact'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Me contacter'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getInitials(String fullName) {
    final names = fullName.trim().split(' ');
    if (names.isEmpty) return '?';
    if (names.length == 1) return names[0][0].toUpperCase();
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80),
      color: Colors.white,
      child: WebContainer(
        child: isMobile
            ? Column(
                children: [
                  _StatCard(
                    number: '10',
                    label: 'Projets\nRéalisés',
                    icon: Icons.rocket_launch,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 24),
                  _StatCard(
                    number: '4',
                    label: 'Niveaux de\nMaîtrise',
                    icon: Icons.trending_up,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(height: 24),
                  _StatCard(
                    number: '15+',
                    label: 'Technologies\nUtilisées',
                    icon: Icons.code,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 24),
                  _StatCard(
                    number: '2+',
                    label: 'Années\nExpérience',
                    icon: Icons.workspace_premium,
                    color: AppColors.accentOrange,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatCard(
                    number: '10',
                    label: 'Projets\nRéalisés',
                    icon: Icons.rocket_launch,
                    color: AppColors.primary,
                  ),
                  _StatCard(
                    number: '4',
                    label: 'Niveaux de\nMaîtrise',
                    icon: Icons.trending_up,
                    color: AppColors.secondary,
                  ),
                  _StatCard(
                    number: '15+',
                    label: 'Technologies\nUtilisées',
                    icon: Icons.code,
                    color: AppColors.accent,
                  ),
                  _StatCard(
                    number: '2+',
                    label: 'Années\nExpérience',
                    icon: Icons.workspace_premium,
                    color: AppColors.accentOrange,
                  ),
                ],
              ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 40, color: color),
        ),
        const SizedBox(height: 16),
        Text(
          number,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}

class _ProjectsPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final featuredProjects = projects.take(6).toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80),
      color: Colors.grey[50],
      child: WebContainer(
        child: Column(
          children: [
            Text(
              'Projets Réalisés',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 28 : null,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Une progression du niveau débutant à expert',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile ? 32 : 60),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                childAspectRatio: isMobile ? 1.3 : 1.1,
                crossAxisSpacing: isMobile ? 0 : 30,
                mainAxisSpacing: isMobile ? 16 : 30,
              ),
              itemCount: featuredProjects.length,
              itemBuilder: (context, index) {
                final project = featuredProjects[index];
                return _ProjectCard(project: project, index: index + 1);
              },
            ),
            SizedBox(height: isMobile ? 32 : 60),
            isMobile
                ? SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/projects'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Voir tous les projets'),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/projects'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                    ),
                    child: const Text('Voir tous les projets'),
                  ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final dynamic project;
  final int index;

  const _ProjectCard({required this.project, required this.index});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  Color _getLevelColor() {
    switch (widget.project.level) {
      case 'Débutant':
        return AppColors.beginner;
      case 'Intermédiaire':
        return AppColors.intermediate;
      case 'Avancé':
        return AppColors.advanced;
      case 'Expert':
        return AppColors.expert;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.15 : 0.08),
              blurRadius: _isHovered ? 30 : 15,
              offset: Offset(0, _isHovered ? 15 : 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image/Gradient
              Container(
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _getLevelColor(),
                      _getLevelColor().withValues(alpha: 0.7),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.project.level,
                          style: TextStyle(
                            color: _getLevelColor(),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.index.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.3),
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.project.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80),
      color: Colors.white,
      child: WebContainer(
        child: Column(
          children: [
            Text(
              'Compétences Techniques',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 28 : null,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile ? 32 : 60),
            isMobile
                ? Column(
                    children: [
                      _SkillCategory(
                        title: 'Langages',
                        icon: Icons.code,
                        color: AppColors.primary,
                        skills:
                            UserInfoConfig.skills['languages'] as List<String>,
                      ),
                      const SizedBox(height: 32),
                      _SkillCategory(
                        title: 'Frameworks',
                        icon: Icons.layers,
                        color: AppColors.secondary,
                        skills:
                            UserInfoConfig.skills['frameworks'] as List<String>,
                      ),
                      const SizedBox(height: 32),
                      _SkillCategory(
                        title: 'Outils',
                        icon: Icons.build,
                        color: AppColors.accent,
                        skills: UserInfoConfig.skills['tools'] as List<String>,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _SkillCategory(
                          title: 'Langages',
                          icon: Icons.code,
                          color: AppColors.primary,
                          skills:
                              UserInfoConfig.skills['languages']
                                  as List<String>,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: _SkillCategory(
                          title: 'Frameworks',
                          icon: Icons.layers,
                          color: AppColors.secondary,
                          skills:
                              UserInfoConfig.skills['frameworks']
                                  as List<String>,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: _SkillCategory(
                          title: 'Outils',
                          icon: Icons.build,
                          color: AppColors.accent,
                          skills:
                              UserInfoConfig.skills['tools'] as List<String>,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 32, color: color),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...skills.map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              skill,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}

class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.secondary],
        ),
      ),
      child: WebContainer(
        child: Column(
          children: [
            Text(
              'Travaillons Ensemble',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 28 : null,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Je suis disponible pour vos projets Flutter',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: isMobile ? 16 : null,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            isMobile
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Me Contacter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 24,
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Me Contacter',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
