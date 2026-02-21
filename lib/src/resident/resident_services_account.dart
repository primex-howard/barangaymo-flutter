part of 'package:barangaymo_app/main.dart';

class ResidentAnnouncementPage extends StatelessWidget {
  const ResidentAnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Announcements')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search announcement...',
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _AnnouncementChip(label: 'Civic Engagement'),
                _AnnouncementChip(label: 'Community Events'),
                _AnnouncementChip(label: 'Education & Training'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: const [
              _AnnouncementTile(
                title: 'Tree Planting Day',
                category: 'Environmental Announcements',
                dateRange: 'Nov 17 to Nov 17',
              ),
              _AnnouncementTile(
                title: 'Year-End Celebration',
                category: 'Civic Engagement & Outreach',
                dateRange: 'Dec 21 to Dec 21',
              ),
              _AnnouncementTile(
                title: 'Monthly Meeting',
                category: 'Meetings & Schedules',
                dateRange: 'Dec 1 to Dec 1',
              ),
              _AnnouncementTile(
                title: 'Power Outage Alert',
                category: 'Public Announcements',
                dateRange: 'Nov 15 to Nov 15',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnnouncementChip extends StatelessWidget {
  final String label;
  const _AnnouncementChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(label: Text(label, style: const TextStyle(fontSize: 12))),
    );
  }
}

class _AnnouncementTile extends StatelessWidget {
  final String title;
  final String category;
  final String dateRange;
  const _AnnouncementTile({
    required this.title,
    required this.category,
    required this.dateRange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.attachment, color: Color(0xFF2E35D3)),
            ),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(category),
            const SizedBox(height: 4),
            Text(
              dateRange,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            FilledButton(
              onPressed: () => _showFeature(context, '$title details'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF2E35D3),
              ),
              child: const Text('More Info'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentSpecialDocsPage extends StatelessWidget {
  const ResidentSpecialDocsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Special Docs')),
      body: ListView(
        children: [
          _goTile(context, 'QR ID', const ScanQrPage()),
          _goTile(context, 'RBI', const ResidentRbiCardPage()),
          _goTile(context, 'Responder', const ResponderPage()),
        ],
      ),
    );
  }
}

class ResidentRequestsPage extends StatefulWidget {
  const ResidentRequestsPage({super.key});

  @override
  State<ResidentRequestsPage> createState() => _ResidentRequestsPageState();
}

class _ResidentRequestsPageState extends State<ResidentRequestsPage> {
  String _query = '';
  String _selectedStatus = 'All';

  static const _statusFilters = ['All', 'Pending', 'Approved', 'Rejected'];

  static const _history = [
    _ResidentRequestEntry(
      category: 'Clearance',
      title: 'Barangay Clearance',
      requestId: 'BC-26-0220',
      status: 'Approved',
      purpose: 'Residency requirement',
      date: 'Feb 20, 2026',
    ),
    _ResidentRequestEntry(
      category: 'Assistance',
      title: 'Medical Assistance',
      requestId: 'MA-26-0218',
      status: 'Pending',
      purpose: 'Hospital bill support',
      date: 'Feb 18, 2026',
    ),
    _ResidentRequestEntry(
      category: 'Clearance',
      title: 'Certificate of Indigency',
      requestId: 'CI-26-0217',
      status: 'Rejected',
      purpose: 'Scholarship document',
      date: 'Feb 17, 2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final q = _query.trim().toLowerCase();
    final rows = _history.where((item) {
      final matchesStatus =
          _selectedStatus == 'All' || item.status == _selectedStatus;
      final bag =
          '${item.title} ${item.requestId} ${item.purpose} ${item.category}'
              .toLowerCase();
      final matchesQuery = q.isEmpty || bag.contains(q);
      return matchesStatus && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
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
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4655CB), Color(0xFF7382F2)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x22414FC0),
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Track Your Requests',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Monitor clearances and assistance applications in one place.',
                          style: TextStyle(color: Color(0xFFE4E8FF)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Color(0x34FFFFFF),
                    child: Icon(
                      Icons.assignment_turned_in,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search requests, ID, purpose...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE3E6F4)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE3E6F4)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _statusFilters.length,
                separatorBuilder: (_, _) => const SizedBox(width: 6),
                itemBuilder: (_, i) {
                  final label = _statusFilters[i];
                  final active = label == _selectedStatus;
                  return ChoiceChip(
                    label: Text(label),
                    selected: active,
                    onSelected: (_) => setState(() => _selectedStatus = label),
                    selectedColor: const Color(0xFFDCE2FF),
                    labelStyle: TextStyle(
                      color: active
                          ? const Color(0xFF2E36A7)
                          : const Color(0xFF626983),
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            _requestActionCard(
              context: context,
              title: 'Clearance Requests',
              subtitle:
                  'Generate and track barangay clearance and residency certificates.',
              icon: Icons.description_outlined,
              buttonLabel: 'Request Clearance',
              color: const Color(0xFF4A66CB),
              onTap: () =>
                  _showFeature(context, 'Open clearance request form.'),
            ),
            const SizedBox(height: 10),
            _requestActionCard(
              context: context,
              title: 'Assistance Requests',
              subtitle:
                  'Submit social, financial, educational, and medical support applications.',
              icon: Icons.volunteer_activism,
              buttonLabel: 'Request Assistance',
              color: const Color(0xFFAE5A4E),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AssistancePage()),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Request History (${rows.length})',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2F334A),
              ),
            ),
            const SizedBox(height: 8),
            if (rows.isEmpty)
              const Card(
                child: ListTile(
                  leading: Icon(Icons.search_off),
                  title: Text('No request records found'),
                ),
              )
            else
              ...rows.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE4E6F3)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _statusIcon(item.status),
                            color: _statusColor(item.status),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2D3148),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _statusColor(
                                item.status,
                              ).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              item.status,
                              style: TextStyle(
                                color: _statusColor(item.status),
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${item.requestId} | ${item.date}',
                        style: const TextStyle(
                          color: Color(0xFF676D88),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Purpose: ${item.purpose}',
                        style: const TextStyle(
                          color: Color(0xFF5D627D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF2FF),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              item.category,
                              style: const TextStyle(
                                color: Color(0xFF4D57A7),
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: () => _showFeature(
                              context,
                              'Viewing ${item.requestId}',
                            ),
                            icon: const Icon(Icons.visibility, size: 18),
                            label: const Text('Details'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('Return Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _requestActionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required String buttonLabel,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E7F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2F334A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF656B85),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: color.withValues(alpha: 0.4)),
                foregroundColor: color,
              ),
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: Text(buttonLabel),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Approved':
        return const Color(0xFF2F965D);
      case 'Rejected':
        return const Color(0xFFD34F42);
      case 'Pending':
      default:
        return const Color(0xFFB77A2F);
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'Approved':
        return Icons.verified;
      case 'Rejected':
        return Icons.cancel_outlined;
      case 'Pending':
      default:
        return Icons.schedule;
    }
  }
}

class _ResidentRequestEntry {
  final String category;
  final String title;
  final String requestId;
  final String status;
  final String purpose;
  final String date;
  const _ResidentRequestEntry({
    required this.category,
    required this.title,
    required this.requestId,
    required this.status,
    required this.purpose,
    required this.date,
  });
}

class ResidentServicesPage extends StatelessWidget {
  const ResidentServicesPage({super.key});

  static const _commonServices = [
    _ServiceAction('Assistance', Icons.volunteer_activism, AssistancePage()),
    _ServiceAction('BPAT', Icons.shield, BpatPage()),
    _ServiceAction('Clearance', Icons.description, ClearancePage()),
    _ServiceAction('Council', Icons.groups, CouncilPage()),
    _ServiceAction('Health', Icons.health_and_safety, HealthPage()),
    _ServiceAction('Community', Icons.forum, CommunityPage()),
  ];

  static const _allServices = [
    _ServiceAction('Requests', Icons.assignment, ResidentRequestsPage()),
    _ServiceAction('Special Docs', Icons.stars, ResidentSpecialDocsPage()),
    _ServiceAction('Responder', Icons.local_shipping, ResponderPage()),
    _ServiceAction('Gov Agencies', Icons.apartment, GovAgenciesPage()),
    _ServiceAction('Health', Icons.health_and_safety, HealthPage()),
    _ServiceAction('QR ID', Icons.qr_code_scanner, ScanQrPage()),
    _ServiceAction('RBI', Icons.badge, ResidentRbiCardPage()),
    _ServiceAction(
      'Education',
      Icons.menu_book,
      SimpleSerbilisPage(title: 'Education'),
    ),
    _ServiceAction(
      'Police',
      Icons.local_police,
      SimpleSerbilisPage(title: 'Police'),
    ),
    _ServiceAction(
      'Other Brgy',
      Icons.travel_explore,
      SimpleSerbilisPage(title: 'Other Barangay'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF5F7FF), Color(0xFFF8F1ED)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3E4CC7), Color(0xFF6775E6)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x262E35D3),
                  blurRadius: 14,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Barangay Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Access permits, requests, support, and emergency channels.',
                        style: TextStyle(color: Color(0xFFDDE1FF)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0x33FFFFFF),
                  child: Icon(
                    Icons.miscellaneous_services,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentSpecialDocsPage(),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF3C48BD),
                  ),
                  icon: const Icon(Icons.stars),
                  label: const Text('Special Docs'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentRequestsPage(),
                    ),
                  ),
                  icon: const Icon(Icons.assignment),
                  label: const Text('My Requests'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Common Services',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2F3146),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _commonServices.length,
              separatorBuilder: (_, _) => const SizedBox(width: 9),
              itemBuilder: (_, i) => _servicePill(context, _commonServices[i]),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'All Services',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2F3146),
            ),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _allServices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.88,
            ),
            itemBuilder: (_, i) => _serviceGridTile(context, _allServices[i]),
          ),
        ],
      ),
    );
  }

  Widget _servicePill(BuildContext context, _ServiceAction action) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => action.page),
      ),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 122,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFF2F4FF)],
          ),
          border: Border.all(color: const Color(0xFFE2E5FF)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x15000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(action.icon, color: const Color(0xFF4753B8)),
            const SizedBox(height: 6),
            Text(
              action.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF424760),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceGridTile(BuildContext context, _ServiceAction action) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => action.page),
      ),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE7E8F3)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE3E8FF), Color(0xFFF1F3FF)],
                ),
              ),
              child: Icon(
                action.icon,
                size: 19,
                color: const Color(0xFF4D59BF),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              action.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF43485E),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentProfilePage extends StatelessWidget {
  const ResidentProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF6F8FF), Color(0xFFF8F0EE)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3E4CC7), Color(0xFF6573E3)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x262E35D3),
                  blurRadius: 15,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0x99FFFFFF),
                      width: 2,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFDEE2FF), Color(0xFFBAC2FF)],
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 38,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shamira Balandra',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'RBI-3-7-34-53541212',
                        style: TextStyle(color: Color(0xFFDDE0FF)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentVerifyProfilePage(),
                    ),
                  ),
                  icon: const Icon(Icons.edit, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: const Color(0xFFE6E7F2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Profile Completion',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2F3146),
                  ),
                ),
                SizedBox(height: 6),
                LinearProgressIndicator(
                  value: 0.78,
                  minHeight: 8,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  backgroundColor: Color(0xFFE9ECFA),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4250C4)),
                ),
                SizedBox(height: 4),
                Text(
                  'Complete remaining details to unlock all services.',
                  style: TextStyle(color: Color(0xFF666B86)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _profileAction(
                  context,
                  title: 'Verify',
                  icon: Icons.verified_user,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentVerifyProfilePage(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _profileAction(
                  context,
                  title: 'RBI Card',
                  icon: Icons.badge,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentRbiCardPage(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _profileAction(
                  context,
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentSettingsPage(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _profileInfoCard(
            context,
            title: 'Personal Information',
            subtitle: 'Full name, birth details, sex, and civil status',
            icon: Icons.person_outline,
          ),
          _profileInfoCard(
            context,
            title: 'Residence Details',
            subtitle: 'House number, street, barangay, city, and province',
            icon: Icons.home_work_outlined,
          ),
          _profileInfoCard(
            context,
            title: 'Education and Employment',
            subtitle: 'Attainment, occupation, skills, and job status',
            icon: Icons.school_outlined,
          ),
          _profileInfoCard(
            context,
            title: 'Health Information',
            subtitle: 'Height, weight, blood type, and medical details',
            icon: Icons.health_and_safety_outlined,
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ResidentSupportPage()),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF3A47BA),
            ),
            icon: const Icon(Icons.support_agent),
            label: const Text('Need Help? Contact Support'),
          ),
        ],
      ),
    );
  }

  Widget _profileAction(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE6E7F2)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF4854BA)),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF4A4F68),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileInfoCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6E7F2)),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE4E8FF), Color(0xFFF1F3FF)],
            ),
          ),
          child: Icon(icon, color: const Color(0xFF4D59BE)),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF2E3045),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF676C86),
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ResidentVerifyProfilePage()),
        ),
      ),
    );
  }
}

