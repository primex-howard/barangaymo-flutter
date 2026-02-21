part of 'package:barangaymo_app/main.dart';

class ResponderPage extends StatelessWidget {
  const ResponderPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barangay Emergency'),
        backgroundColor: const Color(0xFFD70000),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _sectionTitle('Emergency Contacts'),
          ...['BPAT', 'Police', 'Fire Department', 'Ambulance'].map(
            (e) => Card(
              child: ListTile(
                leading: const Icon(Icons.shield_outlined),
                title: Text(e),
                trailing: FilledButton(
                  onPressed: () => _showFeature(context, 'Calling $e...'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade500,
                  ),
                  child: const Text('Call'),
                ),
              ),
            ),
          ),
          _sectionTitle('Quick Actions'),
          _goTile(
            context,
            'Share Live Location',
            const SimpleSerbilisPage(title: 'Share Live Location'),
          ),
          _goTile(context, 'Emergency Hotlines', const EmergencyHotlinesPage()),
          _goTile(
            context,
            'Message Barangay',
            const SimpleSerbilisPage(title: 'Message Barangay'),
          ),
          _sectionTitle('Medical Info'),
          const MedicalInfoAccordions(),
        ],
      ),
    );
  }
}

class MedicalInfoAccordions extends StatelessWidget {
  const MedicalInfoAccordions({super.key});
  @override
  Widget build(BuildContext context) {
    const items = [
      (
        'How to perform CPR',
        'Check scene safety, call emergency services, begin chest compressions, and give rescue breaths if trained.',
      ),
      (
        'How to deal with choking',
        'For severe choking, perform back blows and abdominal thrusts. Call emergency services immediately.',
      ),
      (
        'How to treat burns',
        'Cool the burn under clean water for 10-20 minutes, avoid ice, and cover with sterile cloth.',
      ),
      (
        'How to handle fractures',
        'Immobilize the injured area, avoid moving the limb, and seek urgent medical care.',
      ),
      (
        'How to stop bleeding',
        'Apply direct pressure with clean cloth and elevate wound if possible.',
      ),
    ];
    return Column(
      children: items
          .map(
            (e) => Card(
              child: ExpansionTile(
                title: Text(e.$1),
                children: [
                  Padding(padding: const EdgeInsets.all(12), child: Text(e.$2)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class EmergencyHotlinesPage extends StatelessWidget {
  const EmergencyHotlinesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final data = [
      ('Actionline Against Human Trafficking', '1343'),
      ('PDEA', '(02) 8929-6672'),
      ('Bantay Bata 163', '163'),
      ('Lifeline Ambulance Rescue', '16-911'),
      ('DSWD', '(02) 8931-8101'),
      ('Philippine Coast Guard', '(02) 8527-8481'),
      ('MMDA', '(02) 8822-4151'),
      ('DOH', '(02) 8942-6843'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Hotlines'),
        backgroundColor: const Color(0xFFD70000),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: data
            .map(
              (e) => Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.local_phone)),
                  title: Text(e.$1),
                  subtitle: Text(e.$2),
                  trailing: const Icon(Icons.phone),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR ID Scanner'),
        backgroundColor: const Color(0xFFD70000),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF011A32),
              child: const Center(
                child: Icon(
                  Icons.qr_code_scanner,
                  size: 90,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.qr_code, color: Color(0xFFD70000)),
            title: Text('Scan Resident Barangay ID'),
            subtitle: Text('Position the ID within the frame for scanning'),
          ),
        ],
      ),
    );
  }
}

class AssistancePage extends StatelessWidget {
  const AssistancePage({super.key});
  @override
  Widget build(BuildContext context) {
    const items = [
      (
        'Burial Assistance',
        'Funeral aid and urgent family support',
        Icons.volunteer_activism,
        Color(0xFFFFE2D8),
      ),
      (
        'Educational Assistance',
        'School supplies, tuition and scholarship referrals',
        Icons.school,
        Color(0xFFDDE6FF),
      ),
      (
        'Financial Assistance',
        'Emergency cash support for qualified residents',
        Icons.account_balance_wallet,
        Color(0xFFE0F3E8),
      ),
      (
        'Medical Assistance',
        'Hospital endorsement and treatment support',
        Icons.local_hospital,
        Color(0xFFFFE6E2),
      ),
      (
        'Medicine Assistance',
        'Prescription medicine access and subsidy',
        Icons.medication,
        Color(0xFFE7EEFF),
      ),
      (
        'Sponsorship Assistance',
        'Program and event sponsorship endorsements',
        Icons.card_giftcard,
        Color(0xFFFFE9D9),
      ),
      (
        'Venue Assistance',
        'Barangay venue usage and reservation support',
        Icons.location_city,
        Color(0xFFE7F1FF),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistance'),
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
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD94646), Color(0xFFEF6767)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29D74637),
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
                          'What type of assistance do you need?',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Select a program to start your request and review eligibility requirements.',
                          style: TextStyle(color: Color(0xFFFFDFDF)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.handshake_outlined, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...items.map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
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
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: e.$4,
                    ),
                    child: Icon(e.$3, color: const Color(0xFF4A4F6A)),
                  ),
                  title: Text(
                    e.$1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2F3248),
                    ),
                  ),
                  subtitle: Text(
                    e.$2,
                    style: const TextStyle(
                      color: Color(0xFF686C86),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showFeature(
                    context,
                    'Starting ${e.$1.toLowerCase()} request flow.',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BpatPage extends StatelessWidget {
  const BpatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BPAT Assistance'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Call'),
              Tab(text: 'Blotter'),
              Tab(text: 'Records'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(12),
              children: [
                const Text(
                  'BPAT (Barangay Peace Keeping Action Team)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Help with public safety, crime prevention, and community support.',
                ),
                const SizedBox(height: 8),
                _goTile(
                  context,
                  'Call BPAT Emergency Line',
                  const SimpleSerbilisPage(title: 'Call BPAT'),
                ),
                _goTile(context, 'Report an Incident', const BpatReportPage()),
                _goTile(context, 'Request Patrol', const BpatPatrolPage()),
              ],
            ),
            const BpatBlotterPage(),
            const BpatRecordsPage(),
          ],
        ),
      ),
    );
  }
}

