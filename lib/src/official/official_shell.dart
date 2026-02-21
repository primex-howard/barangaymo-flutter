part of 'package:barangaymo_app/main.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int tab = 0;
  final pages = const [
    _SimplePage('Home Page', [
      'Old Cabalan - City of Olongapo, Zambales',
      'Population: 22365',
      'RBI: 2',
      'Divisions: 10',
      'Year Founded: 1961',
    ]),
    _SimplePage('Official', ['Starter content']),
    _SimplePage('Market', ['Starter content']),
    SerbilisServicesPage(),
    _SimplePage('Profile', ['Details', 'Address', 'Council']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _BarangayMoLogo(width: 145),
        backgroundColor: const Color(0xFFD70000),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFD70000)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BarangayMoLogo(width: 150),
                  SizedBox(height: 10),
                  Text(
                    'Barangay Officials',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            _m(context, 'Settings'),
            _m(context, 'RBI Records'),
            _m(context, 'FAQs'),
            _m(context, 'Notifications'),
            _m(context, 'Support'),
            _m(context, 'Bug Report'),
            _m(context, 'Terms & Policies'),
            _m(context, 'Log out'),
            _m(context, 'Delete Account', color: Colors.red),
          ],
        ),
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shield), label: 'Official'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Market'),
          NavigationDestination(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Services',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _m(BuildContext c, String t, {Color? color}) {
    return ListTile(
      title: Text(t, style: TextStyle(color: color)),
      onTap: () {
        Navigator.pop(c);
        Navigator.push(
          c,
          MaterialPageRoute(builder: (_) => DetailPage(title: t)),
        );
      },
    );
  }
}

class _SimplePage extends StatelessWidget {
  final String title;
  final List<String> rows;
  const _SimplePage(this.title, this.rows);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 8),
        ...rows.map((e) => Card(child: ListTile(title: Text(e)))),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final items = {
      'Settings': ['Notifications', 'Profile', 'Account Settings'],
      'RBI Records': [
        'Search name...',
        'Verified/Unverified tabs',
        'Records list',
      ],
      'FAQs': ['Common questions list', 'Search by keywords'],
      'Notifications': ['Notifications', 'History', 'Transactions'],
      'Support': ['support@barangaymo.online', '000 123 4567', 'FAQ button'],
      'Bug Report': [
        'Bug Name',
        'Description',
        'Upload Screenshot',
        'Submit Ticket',
      ],
      'Terms & Policies': ['Privacy Policy', 'Terms and Conditions'],
      'Log out': ['Are you sure you want to log out?', 'Go Back', 'Log Out'],
      'Delete Account': ['Type DELETE to confirm', 'Delete Account button'],
    };

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...?items[title]?.map((e) => Card(child: ListTile(title: Text(e)))),
        ],
      ),
    );
  }
}

class SerbilisServicesPage extends StatelessWidget {
  const SerbilisServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Serbilis Services'),
          backgroundColor: const Color(0xFFD70000),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Brgy Services'),
              Tab(text: 'SK Services'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _serviceGrid(context, _brgyServices),
            _serviceGrid(context, _skServices),
          ],
        ),
      ),
    );
  }

  Widget _serviceGrid(BuildContext context, List<_ServiceAction> data) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD70000)),
          ),
          child: const Center(
            child: Text(
              'Service Banner',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.95,
          ),
          itemCount: data.length,
          itemBuilder: (_, index) {
            final item = data[index];
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.page),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 30),
                    const SizedBox(height: 8),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ServiceAction {
  final String name;
  final IconData icon;
  final Widget page;
  const _ServiceAction(this.name, this.icon, this.page);
}

