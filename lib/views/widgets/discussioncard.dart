part of 'widgets.dart';

class DiscussionCard extends StatefulWidget {
  final Discussion discussion;

  const DiscussionCard(this.discussion, {super.key});

  @override
  _DiscussionCardState createState() => _DiscussionCardState();
}

class _DiscussionCardState extends State<DiscussionCard> {
  User? user;
  void getUser(String id) async {
    await LoginRegisterController.getUserById(id).then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUser(widget.discussion.leaderId!);
  }

  @override
  Widget build(BuildContext context) {
    Discussion dsc = widget.discussion;
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                "${user?.name}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB87333)),
              ),
              const Divider(),
              Text(
                "Topik: ${dsc.title}",
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "Deskripsi: ${dsc.description}",
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "Waktu: ${Helper.fromUnix(dsc.date!)}",
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "Link: ${dsc.zoomLink}",
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