class BpatReportPage extends StatelessWidget {
  const BpatReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Incident Report')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          TextField(decoration: InputDecoration(labelText: 'Report Type')),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Time of Incident')),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Location')),
          SizedBox(height: 8),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Person Involved')),
          SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(labelText: 'Action Taken'),
          ),
          SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(labelText: 'Further Action Needed'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: FilledButton(
          onPressed: () => _showFeature(context, 'Incident report submitted.'),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFD70000),
          ),
          child: const Text('SUBMIT REPORT'),
        ),
      ),
    );
  }
}

class BpatPatrolPage extends StatelessWidget {
  const BpatPatrolPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Patrol')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          TextField(
            decoration: InputDecoration(labelText: 'Location for Patrol'),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(labelText: 'Reason for Patrol Request'),
          ),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Preferred Time')),
          SizedBox(height: 8),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Additional Comments'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: FilledButton(
          onPressed: () => showDialog<void>(
            context: context,
            builder: (_) => const AlertDialog(
              title: Text('Submitted'),
              content: Text('Your patrol request has been received.'),
            ),
          ),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFD70000),
          ),
          child: const Text('SUBMIT PATROL REQUEST'),
        ),
      ),
    );
  }
}

class BpatBlotterPage extends StatelessWidget {
  const BpatBlotterPage({super.key});
  @override
  Widget build(BuildContext context) {
    final data = [
      'csac avsv',
      'LOIDA LAXA HUSSEY',
      'ANGELO GREGG ELANE',
      'Lester Castro Nadong',
    ];
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
          ),
        ),
        const SizedBox(height: 8),
        ...data.map(
          (e) => Card(
            child: ListTile(
              title: Text(e),
              subtitle: const Text('RBI-3-6-10'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ],
    );
  }
}

class BpatRecordsPage extends StatelessWidget {
  const BpatRecordsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search person involved, report ID...',
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(
          4,
          (i) => Card(
            child: ListTile(
              title: Text('IR-$i'),
              subtitle: const Text('2/10/2025 5:38 AM'),
              trailing: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SimpleSerbilisPage(
                      title: 'Incident Report Details',
                    ),
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFD70000),
                ),
                child: const Text('DETAILS'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClearancePage extends StatelessWidget {
  const ClearancePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Documents'),
          backgroundColor: const Color(0xFFF7F8FF),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              color: const Color(0xFFDDE2FF),
              borderRadius: BorderRadius.circular(999),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: const Color(0xFF2D3150),
            unselectedLabelColor: const Color(0xFF737992),
            labelStyle: const TextStyle(fontWeight: FontWeight.w800),
            tabs: const [
              Tab(text: 'Pending'),
              Tab(text: 'Approved'),
              Tab(text: 'Rejected'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _DocList(status: 'Pending'),
            _DocList(status: 'Approved'),
            _DocList(status: 'Rejected'),
            _DocList(status: 'Completed'),
          ],
        ),
      ),
    );
  }
}

