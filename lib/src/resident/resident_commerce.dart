part of 'package:barangaymo_app/main.dart';

class ResidentJobsPage extends StatefulWidget {
  const ResidentJobsPage({super.key});

  @override
  State<ResidentJobsPage> createState() => _ResidentJobsPageState();
}

class _ResidentJobsPageState extends State<ResidentJobsPage> {
  static const _jobs = [
    _ResidentJobData(
      title: 'Barangay Administrative Aide',
      company: 'Barangay Hall - Personnel Office',
      location: 'Old Cabalan, Olongapo',
      salary: 'PHP 18,000 / month',
      schedule: 'Full-time',
      urgent: true,
    ),
    _ResidentJobData(
      title: 'Community Health Volunteer',
      company: 'Barangay Health Unit',
      location: 'Health Center Annex',
      salary: 'PHP 450 / day allowance',
      schedule: 'Part-time',
    ),
    _ResidentJobData(
      title: 'Digital Records Encoder',
      company: 'Barangay Information Desk',
      location: 'Remote + On-site',
      salary: 'PHP 650 / day',
      schedule: 'Contract',
    ),
  ];

  static const _filters = ['All', 'Full-time', 'Part-time', 'Contract'];

  final _searchController = TextEditingController();
  String _selectedFilter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_ResidentJobData> _filteredJobs() {
    final q = _searchController.text.trim().toLowerCase();
    return _jobs.where((job) {
      final byFilter =
          _selectedFilter == 'All' ||
          job.schedule.toLowerCase() == _selectedFilter.toLowerCase();
      final haystack =
          '${job.title} ${job.company} ${job.location} ${job.schedule}'
              .toLowerCase();
      final byQuery = q.isEmpty || haystack.contains(q);
      return byFilter && byQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final clampedMedia = media.copyWith(
      textScaler: const TextScaler.linear(1.0),
    );
    final jobs = _filteredJobs();

    final content = MediaQuery(
      data: clampedMedia,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF6F8FF), Color(0xFFF9F0F0)],
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
                    colors: [Color(0xFF3E4CC7), Color(0xFF6776E7)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x262E35D3),
                      blurRadius: 16,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job Opportunities',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Trusted local roles. Fast applications. Real-time status updates.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFDDE1FF),
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                      child: const Icon(
                        Icons.work_history,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFE5E6F2)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: const Icon(Icons.search),
                    hintText: 'Search by title, company, or skill',
                    suffixIcon: _searchController.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                            icon: const Icon(Icons.close),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _filters.map((f) {
                  final selected = _selectedFilter == f;
                  return ChoiceChip(
                    label: Text(f),
                    selected: selected,
                    onSelected: (_) => setState(() => _selectedFilter = f),
                    selectedColor: const Color(0xFFE2E6FF),
                    side: BorderSide(
                      color: selected
                          ? const Color(0xFF4A57BF)
                          : const Color(0xFFD1D3E4),
                    ),
                    labelStyle: TextStyle(
                      color: selected
                          ? const Color(0xFF2E35D3)
                          : const Color(0xFF5A5E74),
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              if (jobs.isEmpty)
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE5E7F3)),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.search_off_rounded,
                        size: 36,
                        color: Color(0xFF7A7F9A),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'No jobs match your search.',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3B3F57),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Try another keyword or change the filter.',
                        style: TextStyle(color: Color(0xFF666B86)),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _selectedFilter = 'All');
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                )
              else
                ...jobs.map((job) => _jobCard(context, job)),
            ],
          ),
        ),
      ),
    );

    if (Scaffold.maybeOf(context) == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Jobs')),
        body: content,
      );
    }

    return content;
  }

  Widget _jobCard(BuildContext context, _ResidentJobData job) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6E7F1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 13, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2E3044),
                    ),
                  ),
                ),
                if (job.urgent)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFFFE6E0),
                    ),
                    child: const Text(
                      'URGENT',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFB5442E),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              job.company,
              style: const TextStyle(
                color: Color(0xFF6A6E87),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: Color(0xFF6B6E84),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    job.location,
                    style: const TextStyle(color: Color(0xFF61657D)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.schedule, size: 16, color: Color(0xFF6B6E84)),
                const SizedBox(width: 4),
                Text(
                  job.schedule,
                  style: const TextStyle(
                    color: Color(0xFF555973),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  job.salary,
                  style: const TextStyle(
                    color: Color(0xFF3340B6),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _showFeature(
                      context,
                      'Saved "${job.title}" for later.',
                    ),
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: () => _showFeature(
                      context,
                      'Application sent for "${job.title}".',
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3946BD),
                    ),
                    child: const Text('Apply'),
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

class ResidentMarketPage extends StatelessWidget {
  const ResidentMarketPage({super.key});

  static const _products = [
    _ResidentProductData(
      title: 'Lenovo Laptop',
      seller: 'L. Nadong Electronics',
      price: 'PHP 15,000.00',
      icon: Icons.laptop_mac,
      verified: true,
    ),
    _ResidentProductData(
      title: 'Epson EcoTank Printer',
      seller: 'Cabalan Office Depot',
      price: 'PHP 8,250.00',
      icon: Icons.print,
      verified: true,
    ),
    _ResidentProductData(
      title: 'Foldable Study Table',
      seller: 'R. Dela Cruz Furnitures',
      price: 'PHP 2,499.00',
      icon: Icons.table_restaurant,
    ),
    _ResidentProductData(
      title: 'Emergency Go Bag',
      seller: 'Barangay Safety Co-op',
      price: 'PHP 1,250.00',
      icon: Icons.backpack,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF6F8FF), Color(0xFFF8F0ED)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marketplace',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E3044),
                      ),
                    ),
                    Text(
                      'Trusted local products and services',
                      style: TextStyle(
                        color: Color(0xFF666B86),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              _topIconButton(
                icon: Icons.notifications_none,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResidentNotificationsPage(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _topIconButton(
                icon: Icons.shopping_cart,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ResidentCartPage()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFFE7E8F3)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 9,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Search products, sellers, or categories',
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3543B6), Color(0xFF6775E6)],
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seller Boost Week',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Launch your products and get featured placement today.',
                        style: TextStyle(color: Color(0xFFDDE0FF)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentSellHubPage(),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3540B0),
                  ),
                  child: const Text('Start Selling'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text('All Categories')),
              Chip(label: Text('Electronics')),
              Chip(label: Text('Furniture')),
              Chip(label: Text('Emergency')),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
            ),
            itemBuilder: (_, i) => _marketTile(context, _products[i]),
          ),
        ],
      ),
    );
  }

  Widget _topIconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE7E8F3)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF4E5477)),
      ),
    );
  }

  Widget _marketTile(BuildContext context, _ResidentProductData item) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ResidentProductPreviewPage()),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE6E7F1)),
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
            Container(
              height: 108,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE8EAFF), Color(0xFFF3F4FF)],
                ),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  size: 48,
                  color: const Color(0xFF4650B4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2F3146),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.seller,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF676B84),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (item.verified)
                        const Icon(
                          Icons.verified,
                          size: 14,
                          color: Color(0xFF3C78E3),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.price,
                    style: const TextStyle(
                      color: Color(0xFF3340B6),
                      fontWeight: FontWeight.w800,
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

class ResidentProductPreviewPage extends StatelessWidget {
  const ResidentProductPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Preview')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(height: 220, color: Colors.grey.shade300),
          const SizedBox(height: 8),
          const Text(
            'PHP 15,000.00',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2E35D3),
            ),
          ),
          const Text('LAPTOP'),
          const SizedBox(height: 8),
          const Text('Description: LAPTOP LENOVO HP...'),
          const SizedBox(height: 8),
          const Text('Seller: Lester Nadong'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentChatSellerPage(),
                    ),
                  ),
                  child: const Text('Chat Seller'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResidentAddToCartDonePage(),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF2E35D3),
                  ),
                  child: const Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResidentChatSellerPage extends StatelessWidget {
  const ResidentChatSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Seller')),
      body: Column(
        children: const [
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(hintText: 'Type a message...'),
            ),
          ),
        ],
      ),
    );
  }
}