const _brgyServices = [
  _ServiceAction('Assistance', Icons.volunteer_activism, AssistancePage()),
  _ServiceAction('BPAT', Icons.shield, BpatPage()),
  _ServiceAction('Clearance', Icons.description, ClearancePage()),
  _ServiceAction('Council', Icons.groups, CouncilPage()),
  _ServiceAction('Disclosure', Icons.table_chart, DisclosureBoardPage()),
  _ServiceAction(
    'Education',
    Icons.menu_book,
    SimpleSerbilisPage(title: 'Education'),
  ),
  _ServiceAction('Gov', Icons.account_balance, GovAgenciesPage()),
  _ServiceAction('Govt Agencies', Icons.apartment, GovAgenciesPage()),
  _ServiceAction('Health', Icons.health_and_safety, HealthPage()),
  _ServiceAction(
    'Other Barangay',
    Icons.travel_explore,
    SimpleSerbilisPage(title: 'Other Barangay'),
  ),
  _ServiceAction(
    'Police',
    Icons.local_police,
    SimpleSerbilisPage(title: 'Police'),
  ),
  _ServiceAction('QR ID', Icons.qr_code_scanner, ScanQrPage()),
  _ServiceAction('RBI', Icons.badge, ResidentRbiCardPage()),
  _ServiceAction('Responder', Icons.local_shipping, ResponderPage()),
  _ServiceAction(
    'Special Docs',
    Icons.stars,
    SimpleSerbilisPage(title: 'Special Docs'),
  ),
  _ServiceAction('Community', Icons.forum, CommunityPage()),
];

const _skServices = [
  _ServiceAction('Community', Icons.hub, CommunityPage()),
  _ServiceAction(
    'Education',
    Icons.school,
    SimpleSerbilisPage(title: 'SK Education'),
  ),
  _ServiceAction('Officials', Icons.groups_2, CouncilPage()),
  _ServiceAction(
    'Programs',
    Icons.assignment,
    SimpleSerbilisPage(title: 'Programs'),
  ),
  _ServiceAction('Scholarship', Icons.card_giftcard, AssistancePage()),
  _ServiceAction(
    'Sports',
    Icons.sports_basketball,
    SimpleSerbilisPage(title: 'Sports'),
  ),
];