class _DocList extends StatefulWidget {
  final String status;
  const _DocList({required this.status});

  @override
  State<_DocList> createState() => _DocListState();
}

class _DocListState extends State<_DocList> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final documents = _documentsByStatus(widget.status);
    final accent = _statusColor(widget.status);
    final q = _query.trim().toLowerCase();
    final rows = documents.where((d) {
      final bag = '${d.title} ${d.subtitle} ${d.reference} ${d.detail}'
          .toLowerCase();
      return q.isEmpty || bag.contains(q);
    }).toList();

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
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accent.withValues(alpha: 0.95),
                  accent.withValues(alpha: 0.75),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 12,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0x36FFFFFF),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Icon(Icons.folder_copy, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.status} Documents',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        '${documents.length} requests | Avg turnaround ${_processingEta(widget.status)}',
                        style: const TextStyle(
                          color: Color(0xFFECEFFF),
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
          TextField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search by name, ID, purpose...',
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
          if (rows.isEmpty)
            const Card(
              child: ListTile(
                leading: Icon(Icons.search_off),
                title: Text('No matching documents'),
              ),
            )
          else
            ...rows.map(
              (d) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE4E7F3)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11000000),
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
                        CircleAvatar(
                          backgroundColor: accent.withValues(alpha: 0.13),
                          child: Icon(d.icon, color: accent),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            d.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF2D314A),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              color: accent,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      d.subtitle,
                      style: const TextStyle(
                        color: Color(0xFF555C77),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      d.detail,
                      style: const TextStyle(
                        color: Color(0xFF666B84),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.confirmation_number_outlined,
                          size: 16,
                          color: Color(0xFF7A809A),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          d.reference,
                          style: const TextStyle(
                            color: Color(0xFF7A809A),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () =>
                              _showFeature(context, '${d.title} details'),
                          icon: Icon(
                            widget.status == 'Approved'
                                ? Icons.visibility
                                : widget.status == 'Completed'
                                ? Icons.download
                                : Icons.chevron_right,
                            color: accent,
                            size: 18,
                          ),
                          label: Text(
                            _statusAction(widget.status),
                            style: TextStyle(color: accent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<_DocEntry> _documentsByStatus(String status) {
    switch (status) {
      case 'Approved':
        return const [
          _DocEntry(
            title: 'Barangay Clearance',
            subtitle: 'Approved on Feb 18, 2026',
            detail: 'Purpose: Employment requirement',
            reference: 'BC-26-0218',
            icon: Icons.task_alt,
          ),
          _DocEntry(
            title: 'Certificate of Residency',
            subtitle: 'Approved on Feb 14, 2026',
            detail: 'Purpose: Scholarship application',
            reference: 'CR-26-0214',
            icon: Icons.home,
          ),
          _DocEntry(
            title: 'Business Endorsement',
            subtitle: 'Approved on Feb 10, 2026',
            detail: 'Purpose: Market stall permit',
            reference: 'BE-26-0210',
            icon: Icons.store,
          ),
        ];
      case 'Rejected':
        return const [
          _DocEntry(
            title: 'Medical Assistance Form',
            subtitle: 'Rejected on Feb 16, 2026',
            detail: 'Reason: Missing hospital abstract',
            reference: 'MA-26-0216',
            icon: Icons.local_hospital,
          ),
          _DocEntry(
            title: 'Scholarship Assistance',
            subtitle: 'Rejected on Feb 11, 2026',
            detail: 'Reason: Incomplete school attachments',
            reference: 'SA-26-0211',
            icon: Icons.school,
          ),
        ];
      case 'Completed':
        return const [
          _DocEntry(
            title: 'Barangay Clearance',
            subtitle: 'Completed and downloaded',
            detail: 'Released to resident on Feb 04, 2026',
            reference: 'BC-26-0204',
            icon: Icons.download_done,
          ),
          _DocEntry(
            title: 'Community Certificate',
            subtitle: 'Completed and released',
            detail: 'Released to resident on Jan 29, 2026',
            reference: 'CC-26-0129',
            icon: Icons.verified,
          ),
        ];
      case 'Pending':
      default:
        return const [
          _DocEntry(
            title: 'Barangay Clearance',
            subtitle: 'Pending verification of residency',
            detail: 'Submitted Feb 20, 2026',
            reference: 'BC-26-0220',
            icon: Icons.description,
          ),
          _DocEntry(
            title: 'Certificate of Indigency',
            subtitle: 'Queued for captain signature',
            detail: 'Submitted Feb 19, 2026',
            reference: 'CI-26-0219',
            icon: Icons.assignment_turned_in,
          ),
          _DocEntry(
            title: 'Medical Assistance Form',
            subtitle: 'Under social worker review',
            detail: 'Submitted Feb 18, 2026',
            reference: 'MA-26-0218',
            icon: Icons.health_and_safety,
          ),
        ];
    }
  }

  String _processingEta(String status) {
    switch (status) {
      case 'Approved':
        return '2 days';
      case 'Rejected':
        return '1 day';
      case 'Completed':
        return '0 day';
      case 'Pending':
      default:
        return '3 days';
    }
  }

  String _statusAction(String status) {
    switch (status) {
      case 'Approved':
        return 'View';
      case 'Completed':
        return 'Download';
      case 'Rejected':
        return 'Review';
      case 'Pending':
      default:
        return 'Track';
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Approved':
        return const Color(0xFF2D8E55);
      case 'Rejected':
        return const Color(0xFFD74637);
      case 'Completed':
        return const Color(0xFF3650C4);
      case 'Pending':
      default:
        return const Color(0xFF7A5A43);
    }
  }
}

class _DocEntry {
  final String title;
  final String subtitle;
  final String detail;
  final String reference;
  final IconData icon;
  const _DocEntry({
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.reference,
    required this.icon,
  });
}

class CouncilPage extends StatelessWidget {
  const CouncilPage({super.key});
  @override
  Widget build(BuildContext context) {
    final data = [
      'DONALD ELAD AQUINO',
      'LARRY DELA ROSA TOLEDO',
      'RIGOR BILONO AVILANES',
      'ROBERTO TOGONON ANTONIO',
      'WILFREDO FABABI MIRANDA',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Council'),
        backgroundColor: const Color(0xFFD70000),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: data
            .map(
              (e) => Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(e),
                  subtitle: const Text('Sangguniang Barangay Member'),
                  trailing: const Icon(Icons.edit, size: 16),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD70000),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) => const _CouncilFormSheet(),
        ),
      ),
    );
  }
}

class _CouncilFormSheet extends StatelessWidget {
  const _CouncilFormSheet();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              'Add Member of Council',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'First Name')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Middle Name')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Last Name')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Position')),
          ],
        ),
      ),
    );
  }
}

