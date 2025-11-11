import 'package:flutter/material.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import '../utils/image_generator.dart';
import '../utils/app_colors.dart';
import '../widgets/web_layout.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedLevel = 'Tous';
  final List<String> _levels = [
    'Tous',
    'Débutant',
    'Intermédiaire',
    'Avancé',
    'Expert',
  ];

  List<Project> get _filteredProjects {
    if (_selectedLevel == 'Tous') return projects;
    return projects.where((p) => p.level == _selectedLevel).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return WebLayout(
      currentRoute: '/projects',
      child: Column(
        children: [
          const SizedBox(height: 40),
          WebContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mes Projets',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 28 : null,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Découvrez mes 10 projets Flutter du niveau Débutant à Expert',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Level Filter
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _levels.length,
              itemBuilder: (context, index) {
                final level = _levels[index];
                final isSelected = level == _selectedLevel;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(level),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedLevel = level;
                      });
                    },
                    selectedColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                );
              },
            ),
          ),

          // Projects Grid
          _filteredProjects.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(child: Text('Aucun projet trouvé')),
                )
              : isMobile
              ? Column(
                  children: _filteredProjects.map((project) {
                    final projectIndex = projects.indexOf(project) + 1;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: _ProjectCard(
                        project: project,
                        projectIndex: projectIndex,
                      ),
                    );
                  }).toList(),
                )
              : Padding(
                  padding: const EdgeInsets.all(80),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: _filteredProjects.map((project) {
                      final projectIndex = projects.indexOf(project) + 1;
                      return SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 160 - 48) / 3,
                        child: _ProjectCard(
                          project: project,
                          projectIndex: projectIndex,
                        ),
                      );
                    }).toList(),
                  ),
                ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final int projectIndex;

  const _ProjectCard({required this.project, required this.projectIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailScreen(
                project: project,
                projectIndex: projectIndex,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ImageGenerator.generateProjectImage(
              projectIndex,
              project.title,
              height: 180,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Level Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Color(project.getLevelColor()).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(project.getLevelColor()),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      project.level,
                      style: TextStyle(
                        color: Color(project.getLevelColor()),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),

                  // Technologies
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies.take(3).map((tech) {
                      return Chip(
                        label: Text(tech),
                        labelStyle: const TextStyle(fontSize: 11),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  final int projectIndex;

  const ProjectDetailScreen({
    super.key,
    required this.project,
    required this.projectIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: isMobile ? 200 : 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                project.title,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(0, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              background: ImageGenerator.generateProjectImage(
                projectIndex,
                project.title,
                height: isMobile ? 200 : 300,
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 20 : 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Level Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(
                            project.getLevelColor(),
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(project.getLevelColor()),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          project.level,
                          style: TextStyle(
                            color: Color(project.getLevelColor()),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Description
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        project.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),

                      // Technologies
                      Text(
                        'Technologies',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.technologies.map((tech) {
                          return Chip(
                            label: Text(tech),
                            avatar: ImageGenerator.generateSkillIcon(
                              tech,
                              size: 24,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),

                      // Features
                      Text(
                        'Fonctionnalités',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      ...project.features.map((feature) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: AppColors.accent,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 24),

                      // Skills
                      Text(
                        'Compétences Acquises',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        project.skills,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 32),

                      // GitHub Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Open GitHub URL
                          },
                          icon: const Icon(Icons.code),
                          label: const Text('Voir sur GitHub'),
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
    );
  }
}
