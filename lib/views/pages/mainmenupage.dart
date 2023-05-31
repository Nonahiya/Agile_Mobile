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
    const HomePage(),
    const DiscussionPage(),
    const MaterialsPage(),
    const LeaderPanelPage(),
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
    return BlocBuilder<UserCubit, User?>(builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFFB87333),
          unselectedItemColor: Colors.grey,
          items: state?.role == "Leader"
              ? const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.podcasts),
                    label: "Discussion",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.article),
                    label: "Materials",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.admin_panel_settings),
                    label: "Leader Panel",
                  ),
                ]
              : const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.podcasts),
                    label: "Discussion",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.article),
                    label: "Materials",
                  ),
                ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );
    });
  }
}