class DisclosureBoardPage extends StatelessWidget {
  const DisclosureBoardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Disbursement'),
          backgroundColor: const Color(0xFFD70000),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Disbursement'),
              Tab(text: 'Disclosure'),
              Tab(text: 'AIP'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _SimplePage('Disbursement', [
              'General Services',
              'Capital Outlay',
              'Social Services',
            ]),
            _SimplePage('Disclosure', [
              'Search products/services',
              'Date',
              'Disbursement list',
            ]),
            _SimplePage('AIP', [
              'Annual Investment Plan CY 2025',
              'AIP Table',
              'Print Report',
            ]),
          ],
        ),
      ),
    );
  }
}

class GovAgenciesPage extends StatelessWidget {
  const GovAgenciesPage({super.key});
  @override
  Widget build(BuildContext context) {
    const agencies = [
      _AgencyInfo(
        code: 'DFA',
        name: 'Department of Foreign Affairs',
        subtitle: 'Passport and consular services',
        website: 'dfa.gov.ph',
        logoDomain: 'dfa.gov.ph',
        color: Color(0xFF204D90),
        icon: Icons.public,
      ),
      _AgencyInfo(
        code: 'DILG',
        name: 'Department of the Interior and Local Government',
        subtitle: 'Local governance and LGU support',
        website: 'dilg.gov.ph',
        logoDomain: 'dilg.gov.ph',
        color: Color(0xFF2F5A3D),
        icon: Icons.account_balance,
      ),
      _AgencyInfo(
        code: 'DOLE',
        name: 'Department of Labor and Employment',
        subtitle: 'Jobs, labor rights, and welfare',
        website: 'dole.gov.ph',
        logoDomain: 'dole.gov.ph',
        color: Color(0xFF6A4A9B),
        icon: Icons.work_history,
      ),
      _AgencyInfo(
        code: 'DPWH',
        name: 'Department of Public Works and Highways',
        subtitle: 'Roads, bridges, and infrastructure',
        website: 'dpwh.gov.ph',
        logoDomain: 'dpwh.gov.ph',
        color: Color(0xFFC96A2A),
        icon: Icons.engineering,
      ),
      _AgencyInfo(
        code: 'DSWD',
        name: 'Department of Social Welfare and Development',
        subtitle: 'Social protection and family aid',
        website: 'dswd.gov.ph',
        logoDomain: 'dswd.gov.ph',
        color: Color(0xFFB24556),
        icon: Icons.volunteer_activism,
      ),
      _AgencyInfo(
        code: 'LTO',
        name: 'Land Transportation Office',
        subtitle: 'Licensing and vehicle registration',
        website: 'lto.gov.ph',
        logoDomain: 'lto.gov.ph',
        color: Color(0xFF455FBD),
        icon: Icons.directions_car_filled,
      ),
      _AgencyInfo(
        code: 'OP',
        name: 'Office of the President',
        subtitle: 'National executive office',
        website: 'op-proper.gov.ph',
        logoDomain: 'op-proper.gov.ph',
        color: Color(0xFF7D3F32),
        icon: Icons.shield,
      ),
      _AgencyInfo(
        code: 'OLG',
        name: 'Olongapo City Government',
        subtitle: 'City-level frontline services',
        website: 'olongapocity.gov.ph',
        logoDomain: 'olongapocity.gov.ph',
        color: Color(0xFF2D7A8A),
        icon: Icons.location_city,
      ),
      _AgencyInfo(
        code: 'PNP',
        name: 'Philippine National Police',
        subtitle: 'Public safety and law enforcement',
        website: 'pnp.gov.ph',
        logoDomain: 'pnp.gov.ph',
        color: Color(0xFF1B4B9A),
        icon: Icons.local_police,
      ),
      _AgencyInfo(
        code: 'SEN',
        name: 'Senate of the Philippines',
        subtitle: 'Legislation and public oversight',
        website: 'senate.gov.ph',
        logoDomain: 'senate.gov.ph',
        color: Color(0xFF8F2F3C),
        icon: Icons.gavel,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Government Agencies'),
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
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFCF4545), Color(0xFFEA6C67)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26C63E3E),
                    blurRadius: 12,
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
                          'National Agency Directory',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Official channels for permits, labor, transport, welfare, and public safety.',
                          style: TextStyle(
                            color: Color(0xFFFFE3DF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0x3CFFFFFF),
                    child: Icon(Icons.apartment, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: agencies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (_, i) => _agencyCard(context, agencies[i]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _agencyCard(BuildContext context, _AgencyInfo agency) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(agency.name),
          content: Text(
            '${agency.subtitle}\n\nWebsite: ${agency.website}\nOpen in browser when online access is enabled.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                _showFeature(context, 'Opening ${agency.website}');
              },
              child: const Text('Open Portal'),
            ),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE5E7F4)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 9,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AgencyLogoBadge(agency: agency),
            const SizedBox(height: 10),
            Text(
              agency.code,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: agency.color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              agency.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D3149),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              agency.subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF676D89),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.language, size: 14, color: Color(0xFF78809B)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    agency.website,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF78809B),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
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

class _AgencyInfo {
  final String code;
  final String name;
  final String subtitle;
  final String website;
  final String logoDomain;
  final Color color;
  final IconData icon;

