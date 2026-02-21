part of 'package:barangaymo_app/main.dart';

class ResidentHomeShell extends StatefulWidget {
  const ResidentHomeShell({super.key});

  @override
  State<ResidentHomeShell> createState() => _ResidentHomeShellState();
}

class _ResidentHomeShellState extends State<ResidentHomeShell> {
  int tab = 0;
  final pages = const [
    ResidentDashboardPage(),
    ResidentJobsPage(),
    ResidentMarketPage(),
    ResidentServicesPage(),
    ResidentProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFECEAFF),
        elevation: 0,
        titleSpacing: 14,
        title: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD9DDF8)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset(
            'public/barangaymo.png',
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      drawer: const ResidentDrawer(),
      body: pages[tab],
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF9F3F3), Color(0xFFF0E8E8)],
            ),
            border: Border.all(color: const Color(0xFFE6DBDB)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 14,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              height: 78,
              backgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                states,
              ) {
                final isSelected = states.contains(WidgetState.selected);
                return TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected
                      ? const Color(0xFF523F3D)
                      : const Color(0xFF6A5A59),
                );
              }),
            ),
            child: NavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedIndex: tab,
              onDestinationSelected: (v) => setState(() => tab = v),
              destinations: [
                _navDestination(Icons.home, 'Home'),
                _navDestination(Icons.work, 'Jobs'),
                _navDestination(Icons.store, 'Market'),
                _navDestination(Icons.miscellaneous_services, 'Services'),
                _navDestination(Icons.person, 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  NavigationDestination _navDestination(IconData icon, String label) {
    return NavigationDestination(
      icon: Icon(icon, color: const Color(0xFF655757)),
      selectedIcon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFDCD5), Color(0xFFF6C8C0)],
          ),
          border: Border.all(color: const Color(0xFFFFEAE6)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33B65A4F),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF7D3931)),
      ),
      label: label,
    );
  }
}

class ResidentDrawer extends StatelessWidget {
  const ResidentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(26)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF6F8FF), Color(0xFFF8F0EE)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(12, 10, 12, 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF8D4B43), Color(0xFF9F5A4C)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFFFF8F6), Color(0xFFF3E7E3)],
                        ),
                        border: Border.all(color: const Color(0x66FFFFFF)),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFF5E1E17),
                        size: 34,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shamira Balandra',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '9123456702',
                            style: TextStyle(
                              color: Color(0xFFF5DCD7),
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.34),
                              ),
                            ),
                            child: const Text(
                              'Verified Resident',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 14),
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(6, 2, 6, 6),
                      child: Text(
                        'Resident Menu',
                        style: TextStyle(
                          color: Color(0xFF5E627B),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    _residentMenu(
                      context,
                      'Home',
                      const ResidentHomeShell(),
                      Icons.home,
                      isActive: true,
                    ),
                    _residentMenu(
                      context,
                      'My Cart',
                      const ResidentCartPage(),
                      Icons.shopping_cart,
                    ),
                    _residentMenu(
                      context,
                      'My Jobs',
                      const ResidentJobsPage(),
                      Icons.work,
                    ),
                    _residentMenu(
                      context,
                      'My Company',
                      const ResidentSellHubPage(),
                      Icons.business,
                    ),
                    _residentMenu(
                      context,
                      'RBI',
                      const ResidentRbiCardPage(),
                      Icons.badge,
                    ),
                    _residentMenu(
                      context,
                      'Add a Member',
                      const ResidentMemberListPage(),
                      Icons.person_add,
                    ),
                    _residentMenu(
                      context,
                      'FAQs',
                      const ResidentFaqPage(),
                      Icons.help,
                    ),
                    _residentMenu(
                      context,
                      'Settings',
                      const ResidentSettingsPage(),
                      Icons.settings,
                    ),
                    _residentMenu(
                      context,
                      'Support',
                      const ResidentSupportPage(),
                      Icons.support_agent,
                    ),
                    _residentMenu(
                      context,
                      'Bug Report',
                      const ResidentBugReportPage(),
                      Icons.bug_report,
                    ),
                    _residentMenu(
                      context,
                      'About Us',
                      const ResidentAboutPage(),
                      Icons.info,
                    ),
                    _residentMenu(
                      context,
                      'Terms and Policies',
                      const ResidentTermsPage(),
                      Icons.policy,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE7E6EA)),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            leading: const Icon(
                              Icons.logout,
                              color: Color(0xFF6A6072),
                            ),
                            title: const Text(
                              'Log out',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF3C3E4F),
                              ),
                            ),
                            onTap: () => _openLogoutSheet(context),
                          ),
                          const Divider(height: 1),
                          ListTile(
                            dense: true,
                            leading: const Icon(
                              Icons.delete_outline,
                              color: Color(0xFFE24C3B),
                            ),
                            title: const Text(
                              'Delete Account',
                              style: TextStyle(
                                color: Color(0xFFE24C3B),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onTap: () => _showFeature(
                              context,
                              'Delete account flow coming next.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _residentMenu(
    BuildContext context,
    String title,
    Widget page,
    IconData icon, {
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          },
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isActive
                  ? const Color(0xFFFFE5DD)
                  : const Color(0xFFFFFFFF).withValues(alpha: 0.72),
              border: Border.all(
                color: isActive
                    ? const Color(0xFFFFD4C7)
                    : const Color(0xFFE9E8ED),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isActive
                          ? const [Color(0xFFFFD6CC), Color(0xFFFFE8E2)]
                          : const [Color(0xFFF1F3FF), Color(0xFFF8F8FF)],
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: isActive
                        ? const Color(0xFF9E4337)
                        : const Color(0xFF5D617A),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      color: isActive
                          ? const Color(0xFF4E3C3A)
                          : const Color(0xFF3D4051),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: isActive
                      ? const Color(0xFF9E4337)
                      : const Color(0xFF888CA2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openLogoutSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RoleGatewayScreen(),
                      ),
                      (route) => false,
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF2E35D3),
                    ),
                    child: const Text('Yes, Log out'),
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

class _ResidentHighlightData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color start;
  final Color end;
  final String tag;
  const _ResidentHighlightData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.start,
    required this.end,
    required this.tag,
  });
}

