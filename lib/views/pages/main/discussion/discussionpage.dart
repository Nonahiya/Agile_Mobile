part of '../../pages.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({super.key});

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  List<Discussion> discussionList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(builder: (context, state) {
      void getDiscussion() async {
        await DiscussionController.get().then((value) {
          setState(() {
            discussionList = value;

            discussionList.sort((b, a) => a.date!
                      .toString()
                      .compareTo(b.date!.toString()));
          });
          print(discussionList);
        });
      }

      if (state != null) {
        if (discussionList.isEmpty) {
          getDiscussion();
        }
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text("DISCUSSION"),
          backgroundColor: const Color(0xFFB87333),
        ),
        floatingActionButton: state?.role == "Leader"
            ? FloatingActionButton(
                backgroundColor: const Color(0xFFB87333),
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (context) => const DiscussionFormPage()))
                      .then((value) {
                    getDiscussion();
                  });
                })
            : const SizedBox.shrink(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: discussionList.isEmpty
                ? LoadingUi.loading()
                : ListView.builder(
                    itemCount: discussionList.length,
                    itemBuilder: (context, index) {
                      return LazyLoadingList(
                          initialSizeOfItems: 10,
                          loadMore: () {},
                          index: index,
                          hasMore: true,
                          child: DiscussionCard(discussionList[index]));
                    },
                  )),
      );
    });
  }
}
