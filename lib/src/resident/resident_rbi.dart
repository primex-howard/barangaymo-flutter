part of 'package:barangaymo_app/main.dart';

class ResidentRbiCardPage extends StatelessWidget {
  const ResidentRbiCardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RBI CARD'),
          backgroundColor: const Color(0xFFF7F8FF),
          bottom: TabBar(
            indicatorColor: const Color(0xFF2E35D3),
            labelColor: const Color(0xFF8B4E46),
            unselectedLabelColor: const Color(0xFF5F637B),
            labelStyle: const TextStyle(fontWeight: FontWeight.w800),
            tabs: const [
              Tab(text: 'My Card'),
              Tab(text: 'Profile'),
              Tab(text: 'Transaction'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_RbiMyCard(), _RbiProfileData(), _RbiTransactions()],
        ),
      ),
    );
  }
}

class _RbiMyCard extends StatelessWidget {
  const _RbiMyCard();
  @override
  Widget build(BuildContext context) {
    return Container(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFCF8F8), Color(0xFFF0ECF7)],
              ),
              border: Border.all(color: const Color(0xFFE3E1EC)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFE8ECFF), Color(0xFFF1F4FF)],
                      ),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Richard Portacio Perez',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1F1A22),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'RBI-3-7-34-87709622',
                    style: TextStyle(
                      color: Color(0xFF595569),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFE7E7EF)),
                        ),
                        child: const Center(
                          child: Icon(Icons.qr_code_2, size: 72),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _RbiMiniStat(
                              label: 'Status',
                              value: 'Active',
                              icon: Icons.verified,
                            ),
                            SizedBox(height: 8),
                            _RbiMiniStat(
                              label: 'Updated',
                              value: 'Feb 20, 2026',
                              icon: Icons.update,
                            ),
                            SizedBox(height: 8),
                            _RbiMiniStat(
                              label: 'Barangay',
                              value: 'Old Cabalan',
                              icon: Icons.location_on,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: () =>
                        _showFeature(context, 'Digital RBI card shared.'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF2E35D3),
                    ),
                    icon: const Icon(Icons.share),
                    label: const Text('Share Digital Card'),
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

class _RbiProfileData extends StatelessWidget {
  const _RbiProfileData();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF7F8FF), Color(0xFFF8F0EE)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
        children: const [
          _RbiInfoCard(
            title: 'Personal',
            subtitle:
                'Nationality, gender, date of birth, blood type, civil status, religion',
            icon: Icons.person_outline,
          ),
          _RbiInfoCard(
            title: 'Government IDs',
            subtitle: 'SSS number, TIN, driver license, passport details',
            icon: Icons.badge_outlined,
          ),
          _RbiInfoCard(
            title: 'Education / Health',
            subtitle: 'Attainment, profession, job status, height and weight',
            icon: Icons.school_outlined,
          ),
        ],
      ),
    );
  }
}

class _RbiTransactions extends StatelessWidget {
  const _RbiTransactions();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF7F8FF), Color(0xFFF8F0EE)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
        children: const [
          _RbiTxnCard(
            title: 'RBI Profile Update',
            date: 'Feb 20, 2026',
            status: 'Completed',
          ),
          _RbiTxnCard(
            title: 'Card Verification Check',
            date: 'Feb 18, 2026',
            status: 'Completed',
          ),
          _RbiTxnCard(
            title: 'Barangay Service Access',
            date: 'Feb 14, 2026',
            status: 'Completed',
          ),
        ],
      ),
    );
  }
}

class _RbiMiniStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _RbiMiniStat({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6E7F2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 17, color: const Color(0xFF4A55B8)),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF646A86),
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2D3047),
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

class _RbiInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const _RbiInfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6E8F4)),
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
              colors: [Color(0xFFE4E8FF), Color(0xFFF2F4FF)],
            ),
          ),
          child: Icon(icon, color: const Color(0xFF4A55B8)),
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
      ),
    );
  }
}

class _RbiTxnCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  const _RbiTxnCard({
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE6E8F4)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE4E8FF),
            child: Icon(Icons.receipt_long, color: Color(0xFF4A55B8)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2E3045),
                  ),
                ),
                Text(date, style: const TextStyle(color: Color(0xFF676C86))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F8EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Color(0xFF2D8E55),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
