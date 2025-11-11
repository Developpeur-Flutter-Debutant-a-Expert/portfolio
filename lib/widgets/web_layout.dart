import 'package:flutter/material.dart';

class WebNavBar extends StatelessWidget {
  final String currentRoute;

  const WebNavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isMobile
          ? _MobileNavBar(currentRoute: currentRoute)
          : _DesktopNavBar(currentRoute: currentRoute),
    );
  }
}

class _DesktopNavBar extends StatelessWidget {
  final String currentRoute;

  const _DesktopNavBar({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Logo/Name
        Text(
          'AKAMBI Sylvère',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const Spacer(),
        // Navigation Menu
        _NavItem(label: 'Accueil', route: '/', isActive: currentRoute == '/'),
        const SizedBox(width: 40),
        _NavItem(
          label: 'Projets',
          route: '/projects',
          isActive: currentRoute == '/projects',
        ),
        const SizedBox(width: 40),
        _NavItem(
          label: 'Compétences',
          route: '/skills',
          isActive: currentRoute == '/skills',
        ),
        const SizedBox(width: 40),
        _NavItem(
          label: 'À Propos',
          route: '/about',
          isActive: currentRoute == '/about',
        ),
        const SizedBox(width: 40),
        // CTA Button
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/contact'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: 0,
          ),
          child: const Text('Me Contacter'),
        ),
      ],
    );
  }
}

class _MobileNavBar extends StatelessWidget {
  final String currentRoute;

  const _MobileNavBar({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'AS',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => _MobileMenu(currentRoute: currentRoute),
            );
          },
        ),
      ],
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final String currentRoute;

  const _MobileMenu({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _MobileNavItem(
            label: 'Accueil',
            route: '/',
            isActive: currentRoute == '/',
          ),
          _MobileNavItem(
            label: 'Projets',
            route: '/projects',
            isActive: currentRoute == '/projects',
          ),
          _MobileNavItem(
            label: 'Compétences',
            route: '/skills',
            isActive: currentRoute == '/skills',
          ),
          _MobileNavItem(
            label: 'À Propos',
            route: '/about',
            isActive: currentRoute == '/about',
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
              child: const Text('Me Contacter'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final String route;
  final bool isActive;

  const _MobileNavItem({
    required this.label,
    required this.route,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? Theme.of(context).colorScheme.primary : null,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final String route;
  final bool isActive;

  const _NavItem({
    required this.label,
    required this.route,
    required this.isActive,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive || _isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
              color: widget.isActive
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }
}

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Column(
        children: [
          isMobile ? _MobileFooterContent() : _DesktopFooterContent(),
          SizedBox(height: isMobile ? 24 : 40),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 20),
          Text(
            '© 2025 AKAMBI Sylvère. Tous droits réservés.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _DesktopFooterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Column 1
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AKAMBI Sylvère',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'Développeur Mobile Flutter',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        // Column 2
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Navigation',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _FooterLink(label: 'Accueil', route: '/'),
              _FooterLink(label: 'Projets', route: '/projects'),
              _FooterLink(label: 'Compétences', route: '/skills'),
              _FooterLink(label: 'À Propos', route: '/about'),
            ],
          ),
        ),
        // Column 3
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _FooterLink(label: 'Email', route: '/contact'),
              _FooterLink(label: 'LinkedIn', route: '/contact'),
              _FooterLink(label: 'GitHub', route: '/contact'),
              _FooterLink(label: 'Telegram', route: '/contact'),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileFooterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AKAMBI Sylvère',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Développeur Mobile Flutter',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 24),
        Text(
          'Navigation',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        _FooterLink(label: 'Accueil', route: '/'),
        _FooterLink(label: 'Projets', route: '/projects'),
        _FooterLink(label: 'Compétences', route: '/skills'),
        _FooterLink(label: 'À Propos', route: '/about'),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final String route;

  const _FooterLink({required this.label, required this.route});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.route),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _isHovered
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}

// Container avec largeur max pour contenu web
class WebContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const WebContainer({super.key, required this.child, this.maxWidth = 1200});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
          child: child,
        ),
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  final String currentRoute;
  final Widget child;

  const WebLayout({super.key, required this.currentRoute, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WebNavBar(currentRoute: currentRoute),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [child, const WebFooter()]),
            ),
          ),
        ],
      ),
    );
  }
}
