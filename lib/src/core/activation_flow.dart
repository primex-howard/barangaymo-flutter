part of 'package:barangaymo_app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              child: Image.asset(
                'public/bm-officials.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'BARANGAY',
              style: TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            const Text(
              'Barangay Activation',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ActivationFlow()),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFD70000),
              ),
              child: const Text('START'),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivationFlow extends StatefulWidget {
  const ActivationFlow({super.key});
  @override
  State<ActivationFlow> createState() => _ActivationFlowState();
}

class _ActivationFlowState extends State<ActivationFlow> {
  final steps = const [
    'Welcome',
    'Start Trial',
    'Enter Secretary No.',
    'Get OTP',
    'Verification Code',
    'Set MPIN',
    'Select Barangay',
    'Brgy. Council',
    'Secretary Profile',
    'PB Certification',
    'Barangay Certification',
    'Mabuhay',
    'Initial Setup',
    'Confirm Council',
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Activation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (i + 1) / steps.length,
              minHeight: 8,
              color: const Color(0xFFD70000),
            ),
            const SizedBox(height: 8),
            Text('${i + 1}/${steps.length}'),
            const SizedBox(height: 20),
            Text(
              steps[i],
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Text(
              _desc(steps[i]),
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Expanded(child: _stepBody(steps[i])),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  if (i == steps.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeShell()),
                    );
                  } else {
                    setState(() => i++);
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFD70000),
                ),
                child: Text(i == steps.length - 1 ? 'GO TO HOME PAGE' : 'NEXT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _desc(String t) =>
      {
        'Welcome': 'Welcome to BarangayMo. Ang unang sandigan ng mamamayan.',
        'Get OTP': 'For OTP verification, please use official barangay number.',
        'Verification Code': 'Enter the 6-digit code sent via SMS.',
        'Set MPIN': 'Create and confirm your 4-digit MPIN.',
        'Mabuhay': 'Your barangay is now activated as Smart Barangay.',
      }[t] ??
      'Starter screen for $t.';

  Widget _stepBody(String t) {
    if (t == 'Get OTP' || t == 'Enter Secretary No.') {
      return const Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Mobile Number')),
          SizedBox(height: 8),
          Text('By continuing, you agree to Terms and Privacy Policies.'),
        ],
      );
    }
    if (t == 'Verification Code') {
      return const TextField(
        decoration: InputDecoration(labelText: '6-digit code'),
      );
    }
    if (t == 'Set MPIN') {
      return const Column(
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Type 4-digit MPIN'),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Confirm 4-digit MPIN'),
          ),
        ],
      );
    }
    if (t == 'Select Barangay') {
      return const Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Province')),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'City/Municipality'),
          ),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(labelText: 'Barangay')),
        ],
      );
    }
    if (t == 'Brgy. Council') {
      return ListView(
        children: const [
          ListTile(
            title: Text('ROLANDO ALBA'),
            subtitle: Text('Punong Barangay'),
          ),
          ListTile(
            title: Text('JOSE GALANG'),
            subtitle: Text('Sangguniang Barangay Member'),
          ),
          ListTile(
            title: Text('GERARDO ANDRADE'),
            subtitle: Text('Sangguniang Barangay Member'),
          ),
        ],
      );
    }
    if (t == 'Secretary Profile' || t == 'PB Certification') {
      return const Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'First Name')),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(labelText: 'Middle Name')),
          SizedBox(height: 10),
          TextField(decoration: InputDecoration(labelText: 'Last Name')),
        ],
      );
    }
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        t == 'Mabuhay' ? Icons.celebration : Icons.account_balance,
        size: 80,
      ),
    );
  }
}

class _BarangayMoLogo extends StatelessWidget {
  final double width;
  const _BarangayMoLogo({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFD70000),
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: const Text(
              'm',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 6),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
              children: [
                TextSpan(
                  text: 'BARANGAY',
                  style: TextStyle(color: Color(0xFFD70000)),
                ),
                TextSpan(
                  text: 'mo',
                  style: TextStyle(color: Color(0xFF2E35D3)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
