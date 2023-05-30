part of '../../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              // Home Section
              title: const Text('HOME'),
              backgroundColor: const Color(0xFFB87333),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).logout();
                    SharedPrefs.delete();
                    Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  },
                )
              ],
            ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Hello,",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFFB87333))),
                      Text("${state?.name}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                      Container(
                          width: double.infinity,
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.white,
                              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                      child: Text("Email: ${state?.email}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                    ),
                                  ),
                                  ListTile(
                                      title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text("Gender: ${state?.gender}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  )),
                                  ListTile(
                                      title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text("City: ${state?.city}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  )),
                                  ListTile(
                                      title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: Text("Phone: ${state?.phone}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  )),
                                ],
                              ))),
                      const SizedBox(height: 24),
                    ],
                  ),
                )));
      },
    );
  }
}
