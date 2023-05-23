part of 'pages.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    // const HomePage(),
    // const DiscussionPage(),
    // const MaterialPage(),
    // const LeaderPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF52734D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Discussion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: "Material",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Leader",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