class _ResidentJobData {
  final String title;
  final String company;
  final String location;
  final String salary;
  final String schedule;
  final bool urgent;
  const _ResidentJobData({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.schedule,
    this.urgent = false,
  });
}

class _ResidentProductData {
  final String title;
  final String seller;
  final String price;
  final IconData icon;
  final bool verified;
  const _ResidentProductData({
    required this.title,
    required this.seller,
    required this.price,
    required this.icon,
    this.verified = false,
  });
}

class ResidentDashboardPage extends StatelessWidget {
  const ResidentDashboardPage({super.key});

  static const _communityHighlights = [
    _ResidentHighlightData(
      title: 'Barangay Clean-Up',
      subtitle: 'Saturday, 7:00 AM at Covered Court',
      icon: Icons.cleaning_services,
      start: Color(0xFFBFD9FF),
      end: Color(0xFFDEEAFD),
      tag: 'Community',
    ),
    _ResidentHighlightData(
      title: 'Night Patrol Update',
      subtitle: 'BPAT coverage expanded for Zone 3',
      icon: Icons.shield_moon,
      start: Color(0xFFD6CCFF),
      end: Color(0xFFECE8FF),
      tag: 'Safety',
    ),
    _ResidentHighlightData(
      title: 'Health Caravan',
      subtitle: 'Free checkups this Friday, 9:00 AM',
      icon: Icons.medical_services,
      start: Color(0xFFFFD8D0),
      end: Color(0xFFFFECE7),
      tag: 'Health',
    ),
  ];