class ResidentCartPage extends StatefulWidget {
  const ResidentCartPage({super.key});

  @override
  State<ResidentCartPage> createState() => _ResidentCartPageState();
}

class _ResidentCartPageState extends State<ResidentCartPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _nameOnCardController = TextEditingController(text: 'Shamira Balandra');
  final _cardNumberController = TextEditingController(
    text: '4242 4242 4242 4242',
  );
  final _expiryController = TextEditingController(text: '12/28');
  final _cvvController = TextEditingController(text: '123');
  final _addressController = TextEditingController(
    text: '1953 Purok 7, Old Cabalan, Olongapo City, PH',
  );

  bool _placingOrder = false;
  final List<_CartLineItem> _cartItems = [
    _CartLineItem(
      title: 'Laptop',
      seller: 'Tech Essentials',
      price: 15000,
      qty: 1,
      icon: Icons.laptop,
    ),
    _CartLineItem(
      title: 'Printer Ink Set',
      seller: 'Office Plus',
      price: 1350,
      qty: 1,
      icon: Icons.print,
    ),
  ];
  final List<_OrderHistoryEntry> _orders = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  double get _subtotal =>
      _cartItems.fold(0, (sum, item) => sum + (item.price * item.qty));
  double get _deliveryFee => _cartItems.isEmpty ? 0 : 85;
  double get _serviceFee => _cartItems.isEmpty ? 0 : 35;
  double get _grandTotal => _subtotal + _deliveryFee + _serviceFee;

  String _currency(double amount) => 'PHP ${amount.toStringAsFixed(2)}';

  void _changeQty(int index, int delta) {
    setState(() {
      final next = _cartItems[index].qty + delta;
      _cartItems[index].qty = next < 1 ? 1 : next;
    });
  }

  void _removeItem(int index) {
    final item = _cartItems[index];
    setState(() => _cartItems.removeAt(index));
    _showFeature(context, '${item.title} removed from cart');
  }

  Future<void> _placeOrder() async {
    if (_cartItems.isEmpty) {
      _showFeature(context, 'Your cart is empty.');
      return;
    }
    if (_nameOnCardController.text.trim().isEmpty ||
        _cardNumberController.text.trim().isEmpty ||
        _expiryController.text.trim().isEmpty ||
        _cvvController.text.trim().isEmpty) {
      _showFeature(context, 'Please complete billing details.');
      return;
    }

    setState(() => _placingOrder = true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    final orderItems = List<_CartLineItem>.from(
      _cartItems.map(
        (e) => _CartLineItem(
          title: e.title,
          seller: e.seller,
          price: e.price,
          qty: e.qty,
          icon: e.icon,
        ),
      ),
    );
    final order = _OrderHistoryEntry(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch % 100000}',
      date: 'Feb 20, 2026',
      status: 'Processing',
      total: _grandTotal,
      items: orderItems,
    );
    setState(() {
      _orders.insert(0, order);
      _cartItems.clear();
      _placingOrder = false;
    });
    _tabController.animateTo(1);
    _showFeature(context, 'Order placed successfully.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: const Color(0xFFF7F8FF),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            color: const Color(0xFFDCE2FF),
            borderRadius: BorderRadius.circular(999),
          ),
          labelColor: const Color(0xFF2D3150),
          unselectedLabelColor: const Color(0xFF717793),
          labelStyle: const TextStyle(fontWeight: FontWeight.w800),
          tabs: const [
            Tab(text: 'My Cart'),
            Tab(text: 'My Orders'),
            Tab(text: 'Billing'),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F8FF), Color(0xFFF8F0EE)],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF3E4CC7), Color(0xFF6E7DE9)],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x262E35D3),
                        blurRadius: 14,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0x33FFFFFF),
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cart Summary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '${_cartItems.length} item(s) | Total ${_currency(_grandTotal)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFFDDE1FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                if (_cartItems.isEmpty)
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.remove_shopping_cart),
                      title: Text('Your cart is empty'),
                      subtitle: Text('Add products from the marketplace.'),
                    ),
                  )
                else
                  ...List.generate(_cartItems.length, (i) => _cartItemCard(i)),
                const SizedBox(height: 10),
                _billRow('Subtotal', _currency(_subtotal)),
                _billRow('Delivery Fee', _currency(_deliveryFee)),
                _billRow('Service Fee', _currency(_serviceFee)),
                const Divider(),
                _billRow('Grand Total', _currency(_grandTotal), bold: true),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: _cartItems.isEmpty
                      ? null
                      : () => _tabController.animateTo(2),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF2E35D3),
                  ),
                  icon: const Icon(Icons.payment),
                  label: const Text('Proceed to Checkout'),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
              children: [
                if (_orders.isEmpty)
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.inventory_2_outlined),
                      title: Text('No orders yet'),
                      subtitle: Text(
                        'Your confirmed checkout orders appear here.',
                      ),
                    ),
                  )
                else
                  ..._orders.map(
                    (o) => Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E8F4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                o.id,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF2E3046),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE5ECFF),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  o.status,
                                  style: const TextStyle(
                                    color: Color(0xFF3A4CB2),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Date: ${o.date} | Total: ${_currency(o.total)}',
                            style: const TextStyle(
                              color: Color(0xFF666C86),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...o.items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '${item.qty}x ${item.title} (${_currency(item.price * item.qty)})',
                                style: const TextStyle(
                                  color: Color(0xFF4F5672),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE5E8F4)),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameOnCardController,
                        decoration: const InputDecoration(
                          labelText: 'Name on Card',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _cardNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Card Number',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _expiryController,
                              decoration: const InputDecoration(
                                labelText: 'Expiry Date',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _cvvController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'CVV',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _addressController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Delivery Address',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _billRow('Subtotal', _currency(_subtotal)),
                _billRow('Delivery Fee', _currency(_deliveryFee)),
                _billRow('Service Fee', _currency(_serviceFee)),
                const Divider(),
                _billRow('Payable Amount', _currency(_grandTotal), bold: true),
                const SizedBox(height: 10),
                FilledButton.icon(
                  onPressed: (_placingOrder || _cartItems.isEmpty)
                      ? null
                      : _placeOrder,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF2E35D3),
                  ),
                  icon: const Icon(Icons.check_circle),
                  label: Text(
                    _placingOrder ? 'Placing Order...' : 'Place Order',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItemCard(int i) {
    final item = _cartItems[i];
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E7F3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFE8ECFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(item.icon, color: const Color(0xFF4C57BB)),
        ),
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF2F3248),
          ),
        ),
        subtitle: Text(
          '${item.seller} | ${_currency(item.price)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFF686D86),
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: SizedBox(
          width: 104,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => _changeQty(i, -1),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 24,
                  height: 24,
                ),
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(
                '${item.qty}',
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () => _changeQty(i, 1),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 24,
                  height: 24,
                ),
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.add_circle_outline),
              ),
              IconButton(
                onPressed: () => _removeItem(i),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 24,
                  height: 24,
                ),
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _billRow(String label, String value, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
      color: bold ? const Color(0xFF2E3046) : const Color(0xFF676D86),
      fontSize: bold ? 18 : 14,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(label, style: style),
          const Spacer(),
          Text(value, style: style),
        ],
      ),
    );
  }
}