class SimpleSerbilisPage extends StatelessWidget {
  final String title;
  const SimpleSerbilisPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final cfg = _SerbilisPortalData.fromTitle(title);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFFF7F8FF),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F8FF), Color(0xFFF8F0EE)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [cfg.heroStart, cfg.heroEnd],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cfg.headline,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cfg.description,
                          style: const TextStyle(
                            color: Color(0xFFE7ECFF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: const Color(0x34FFFFFF),
                    child: Icon(cfg.icon, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ...cfg.modules.map(
              (item) => Container(
                margin: const EdgeInsets.only(bottom: 9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE6E8F4)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: item.bg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(item.icon, color: cfg.heroStart),
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2F3248),
                    ),
                  ),
                  subtitle: Text(
                    item.subtitle,
                    style: const TextStyle(
                      color: Color(0xFF676D86),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showFeature(context, 'Opening ${item.title}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SerbilisPortalData {
  final String headline;
  final String description;
  final Color heroStart;
  final Color heroEnd;
  final IconData icon;
  final List<_SerbilisPortalItem> modules;

  const _SerbilisPortalData({
    required this.headline,
    required this.description,
    required this.heroStart,
    required this.heroEnd,
    required this.icon,
    required this.modules,
  });

  static _SerbilisPortalData fromTitle(String title) {
    switch (title) {
      case 'Education':
      case 'SK Education':
        return const _SerbilisPortalData(
          headline: 'Barangay Education Hub',
          description:
              'Scholarships, training, and learning support for residents and youth.',
          heroStart: Color(0xFF4759C8),
          heroEnd: Color(0xFF6D7CE7),
          icon: Icons.menu_book,
          modules: [
            _SerbilisPortalItem(
              title: 'Scholarship Registry',
              subtitle: 'Apply and track scholarship assistance',
              icon: Icons.school,
              bg: Color(0xFFE3E9FF),
            ),
            _SerbilisPortalItem(
              title: 'TESDA Referral',
              subtitle: 'Skills training and employment readiness',
              icon: Icons.engineering,
              bg: Color(0xFFE8F2FF),
            ),
            _SerbilisPortalItem(
              title: 'ALS Enrollment',
              subtitle: 'Alternative learning support schedules',
              icon: Icons.groups,
              bg: Color(0xFFEAF5E8),
            ),
            _SerbilisPortalItem(
              title: 'Youth Programs',
              subtitle: 'Workshops, mentoring, and campus outreach',
              icon: Icons.workspace_premium,
              bg: Color(0xFFFFEFE1),
            ),
          ],
        );
      case 'Police':
        return const _SerbilisPortalData(
          headline: 'Police Coordination',
          description:
              'Incident reporting, blotter tracking, and safety coordination with PNP.',
          heroStart: Color(0xFF274F93),
          heroEnd: Color(0xFF4D72B3),
          icon: Icons.local_police,
          modules: [
            _SerbilisPortalItem(
              title: 'Report Incident',
              subtitle: 'Submit details for police and barangay response',
              icon: Icons.report_problem,
              bg: Color(0xFFE4ECFF),
            ),
            _SerbilisPortalItem(
              title: 'Blotter Verification',
              subtitle: 'Check report status and case reference',
              icon: Icons.receipt_long,
              bg: Color(0xFFE9F0FF),
            ),
            _SerbilisPortalItem(
              title: 'Patrol Request',
              subtitle: 'Request presence in high-risk areas',
              icon: Icons.directions_walk,
              bg: Color(0xFFEAF6EF),
            ),
            _SerbilisPortalItem(
              title: 'Emergency Contacts',
              subtitle: 'Quick access to hotline and precinct channels',
              icon: Icons.call,
              bg: Color(0xFFFFEFE4),
            ),
          ],
        );
      case 'Other Barangay':
        return const _SerbilisPortalData(
          headline: 'Inter-Barangay Services',
          description:
              'Coordinate requests and verification across neighboring barangays.',
          heroStart: Color(0xFF8E4E44),
          heroEnd: Color(0xFFB46B5A),
          icon: Icons.travel_explore,
          modules: [
            _SerbilisPortalItem(
              title: 'Transfer Request',
              subtitle: 'Start resident transfer and endorsement documents',
              icon: Icons.swap_horiz,
              bg: Color(0xFFFFE9E4),
            ),
            _SerbilisPortalItem(
              title: 'Cross-Barangay Clearance',
              subtitle: 'Coordinate clearance with destination barangay',
              icon: Icons.assignment_turned_in,
              bg: Color(0xFFFFEFE6),
            ),
            _SerbilisPortalItem(
              title: 'Referral Letter',
              subtitle: 'Generate referral for health and social support',
              icon: Icons.mail_outline,
              bg: Color(0xFFEAF0FF),
            ),
            _SerbilisPortalItem(
              title: 'Barangay Directory',
              subtitle: 'Contacts and office hours of nearby barangays',
              icon: Icons.location_city,
              bg: Color(0xFFEAF6EF),
            ),
          ],
        );
      default:
        return _SerbilisPortalData(
          headline: '$title Services',
          description: 'Access community services and support requests.',
          heroStart: const Color(0xFF3E4CC7),
          heroEnd: const Color(0xFF6978E1),
          icon: Icons.miscellaneous_services,
          modules: [
            const _SerbilisPortalItem(
              title: 'Open Services',
              subtitle: 'Access service request forms',
              icon: Icons.open_in_new,
              bg: Color(0xFFE4E9FF),
            ),
            const _SerbilisPortalItem(
              title: 'Status Tracking',
              subtitle: 'Monitor progress and updates',
              icon: Icons.timeline,
              bg: Color(0xFFE9F5EE),
            ),
          ],
        );
    }
  }
}

class _SerbilisPortalItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color bg;

  const _SerbilisPortalItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bg,
  });
}