  const _AgencyInfo({
    required this.code,
    required this.name,
    required this.subtitle,
    required this.website,
    required this.logoDomain,
    required this.color,
    required this.icon,
  });
}

class _AgencyLogoBadge extends StatelessWidget {
  final _AgencyInfo agency;
  const _AgencyLogoBadge({required this.agency});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            agency.color.withValues(alpha: 0.18),
            agency.color.withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(color: agency.color.withValues(alpha: 0.24)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          'https://logo.clearbit.com/${agency.logoDomain}',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: agency.color.withValues(alpha: 0.08),
            child: Center(
              child: Icon(agency.icon, color: agency.color, size: 24),
            ),
          ),
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return child;
            }
            return Container(
              color: agency.color.withValues(alpha: 0.08),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.3,
                    color: agency.color,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});
  @override
  Widget build(BuildContext context) {
    const items = [
      (
        'Request Medical Certificate',
        'Book and track barangay med-cert requests',
        Icons.description,
        Color(0xFFDCE5FF),
      ),
      (
        'Diagnostics Referral',
        'Laboratory, x-ray, and checkup scheduling support',
        Icons.monitor_heart,
        Color(0xFFE2F3E9),
      ),
      (
        'Community Pharmacy',
        'Medicine availability and subsidy assistance',
        Icons.medication,
        Color(0xFFFFE8DE),
      ),
      (
        'Health Consultation',
        'Consult with barangay nurse and health workers',
        Icons.local_hospital,
        Color(0xFFFFECEA),
      ),
    ];
    const hotlines = [
      ('Barangay Health Station', '(047) 251-2041'),
      ('City Health Office', '(047) 222-1144'),
      ('DOH Hotline', '1555'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health'),
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
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD84949), Color(0xFFEE7272)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x27BE3A3A),
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
                          'eBarangayMo Health Services',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Access consultations, certificates, and medicine support in one place.',
                          style: TextStyle(
                            color: Color(0xFFFFDFDF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Color(0x34FFFFFF),
                    child: Icon(Icons.health_and_safety, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for health services...',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _HealthKpi(
                  icon: Icons.people_alt,
                  label: 'Patients Today',
                  value: '38',
                ),
                const SizedBox(width: 8),
                _HealthKpi(
                  icon: Icons.medication,
                  label: 'Medicines In Stock',
                  value: '124',
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...items.map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: const Color(0xFFE6E8F4)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11000000),
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
                      borderRadius: BorderRadius.circular(12),
                      color: e.$4,
                    ),
                    child: Icon(e.$3, color: const Color(0xFF4A4F6A)),
                  ),
                  title: Text(
                    e.$1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2F3248),
                    ),
                  ),
                  subtitle: Text(
                    e.$2,
                    style: const TextStyle(
                      color: Color(0xFF686C86),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showFeature(context, 'Opening ${e.$1}'),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE7E7F2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.local_phone, color: Color(0xFF7B4A3F)),
                      SizedBox(width: 7),
                      Text(
                        'Health Hotlines',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2F3248),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...hotlines.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Color(0xFF3FA96D),
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              '${e.$1}  ${e.$2}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF5D627C),
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
          ],
        ),
      ),
    );
  }
}