  static const _marketHighlights = [
    _ResidentHighlightData(
      title: 'Fresh Harvest Deals',
      subtitle: 'Up to 20% off from local growers',
      icon: Icons.local_offer,
      start: Color(0xFFFFE1CC),
      end: Color(0xFFFFF0E6),
      tag: 'Food',
    ),
    _ResidentHighlightData(
      title: 'Tech Essentials',
      subtitle: 'Laptop and printer bundles available',
      icon: Icons.devices,
      start: Color(0xFFCFE7FF),
      end: Color(0xFFEAF4FF),
      tag: 'Electronics',
    ),
    _ResidentHighlightData(
      title: 'Gov Procurement',
      subtitle: 'Sell products directly to LGU buyers',
      icon: Icons.account_balance,
      start: Color(0xFFD7F5E5),
      end: Color(0xFFECFBF3),
      tag: 'Business',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF5F7FF), Color(0xFFF8F1F1)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 20),
        children: [
          _hero(context),
          const SizedBox(height: 14),
          _sectionHeader(context, 'Quick Tools', 'Customize'),
          const SizedBox(height: 8),
          Row(
            children: [
              _quickTool(
                context,
                Icons.emergency,
                'Emergency',
                const ResponderPage(),
              ),
              _quickTool(
                context,
                Icons.sell,
                'Sell',
                const ResidentSellHubPage(),
              ),
              _quickTool(context, Icons.work, 'Jobs', const ResidentJobsPage()),
              _quickTool(
                context,
                Icons.assignment,
                'Requests',
                const ResidentRequestsPage(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _metricCard(
                  label: 'Pending Requests',
                  value: '02',
                  icon: Icons.pending_actions,
                  start: const Color(0xFFE2DEFF),
                  end: const Color(0xFFF4F2FF),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _metricCard(
                  label: 'Profile Score',
                  value: '78%',
                  icon: Icons.verified_user,
                  start: const Color(0xFFFFE0D7),
                  end: const Color(0xFFFFF1EC),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _sectionHeader(context, 'Community Highlights', 'View All'),
          const SizedBox(height: 8),
          SizedBox(
            height: 184,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _communityHighlights.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _highlightCard(
                context,
                _communityHighlights[i],
                onTap: () =>
                    _showFeature(context, _communityHighlights[i].title),
              ),
            ),
          ),
          const SizedBox(height: 14),
          _sectionHeader(context, 'Marketplace Picks', 'Open Market'),
          const SizedBox(height: 8),
          SizedBox(
            height: 184,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _marketHighlights.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _highlightCard(
                context,
                _marketHighlights[i],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ResidentMarketPage()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3D4BC1), Color(0xFF6671E3)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x332E35D3),
            blurRadius: 16,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good day, Manuel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Everything you need from your barangay in one place.',
                  style: TextStyle(color: Color(0xFFDDE0FF)),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ResidentVerifyProfilePage(),
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF3039A3),
                      ),
                      child: const Text('Verify Profile'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ResidentRbiCardPage(),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Color(0x66FFFFFF)),
                      ),
                      child: const Text('RBI Card'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 74,
            height: 74,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFFFFF), Color(0xFFE4E8FF)],
              ),
              border: Border.all(color: const Color(0x66FFFFFF)),
            ),
            child: Image.asset(
              'public/barangaymo.png',
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickTool(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFFFCFF), Color(0xFFD9D3FF)],
                ),
                border: Border.all(color: const Color(0xFFFFFFFF), width: 1.2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x332E35D3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Color(0x66FFFFFF),
                    blurRadius: 6,
                    offset: Offset(-2, -2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    top: 10,
                    left: 12,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Color(0x66FFFFFF),
                    ),
                  ),
                  Positioned(
                    top: 18,
                    left: 19,
                    child: Icon(icon, color: const Color(0x402E35D3), size: 24),
                  ),
                  Icon(icon, color: const Color(0xFF2E35D3), size: 24),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricCard({
    required String label,
    required String value,
    required IconData icon,
    required Color start,
    required Color end,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [start, end],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: const Color(0xFF3B3D56), size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2E2E3A),
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF5E6070),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlightCard(
    BuildContext context,
    _ResidentHighlightData data, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [data.start, data.end],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0x44FFFFFF), Color(0x22FFFFFF)],
                ),
                border: Border.all(color: const Color(0x44FFFFFF)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.84),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(data.icon, color: const Color(0xFF40435F)),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xB3FFFFFF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      data.tag,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF4A4D64),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2F3146),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              data.subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF53566D),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              children: const [
                Text(
                  'Open',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3A3E56),
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: Color(0xFF3A3E56),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: () => _showFeature(context, '$title - $action'),
          child: Text(
            action,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
