import 'package:flutter/material.dart';

void main() {
  runApp(const FoolOfStarApp());
}

class FoolOfStarApp extends StatelessWidget {
  const FoolOfStarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fool of Star',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C63FF),
          secondary: Color(0xFF03DAC6),
          surface: Color(0xFF1E1E2C),
          surfaceContainer: Color(0xFF12121E),
        ),
        scaffoldBackgroundColor: const Color(0xFF12121E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E2C),
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppNavigation(),
      },
    );
  }
}

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const DashboardScreen(),
    const TradeScreen(),
    const AiAssistantScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF1E1E2C),
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Trade'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'AI Agent'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Security'),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Overview',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_scanner),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF483D8B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$124,532.00',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(Icons.arrow_upward, 'Send'),
                    _buildActionButton(Icons.arrow_downward, 'Receive'),
                    _buildActionButton(Icons.add, 'Add'),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Assets',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildAssetTile('USD', 'US Dollar', '\$45,200.00', Icons.attach_money, Colors.green),
          _buildAssetTile('FOS', 'Fool of Star', '1,240 FOS', Icons.star, Colors.orange),
          _buildAssetTile('EUR', 'Euro', '€12,500.00', Icons.euro, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildAssetTile(String symbol, String name, String balance, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(name, style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
          Text(balance, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Instant Swap',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E2C),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                _buildSwapField('You pay', 'USD', '1000', Icons.attach_money),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Icon(Icons.swap_vert, color: Color(0xFF6C63FF), size: 32),
                ),
                _buildSwapField('You receive', 'FOS', '845.2', Icons.star),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C63FF),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Review Swap', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  '1% Network delivery cost applies securely in the background.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwapField(String label, String currency, String amount, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Text(currency, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Text(amount, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF03DAC6)),
              SizedBox(width: 8),
              Text(
                'Personal AI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildAiMessage('Hello! I am your secure, on-device financial assistant. Your data never leaves your device. How can I help you today?'),
              _buildUserMessage('Send \$50 to Sarah.'),
              _buildAiMessage('I have prepared a \$50 transfer to Sarah. Please review and authorize the transaction.'),
              _buildActionCard(
                'Transfer to Sarah',
                '\$50.00 USD',
                'Authenticate to confirm'
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ask me to send money or trade...',
                    filled: true,
                    fillColor: const Color(0xFF1E1E2C),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                backgroundColor: const Color(0xFF6C63FF),
                radius: 24,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAiMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E2C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildUserMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFF6C63FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  Widget _buildActionCard(String title, String amount, String subtitle) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF03DAC6)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(amount, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF03DAC6))),
            const SizedBox(height: 8),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF03DAC6),
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text('Authorize (Face ID)'),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Security & Privacy',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildSettingItem(Icons.fingerprint, 'Biometric Access', 'Enabled'),
        _buildSettingItem(Icons.vpn_key, 'Device Hardware Keys (FIDO2)', 'Configured'),
        _buildSettingItem(Icons.shield, 'Zero-Knowledge Encryption', 'Active'),
        _buildSettingItem(Icons.people, 'Social Recovery', '3 Guardians set'),
        _buildSettingItem(Icons.verified_user, 'DigiLocker Integration', 'Connected'),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String status) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF03DAC6)),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(status, style: const TextStyle(color: Colors.green)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