class _HealthKpi extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _HealthKpi({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                color: const Color(0xFFE9EDFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF4B57BA), size: 18),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xFF2F3248),
                    ),
                  ),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF6D738C),
                      fontWeight: FontWeight.w600,
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
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community Posts'),
          backgroundColor: const Color(0xFFD70000),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Latest'),
              Tab(text: 'All'),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'What\'s happening in your community?',
                suffixIcon: Icon(Icons.post_add),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: const Text('Manuel Dalanan'),
                      subtitle: const Text('13 minutes ago'),
                      trailing: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () => _showFeature(context, 'Post options'),
                      ),
                    ),
                    const Text('test 1 test test test test test'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CommunityPostDetailPage(),
                          ),
                        ),
                        child: const Text('See more'),
                      ),
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Like'), Text('Comments'), Text('Share')],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Write a comment...',
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              _showFeature(context, 'Comment posted'),
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xFF2E35D3),
                          ),
                        ),
                      ],
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

class CommunityPostDetailPage extends StatelessWidget {
  const CommunityPostDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const ListTile(
            leading: CircleAvatar(),
            title: Text('West Tapinac'),
            subtitle: Text('31 seconds ago'),
          ),
          const Text('Hello Brgy West Tapinac!'),
          const SizedBox(height: 10),
          Container(height: 220, color: Colors.grey.shade300),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('0 likes'), Text('0 comments')],
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Like'), Text('Add a comment')],
          ),
        ],
      ),
    );
  }
}

Widget _sectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      text,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
    ),
  );
}

Widget _goTile(BuildContext context, String label, Widget page) {
  return Card(
    child: ListTile(
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    ),
  );
}

void _showFeature(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class _StepTabs extends StatelessWidget {
  final String active;
  const _StepTabs({required this.active});

  @override
  Widget build(BuildContext context) {
    String mark(String label) => label == active ? '___' : '__';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Address ${mark('Address')}'),
        Text('Details ${mark('Details')}'),
        Text('Photo ${mark('Photo')}'),
      ],
    );
  }
}
