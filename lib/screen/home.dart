import 'package:flutter/material.dart';
import 'package:uts_mobile_prog/views/pages/history.dart';
import 'package:uts_mobile_prog/views/pages/home.dart';
import 'package:uts_mobile_prog/views/pages/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.index});

  final int? index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _screens = const [
    HomePage(),
    HistoryPage(),
    Center(child: Text("Halaman Inbox")),
    ProfilePage()
    
  ];

  late int _currentScreenIndex;

  @override
  void initState() {
    super.initState();
    _currentScreenIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavigationItem(Icons.home, 'Home', 0),
            buildNavigationItem(Icons.history, 'History', 1),
            const SizedBox(width: 50), // Spacer for the FAB
            buildNavigationItem(Icons.mail, 'Inbox', 2),
            buildNavigationItem(Icons.account_circle, 'Account', 3),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, String label, int index) {
    final color = _currentScreenIndex == index ? Colors.red : Colors.grey;

    return InkWell(
      onTap: () {
        setState(() {
          _currentScreenIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