class _CartLineItem {
  final String title;
  final String seller;
  final double price;
  final IconData icon;
  int qty;

  _CartLineItem({
    required this.title,
    required this.seller,
    required this.price,
    required this.qty,
    required this.icon,
  });
}

class _OrderHistoryEntry {
  final String id;
  final String date;
  final String status;
  final double total;
  final List<_CartLineItem> items;

  _OrderHistoryEntry({
    required this.id,
    required this.date,
    required this.status,
    required this.total,
    required this.items,
  });
}

class ResidentSettingsPage extends StatefulWidget {
  const ResidentSettingsPage({super.key});

  @override
  State<ResidentSettingsPage> createState() => _ResidentSettingsPageState();
}

class _ResidentSettingsPageState extends State<ResidentSettingsPage> {
  bool _pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
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
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3644B7), Color(0xFF6B79E9)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x262E35D3),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manage Your Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Control security, profile updates, and preferences.',
                          style: TextStyle(color: Color(0xFFDDE1FF)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE6E8F4)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    value: _pushNotifications,
                    onChanged: (v) => setState(() => _pushNotifications = v),
                    title: const Text(
                      'Push Notifications',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text('Receive account and service updates'),
                    activeThumbColor: const Color(0xFF2E35D3),
                    activeTrackColor: const Color(0xFFBAC0FF),
                  ),
                  const Divider(height: 1),
                  _settingsTile(
                    context,
                    title: 'Reset Password',
                    icon: Icons.lock_reset,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResidentChangePasswordPage(),
                      ),
                    ),
                  ),
                  _settingsTile(
                    context,
                    title: 'Change Email',
                    icon: Icons.alternate_email,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResidentChangeEmailPage(),
                      ),
                    ),
                  ),
                  _settingsTile(
                    context,
                    title: 'Change Address',
                    icon: Icons.home_work_outlined,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResidentChangeAddressPage(),
                      ),
                    ),
                  ),
                  _settingsTile(
                    context,
                    title: 'Delete Account',
                    icon: Icons.delete_outline,
                    danger: true,
                    onTap: () => showDialog<void>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Deleting Account'),
                        content: const Text(
                          'Type DELETE to confirm account removal.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('GO BACK'),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.pop(context),
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFD74637),
                            ),
                            child: const Text('Delete account'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool danger = false,
  }) {
    final color = danger ? const Color(0xFFD74637) : const Color(0xFF404662);
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700, color: color),
      ),
      trailing: Icon(Icons.chevron_right, color: color),
      onTap: onTap,
    );
  }
}