class ResidentAddToCartDonePage extends StatelessWidget {
  const ResidentAddToCartDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            const Icon(Icons.check_circle, color: Color(0xFF2E35D3), size: 86),
            const SizedBox(height: 10),
            const Text(
              'Success!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const Text('Your order has been added to cart.'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ResidentCartPage()),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('Go to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentSellHubPage extends StatefulWidget {
  final int initialTab;
  const ResidentSellHubPage({super.key, this.initialTab = 0});

  @override
  State<ResidentSellHubPage> createState() => _ResidentSellHubPageState();
}

class _ResidentSellHubPageState extends State<ResidentSellHubPage> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    selected = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = const ['Commercial', 'Government'];
    return Scaffold(
      appBar: AppBar(title: const Text('Sell Your Products')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SegmentedButton<int>(
            segments: List.generate(
              tabs.length,
              (i) => ButtonSegment<int>(value: i, label: Text(tabs[i])),
            ),
            selected: {selected},
            onSelectionChanged: (v) => setState(() => selected = v.first),
          ),
          const SizedBox(height: 12),
          if (selected == 0) const ResidentCommercialPage(),
          if (selected == 1) const ResidentGovSellPage(),
        ],
      ),
    );
  }
}

class ResidentCommercialPage extends StatelessWidget {
  const ResidentCommercialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Shamira Balandra'),
            subtitle: Text('Commercial Seller'),
          ),
        ),
        Card(
          color: const Color(0xFFF2F1FF),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                const Icon(
                  Icons.verified_user,
                  color: Color(0xFF2E35D3),
                  size: 64,
                ),
                const SizedBox(height: 8),
                const Text(
                  'RBI Verification Required',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'To sell commercially, complete and wait for your RBI verification to be approved by an admin.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResidentVerifyProfilePage(),
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF2E35D3),
                    ),
                    child: const Text('GET VERIFIED NOW'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text('My Products'),
          trailing: TextButton(
            onPressed: () => _showFeature(context, 'No products yet'),
            child: const Text('View All'),
          ),
        ),
        const Card(
          child: SizedBox(
            height: 120,
            child: Center(child: Text('No Products Yet')),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResidentCommercialAddProductPage(),
              ),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF2E35D3),
            ),
            child: const Text('Add New Product'),
          ),
        ),
      ],
    );
  }
}

