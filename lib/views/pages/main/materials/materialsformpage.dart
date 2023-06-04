part of '../../pages.dart';

class MaterialsFormPage extends StatefulWidget {
  const MaterialsFormPage({super.key});

  @override
  State<MaterialsFormPage> createState() => _MaterialsFormPageState();
}

class _MaterialsFormPageState extends State<MaterialsFormPage> {
  final _materialsKey = GlobalKey<FormState>();
  final ctrlTitle = TextEditingController();
  final ctrlContent = TextEditingController();
  bool isHidden = true;

  @override
  void dispose() {
    ctrlTitle.dispose();
    ctrlContent.dispose();
    super.dispose();
  }

  late Materials materials;
  void create(
      String? id, String title, String content) async {
    await MaterialsController.create(id!, title, content)
        .then((value) {
      setState(() {
        materials = value;
      });
    });
    if (!mounted) return;
    if (materials.id != "0") {
      ToastUi.toastOk('Materials created successfully!');
      Navigator.pop(context);
    } else {
      ToastUi.toastErr(materials.title!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Post Materials'),
          backgroundColor: const Color(0xFFB87333),
        ),
        body: BlocBuilder<UserCubit, User?>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Please add a new materials",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  //Code for Form (Title)
                  const SizedBox(height: 16),
                  Form(
                    key: _materialsKey,
                    child: Column(children: [
                      const SizedBox(height: 16),
                      TextFormField(
                        cursorColor: const Color(0xFFB87333),
                        decoration: const InputDecoration(
                          labelText: "Materials Title",
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(Icons.title, color: Color(0xFFB87333)),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        controller: ctrlTitle,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value.toString().length < 3
                              ? 'Title must be at least 3 characters!'
                              : null;
                        },
                      ),

                      //Code for Form (Content)
                      const SizedBox(height: 16),
                      TextFormField(
                        maxLines: 6,
                        cursorColor: const Color(0xFFB87333),
                        decoration: const InputDecoration(
                          labelText: "Materials Description",
                          labelStyle: TextStyle(color: Colors.black),
                          icon:
                              Icon(Icons.description, color: Color(0xFFB87333)),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        controller: ctrlContent,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value.toString().length < 3
                              ? 'Content must be at least 3 characters!'
                              : null;
                        },
                      ),

                      //Code for Validate and Alert Dialog
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFFB87333),
                            ),
                            onPressed: () {
                              if (_materialsKey.currentState!.validate()) {
                                create(
                                    state?.id,
                                    ctrlTitle.text,
                                    ctrlContent.text);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: const Text(
                                        'Please fill all the fields!'),
                                    actions: [
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor:
                                                  const Color(0xFFB87333)),
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          child: const Text('Try Again'))
                                    ],
                                  ),
                                );
                              }
                            },
                            child: const Text("Create")),
                      ),
                    ]),
                  )
                ],
              ),
            );
          },
        ));
  }
}