class ResidentChangePasswordPage extends StatelessWidget {
  const ResidentChangePasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            const SizedBox(height: 8),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _showFeature(context, 'Password updated'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentChangeEmailPage extends StatelessWidget {
  const ResidentChangeEmailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Email')),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'New Email')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Confirm Email')),
          ],
        ),
      ),
    );
  }
}

class ResidentChangeAddressPage extends StatelessWidget {
  const ResidentChangeAddressPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Address')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          12,
          12,
          12,
          12 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ListView(
          children: [
            const _StepTabs(active: 'Address'),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please Complete Your Address Details:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(labelText: '1. Select Province'),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: '2. Select City/Municipality',
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(labelText: '3. Select Barangay'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _showFeature(context, 'Address saved'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('CONTINUE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentMemberListPage extends StatelessWidget {
  const ResidentMemberListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Added Member Profiles')),
      body: Column(
        children: [
          const Expanded(child: Center(child: Text('No Added Profiles'))),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResidentAddMemberPage(),
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('Add New Member'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResidentAddMemberPage extends StatefulWidget {
  const ResidentAddMemberPage({super.key});

  @override
  State<ResidentAddMemberPage> createState() => _ResidentAddMemberPageState();
}

class _ResidentAddMemberPageState extends State<ResidentAddMemberPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _suffixController = TextEditingController();
  final _dobController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _genderController = TextEditingController();
  final _religionController = TextEditingController();
  final _civilStatusController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _suffixController.dispose();
    _dobController.dispose();
    _birthPlaceController.dispose();
    _bloodTypeController.dispose();
    _genderController.dispose();
    _religionController.dispose();
    _civilStatusController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _showFeature(
      context,
      'New resident profile saved for ${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Resident'),
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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF3746B9), Color(0xFF6B78E8)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x262E35D3),
                      blurRadius: 13,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0x33FFFFFF),
                      child: Icon(Icons.person_add, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resident Profile Intake',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Capture identity and household details for records.',
                            style: TextStyle(color: Color(0xFFDDE1FF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _memberInput(
                controller: _firstNameController,
                label: 'First Name *',
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'First name is required.'
                    : null,
              ),
              const SizedBox(height: 8),
              _memberInput(
                controller: _middleNameController,
                label: 'Middle Name (Optional)',
              ),
              const SizedBox(height: 8),
              _memberInput(
                controller: _lastNameController,
                label: 'Last Name *',
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Last name is required.'
                    : null,
              ),
              const SizedBox(height: 8),
              _memberInput(
                controller: _suffixController,
                label: 'Suffix (Optional)',
              ),
              const SizedBox(height: 8),
              _memberInput(
                controller: _dobController,
                label: 'Date of Birth *',
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Date of birth is required.'
                    : null,
              ),
              const SizedBox(height: 8),
              _memberInput(
                controller: _birthPlaceController,
                label: 'Place of Birth',
              ),
              const SizedBox(height: 8),
              _memberInput(
                controller: _bloodTypeController,
                label: 'Blood Type',
              ),
              const SizedBox(height: 8),
              _memberInput(controller: _genderController, label: 'Gender'),
              const SizedBox(height: 8),
              _memberInput(controller: _religionController, label: 'Religion'),
              const SizedBox(height: 8),
              _memberInput(
                controller: _civilStatusController,
                label: 'Civil Status',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: FilledButton(
          onPressed: _save,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF2E35D3),
          ),
          child: const Text('Save and Finish'),
        ),
      ),
    );
  }

  Widget _memberInput({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE4E7F4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF4B56BA), width: 1.4),
        ),
      ),
    );
  }
}

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  String _query = '';

  static const _faqItems = [
    (
      'How do I request a barangay clearance?',
      'Open Services > Clearance, complete your profile details, submit purpose, and track status in Requests.',
      'Clearance',
    ),
    (
      'How long does assistance approval take?',
      'Assistance requests are reviewed within 1-3 working days depending on document completeness.',
      'Assistance',
    ),
    (
      'How do I verify my RBI profile?',
      'Go to Profile > Verify Account, complete required details, and upload valid supporting documents.',
      'RBI',
    ),
    (
      'Can I update my address after registration?',
      'Yes. Open Settings > Change Address and submit your updated barangay details.',
      'Account',
    ),
    (
      'How do I report an emergency incident?',
      'Go to Services > BPAT or Responder and select report/patrol request for immediate action.',
      'Safety',
    ),
    (
      'How do I contact support?',
      'Use Support page quick actions (call, email, FAQ search, or submit a ticket).',
      'Support',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final q = _query.trim().toLowerCase();
    final items = _faqItems.where((item) {
      final bag = '${item.$1} ${item.$2} ${item.$3}'.toLowerCase();
      return q.isEmpty || bag.contains(q);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
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
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4453C8), Color(0xFF7382F0)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x233441B2),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.help_center, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search using keywords...',
              ),
            ),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Card(
                child: ListTile(
                  leading: Icon(Icons.search_off),
                  title: Text('No FAQ results found'),
                ),
              )
            else
              ...items.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xFFE6E8F4)),
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    title: Text(
                      item.$1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2F3248),
                      ),
                    ),
                    subtitle: Text(
                      item.$3,
                      style: const TextStyle(
                        color: Color(0xFF6D7390),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.$2,
                            style: const TextStyle(
                              color: Color(0xFF5C627D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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

class TermsPolicyScreen extends StatelessWidget {
  const TermsPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy and Terms'),
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
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4453C8), Color(0xFF6D7CE8)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x223541B3),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.policy, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Data Privacy and Platform Terms',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _policyCard(
              title: 'Privacy Policy',
              subtitle: 'Last Updated: Feb 20, 2026',
              points: const [
                'Personal information is used only for barangay service delivery.',
                'Sensitive profile data is protected and access-controlled.',
                'Residents may request profile corrections through Settings.',
              ],
            ),
            const SizedBox(height: 9),
            _policyCard(
              title: 'Terms and Conditions',
              subtitle: 'Last Updated: Feb 20, 2026',
              points: const [
                'Use accurate information for requests and registrations.',
                'Abusive, fraudulent, or false submissions may be blocked.',
                'Service timelines may vary based on document verification.',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _policyCard({
    required String title,
    required String subtitle,
    required List<String> points,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6E8F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2E3248),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF6B728D),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          ...points.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Color(0xFF3FA96D),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      p,
                      style: const TextStyle(
                        color: Color(0xFF5B617D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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

class ResidentFaqPage extends StatelessWidget {
  const ResidentFaqPage({super.key});
  @override
  Widget build(BuildContext context) => const FaqScreen();
}

class ResidentSharePage extends StatelessWidget {
  const ResidentSharePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Share')),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'BarangayMo Residents',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8),
            Text('Help your friends discover community services.'),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('SHARE VIA EMAIL'),
            ),
            ListTile(
              leading: Icon(Icons.facebook),
              title: Text('SHARE VIA FACEBOOK'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentSupportPage extends StatelessWidget {
  const ResidentSupportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
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
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF8B4D44), Color(0xFFB36A5B)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x25000000),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.support_agent, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Shamira',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'How can we help you today?',
                          style: TextStyle(
                            color: Color(0xFFFFE5E0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _supportAction(
                    context,
                    title: 'Call us',
                    subtitle: '(047) 251-2041',
                    icon: Icons.call,
                    onTap: () =>
                        _showFeature(context, 'Calling support line...'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _supportAction(
                    context,
                    title: 'Email us',
                    subtitle: 'support@barangaymo.ph',
                    icon: Icons.email_outlined,
                    onTap: () =>
                        _showFeature(context, 'Opening email support...'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _supportAction(
                    context,
                    title: 'Search FAQs',
                    subtitle: 'Answers',
                    icon: Icons.help_center_outlined,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResidentFaqPage(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE6E8F4)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF845046)),
                      SizedBox(width: 7),
                      Text(
                        'Office Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2F3248),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '1953 Purok 7, Old Cabalan, Olongapo City, PH',
                    style: TextStyle(
                      color: Color(0xFF5D627C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Mon-Fri 8:00 AM - 5:00 PM',
                    style: TextStyle(
                      color: Color(0xFF6B718D),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResidentBugReportPage(),
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                icon: const Icon(Icons.campaign),
                label: const Text('Submit a Support Ticket'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _supportAction(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE6E8F4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF5D647F)),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xFF2F3248),
              ),
            ),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF666D88),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentBugReportPage extends StatefulWidget {
  const ResidentBugReportPage({super.key});

  @override
  State<ResidentBugReportPage> createState() => _ResidentBugReportPageState();
}

class _ResidentBugReportPageState extends State<ResidentBugReportPage> {
  final _bugNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _screenshotName;

  @override
  void dispose() {
    _bugNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bug Report'),
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
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3443B7), Color(0xFF6976E7)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x262E35D3),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.bug_report, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Report a Problem',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Help us resolve issues quickly by sharing clear details and a screenshot.',
                          style: TextStyle(color: Color(0xFFDDE1FF)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE6E8F4)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _bugNameController,
                    decoration: const InputDecoration(labelText: 'Bug Name'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText:
                          'Describe what happened and steps to reproduce.',
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFDDE2F6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: Color(0xFF4A55B8),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Upload Screenshot',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF363B57),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (_screenshotName != null)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFE0E3F4),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.insert_photo,
                                  color: Color(0xFF4A55B8),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _screenshotName!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      setState(() => _screenshotName = null),
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          )
                        else
                          const Text(
                            'No screenshot attached yet.',
                            style: TextStyle(color: Color(0xFF6A6F89)),
                          ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _mockAttach('gallery'),
                                icon: const Icon(Icons.photo_library_outlined),
                                label: const Text('Gallery'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _mockAttach('camera'),
                                icon: const Icon(Icons.camera_alt_outlined),
                                label: const Text('Camera'),
                              ),
                            ),
                          ],
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: FilledButton(
          onPressed: () {
            _showFeature(context, 'Bug report submitted. Thank you!');
            Navigator.pop(context);
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF2E35D3),
          ),
          child: const Text('Submit Ticket'),
        ),
      ),
    );
  }

  void _mockAttach(String source) {
    final stamp = DateTime.now().millisecondsSinceEpoch % 100000;
    setState(() => _screenshotName = '${source}_screenshot_$stamp.png');
  }
}

class ResidentVerifyProfilePage extends StatefulWidget {
  const ResidentVerifyProfilePage({super.key});

  @override
  State<ResidentVerifyProfilePage> createState() =>
      _ResidentVerifyProfilePageState();
}

class _ResidentVerifyProfilePageState extends State<ResidentVerifyProfilePage> {
  final Map<String, bool> _utilities = {
    'Electricity': true,
    'Water Supply': true,
    'Sewage/Toilet Facilities': true,
    'Garbage/Waste Disposal': false,
    'Internet Access': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: AppBar(
        title: const Text(
          'Complete Profile Information',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFFF6F8FF),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF6F8FF), Color(0xFFF8F0EE)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 16),
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3E4CC7), Color(0xFF6673E5)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x262E35D3),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFFF2EE), Color(0xFFF7E5DE)],
                      ),
                      border: Border.all(color: const Color(0x66FFFFFF)),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF874A3E),
                      size: 34,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manuel Dalanan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'RBI-3-7-34-84414283',
                          style: TextStyle(color: Color(0xFFDDE1FF)),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Profile Completion: 78%',
                          style: TextStyle(
                            color: Color(0xFFF2F4FF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        _showFeature(context, 'Edit profile photo'),
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _formSection(
              title: 'Education and Employment',
              icon: Icons.school_outlined,
              children: const [
                SizedBox(height: 8),
                _StyledInput(label: 'Highest Educational Attainment *'),
                SizedBox(height: 8),
                _StyledInput(label: 'Type of Employment *'),
                SizedBox(height: 8),
                _StyledInput(label: 'Sector'),
              ],
            ),
            const SizedBox(height: 10),
            _formSection(
              title: 'Household Information',
              icon: Icons.home_work_outlined,
              children: const [
                SizedBox(height: 8),
                _StyledInput(label: 'Number of People in the Household *'),
                SizedBox(height: 8),
                _StyledInput(label: 'Monthly Household Income'),
                SizedBox(height: 8),
                _StyledInput(label: 'House Ownership Status *'),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE4E7F3)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.power, color: Color(0xFF4653B7)),
                      SizedBox(width: 8),
                      Text(
                        'Utilities Available',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2E3146),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ..._utilities.entries.map(
                    (entry) => _utilityRow(
                      label: entry.key,
                      enabled: entry.value,
                      onChanged: (v) =>
                          setState(() => _utilities[entry.key] = v),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE7EAFF), Color(0xFFF4F2FF)],
                ),
                border: Border.all(color: const Color(0xFFD9DFFF)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.verified_user, color: Color(0xFF2E35D3)),
                      SizedBox(width: 8),
                      Text(
                        'Verify Your Account',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'To access comprehensive barangay services, e-commerce, and job benefits, ensure your profile details are complete and accurate.',
                    style: TextStyle(
                      color: Color(0xFF4B4F69),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () =>
                              _showFeature(context, 'Verification submitted'),
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF2E35D3),
                          ),
                          child: const Text('Verify Now'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Maybe Later'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4E7F3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF4653B7)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3146),
                ),
              ),
            ],
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _utilityRow({
    required String label,
    required bool enabled,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5F7),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFEDE7EB)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF5C5F74),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Switch.adaptive(
            value: enabled,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFF2E35D3),
            activeTrackColor: const Color(0xFFB5B9FF),
          ),
        ],
      ),
    );
  }
}

