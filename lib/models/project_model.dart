class Project {
  final String title;
  final String description;
  final String level; // Débutant | Intermédiaire | Avancé | Expert
  final List<String> technologies;
  final List<String> features;
  final String skills;
  final String githubUrl;

  const Project({
    required this.title,
    required this.description,
    required this.level,
    required this.technologies,
    required this.features,
    required this.skills,
    required this.githubUrl,
  });

  // Helper method to get level color
  int getLevelColor() {
    switch (level) {
      case 'Débutant':
        return 0xFF4CAF50; // Green
      case 'Intermédiaire':
        return 0xFF2196F3; // Blue
      case 'Avancé':
        return 0xFFFF9800; // Orange
      case 'Expert':
        return 0xFFF44336; // Red
      default:
        return 0xFF757575; // Grey
    }
  }

  // Helper method to get level order
  int getLevelOrder() {
    switch (level) {
      case 'Débutant':
        return 1;
      case 'Intermédiaire':
        return 2;
      case 'Avancé':
        return 3;
      case 'Expert':
        return 4;
      default:
        return 0;
    }
  }
}