class ResidentCommercialAddProductPage extends StatefulWidget {
  const ResidentCommercialAddProductPage({super.key});

  @override
  State<ResidentCommercialAddProductPage> createState() =>
      _ResidentCommercialAddProductPageState();
}

class _ResidentCommercialAddProductPageState
    extends State<ResidentCommercialAddProductPage> {
  int step = 0;
  final steps = const [
    'Basic Details',
    'Price and Quantity',
    'Shipping',
    'Optional',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Product')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          LinearProgressIndicator(
            value: (step + 1) / steps.length,
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          Text(
            steps[step],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ..._fieldsForStep(step),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: FilledButton(
          onPressed: () {
            if (step < steps.length - 1) {
              setState(() => step++);
              return;
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ResidentCommercialSavedPage(),
              ),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF2E35D3),
          ),
          child: Text(step == steps.length - 1 ? 'Finish' : 'Save and Next'),
        ),
      ),
    );
  }

  List<Widget> _fieldsForStep(int step) {
    if (step == 0) {
      return const [
        TextField(decoration: InputDecoration(labelText: 'Product image')),
        SizedBox(height: 8),
        TextField(decoration: InputDecoration(labelText: 'Product name')),
        SizedBox(height: 8),
        TextField(decoration: InputDecoration(labelText: 'Product category')),
        SizedBox(height: 8),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(labelText: 'Product description'),
        ),
      ];
    }
    if (step == 1) {
      return const [
        TextField(decoration: InputDecoration(labelText: 'Selling price')),
        SizedBox(height: 8),
        TextField(decoration: InputDecoration(labelText: 'Original price')),
        SizedBox(height: 8),
        TextField(decoration: InputDecoration(labelText: 'Product stock')),
      ];
    }
    if (step == 2) {
      return const [
        TextField(decoration: InputDecoration(labelText: 'Coverage')),
        SizedBox(height: 8),
        TextField(decoration: InputDecoration(labelText: 'Delivery option')),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(labelText: 'Delivery details and fees'),
        ),
      ];
    }
    return const [
      TextField(decoration: InputDecoration(labelText: 'Product sizes')),
      SizedBox(height: 8),
      TextField(decoration: InputDecoration(labelText: 'Weight')),
      SizedBox(height: 8),
      TextField(decoration: InputDecoration(labelText: 'Dimensions')),
    ];
  }
}