class _StyledInput extends StatelessWidget {
  final String label;
  const _StyledInput({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF9FAFF),
        labelStyle: const TextStyle(
          color: Color(0xFF5D6281),
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E5F1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF4B56BA), width: 1.4),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }
}

class ResidentAboutPage extends StatelessWidget {
  const ResidentAboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
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
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3F4CC5), Color(0xFF6B79E8)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26303AB0),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.apartment, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BarangayMo Platform',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Digital frontline services for residents, officials, and local governance.',
                          style: TextStyle(
                            color: Color(0xFFDDE2FF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: _AboutKpi(
                    title: '22,365',
                    subtitle: 'Residents Served',
                    icon: Icons.people,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _AboutKpi(
                    title: '24/7',
                    subtitle: 'Service Access',
                    icon: Icons.public,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _aboutCard(
              title: 'Our Mission',
              body:
                  'Improve local governance through transparent and accessible digital services that connect residents, officials, and community programs.',
              icon: Icons.track_changes,
            ),
            const SizedBox(height: 9),
            _aboutCard(
              title: 'Our Team',
              body:
                  'A joint team of barangay officers, service staff, and technology partners committed to faster public service delivery.',
              icon: Icons.groups,
            ),
            const SizedBox(height: 9),
            _aboutCard(
              title: 'Core Values',
              body:
                  'Accuracy, accountability, inclusivity, and community-first support for every request and transaction.',
              icon: Icons.verified_user,
            ),
          ],
        ),
      ),
    );
  }

  Widget _aboutCard({
    required String title,
    required String body,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E8F4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFE8ECFF),
            ),
            child: Icon(icon, color: const Color(0xFF4B56BA), size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2E3248),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  body,
                  style: const TextStyle(
                    color: Color(0xFF5D637F),
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
}

class _AboutKpi extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _AboutKpi({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E8F4)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFE8ECFF),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF4B56BA)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2E3248),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF6A708C),
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
}

class ResidentTermsPage extends StatelessWidget {
  const ResidentTermsPage({super.key});
  @override
  Widget build(BuildContext context) => const TermsPolicyScreen();
}

class ResidentNotificationsPage extends StatelessWidget {
  const ResidentNotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Notifications'),
              Tab(text: 'History'),
              Tab(text: 'Transactions'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Empty Notifications')),
            _ResidentHistory(),
            Center(child: Text('Empty Transactions')),
          ],
        ),
      ),
    );
  }
}

class _ResidentHistory extends StatelessWidget {
  const _ResidentHistory();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: List.generate(
        4,
        (i) => Card(
          child: ListTile(
            title: const Text('Profile Update'),
            subtitle: const Text('You updated your profile details.'),
            trailing: const Text('4 hours ago'),
          ),
        ),
      ),
    );
  }
}
