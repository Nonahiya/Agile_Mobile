part of '../../pages.dart';

class MaterialsPage extends StatefulWidget {
  const MaterialsPage({super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  List<Materials> materialsList = [];

  @override
  Widget build(BuildContext context) {
    void getMaterials() async {
      await MaterialsController.get().then((value) {
        setState(() {
          materialsList = value;

          materialsList.sort((b, a) => a.createdAt!
              .toString()
              .compareTo(b.createdAt!.toString()));
        });
        print(materialsList);
      });
    }

    if (materialsList.isEmpty) {
      getMaterials();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("MATERIALS"),
        backgroundColor: const Color(0xFFB87333),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFB87333),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (context) => const MaterialsFormPage()))
                .then((value) {
              getMaterials();
            });
          }),
      body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: materialsList.isEmpty
              ? LoadingUi.loading()
              : ListView.builder(
            itemCount: materialsList.length,
            itemBuilder: (context, index) {
              return LazyLoadingList(
                  initialSizeOfItems: 10,
                  loadMore: () {},
                  index: index,
                  hasMore: true,
                  child: MaterialsCard(materialsList[index]));
            },
          )),
    );
  }
}
