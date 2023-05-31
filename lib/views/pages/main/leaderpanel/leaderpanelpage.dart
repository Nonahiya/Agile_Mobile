part of '../../pages.dart';

class LeaderPanelPage extends StatefulWidget {
  const LeaderPanelPage({Key? key}) : super(key: key);

  @override
  State<LeaderPanelPage> createState() => _LeaderPanelPageState();
}

class _LeaderPanelPageState extends State<LeaderPanelPage> {
  List<User> userList = [];
  bool isLoading = true;

  void getUser() async {
    await UserController.getUser().then((value) {
      setState(() {
        userList = value;
        isLoading = false;
        print(isLoading);
      });
    });
    print(userList);
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('LEADER PANEL'),
        backgroundColor: const Color(0xFFB87333),
      ),
      body: Stack(
        children: [
          Container(
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    DataTable(
                      columnSpacing: 15,
                      headingRowColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 220, 175, 133)),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Color.fromARGB(255, 255, 245, 235),
                            width: 2,
                          ),
                        ),
                      ),
                      columns: const <DataColumn>[
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                      ],
                      rows: userList.map((user) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(user.id!)),
                            DataCell(Text(user.name!)),
                          ],
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 220, 175, 133)),
                          columnSpacing: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color.fromARGB(255, 255, 245, 235),
                                width: 0.5,
                              ),
                            ),
                          ),
                          columns: const <DataColumn>[
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Gender')),
                            DataColumn(label: Text('City')),
                            DataColumn(label: Text('Birthdate')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Role')),
                            DataColumn(label: Text('Created At')),
                            DataColumn(label: Text('Updated At')),
                          ],
                          rows: userList.map((user) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(Text(user.email!)),
                                DataCell(Text(user.gender!)),
                                DataCell(Text(user.city!)),
                                DataCell(Text(user.birthdate!)),
                                DataCell(Text(user.phone!)),
                                DataCell(Text(user.role!)),
                                DataCell(Text(user.createdAt!)),
                                DataCell(Text(user.updatedAt!)),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          isLoading == true ? LoadingUi.loadingBlock() : Container()
        ],
      ),
    );
  }
}