class ResidentCommercialSavedPage extends StatelessWidget {
  const ResidentCommercialSavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            const Icon(Icons.check_circle, color: Color(0xFF2E35D3), size: 86),
            const SizedBox(height: 10),
            const Text(
              'Success',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const Text('Your product has been saved to your inventory.'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('View My Inventory'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentGovSellPage extends StatelessWidget {
  const ResidentGovSellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.info_outline, color: Color(0xFF2E35D3)),
            title: const Text('Eligibility Requirements'),
            subtitle: const Text(
              'Submit required documents first before selling to government.',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResidentSellGovInfoPage(),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Business Registration'),
            subtitle: const Text('My Submissions and GovProcure form'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResidentGovRegistrationPage(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ResidentGovRegistrationPage extends StatelessWidget {
  const ResidentGovRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Submissions')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Expanded(child: Center(child: Text('No Applications yet'))),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResidentGovFormPage(),
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2E35D3),
                ),
                child: const Text('Submit application'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResidentGovFormPage extends StatelessWidget {
  const ResidentGovFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GovProcure - Registration')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          TextField(decoration: InputDecoration(labelText: 'Company Name')),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Email Address')),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Contact Number')),
          SizedBox(height: 8),
          TextField(decoration: InputDecoration(labelText: 'Business Address')),
          SizedBox(height: 12),
          Text('Eligibility Requirements'),
          SizedBox(height: 8),
          Text('1. SEC / DTI'),
          Text('2. Mayor\'s Permit'),
          Text('3. Tax Clearance BIR'),
          Text('4. PhilGEPS'),
          Text('5. Omnibus Sworn Statement'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: FilledButton(
          onPressed: () => Navigator.pop(context),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF2E35D3),
          ),
          child: const Text('Submit Registration'),
        ),
      ),
    );
  }
}

class ResidentSellGovInfoPage extends StatelessWidget {
  const ResidentSellGovInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell to Gov Information'),
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
                  colors: [Color(0xFF3343B2), Color(0xFF6574E2)],
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
                          'Sell your products to the government',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'BarangayMo helps local entrepreneurs enter government procurement opportunities.',
                          style: TextStyle(color: Color(0xFFDCE1FF)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0x33FFFFFF),
                    child: Icon(Icons.account_balance, color: Colors.white),
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
                border: Border.all(color: const Color(0xFFE5E8F5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.folder_copy, color: Color(0xFF3E4CC4)),
                      SizedBox(width: 8),
                      Text(
                        'Required Documents',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2D3044),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _GovBullet(text: 'PhilGEPS Registration'),
                  _GovBullet(text: 'Valid Business Permit'),
                  _GovBullet(text: 'NFCC / Financial Capacity'),
                  _GovBullet(text: 'Latest Tax Clearance'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE5E8F5)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.alt_route, color: Color(0xFF3E4CC4)),
                      SizedBox(width: 8),
                      Text(
                        'Application Process',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2D3044),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _GovStep(
                    number: 1,
                    title: 'Registration',
                    subtitle: 'Create and verify your seller account.',
                  ),
                  _GovStep(
                    number: 2,
                    title: 'Submission',
                    subtitle: 'Submit required documents and product details.',
                  ),
                  _GovStep(
                    number: 3,
                    title: 'Verification',
                    subtitle: 'Compliance and eligibility checks by LGU.',
                  ),
                  _GovStep(
                    number: 4,
                    title: 'Approval',
                    subtitle: 'Receive notice and start bid participation.',
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

class _GovBullet extends StatelessWidget {
  final String text;
  const _GovBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF3FA96D), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF3A3D54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GovStep extends StatelessWidget {
  final int number;
  final String title;
  final String subtitle;
  const _GovStep({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: const Color(0xFFE4E8FF),
            child: Text(
              '$number',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF3946B3),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2E3146),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF646A86),
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
