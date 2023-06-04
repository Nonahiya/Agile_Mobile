part of 'widgets.dart';

class MaterialsCard extends StatefulWidget {
  final Materials materials;

  const MaterialsCard(this.materials, {super.key});

  @override
  _MaterialsCardState createState() => _MaterialsCardState();
}

class _MaterialsCardState extends State<MaterialsCard> {
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
    getUser(widget.materials.userId!);
  }

  @override
  Widget build(BuildContext context) {
    Materials mtr = widget.materials;
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
              Text(
                "${Helper.fromUnix(mtr.createdAt!)}",
                style: const TextStyle(fontSize: 12),
              ),
              const Divider(),
              Text(
                "${mtr.title}\n",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "${mtr.content}",
                maxLines: 16,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
