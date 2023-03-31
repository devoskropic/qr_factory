import 'package:flutter/material.dart';
import '../../components/components.dart';
import 'common/exports.dart';

class QrHome extends StatefulWidget {
  const QrHome({super.key});

  @override
  State<QrHome> createState() => _QrHomeState();
}

class _QrHomeState extends State<QrHome> {
  final CustomAppBar _cab = CustomAppBar();

  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const QrSimple(),
    const QrImage(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: _cab.titledAppBar(
        context,
        "QR Generator",
        Colors.white,
        Colors.black,
        52.0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      color: Colors.blueGrey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: GNav(
          gap: 4,
          selectedIndex: _selectedIndex,
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          activeColor: Colors.amberAccent,
          // backgroundColor: Colors.white,
          // tabBackgroundColor: Colors.green.shade200,
          onTabChange: _navigateBottomBar,
          tabs: const [
            GButton(icon: LineIcons.home, text: 'Home'),
            GButton(icon: LineIcons.qrcode, text: 'QR Simple'),
            GButton(icon: LineIcons.image, text: 'QR Imagen'),
            GButton(icon: LineIcons.cog, text: 'Opciones'),
          ],
        ),
      ),
    );
  }
}
