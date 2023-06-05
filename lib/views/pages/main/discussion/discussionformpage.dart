part of '../../pages.dart';

class DiscussionFormPage extends StatefulWidget {
  const DiscussionFormPage({super.key});

  @override
  State<DiscussionFormPage> createState() => _DiscussionFormPageState();
}

class _DiscussionFormPageState extends State<DiscussionFormPage> {
  final _discussionKey = GlobalKey<FormState>();
  final ctrlTitle = TextEditingController();
  final ctrlDesc = TextEditingController();
  final ctrlLink = TextEditingController();
  final ctrlDate = TextEditingController();
  bool isHidden = true;

  @override
  void dispose() {
    ctrlTitle.dispose();
    ctrlDesc.dispose();
    ctrlLink.dispose();
    ctrlDate.dispose();
    super.dispose();
  }

  late Discussion discussion;
  void create(
      String? id, String title, String desc, String link, String date) async {
    await DiscussionController.create(id!, title, desc, link, date)
        .then((value) {
      setState(() {
        discussion = value;
      });
    });
    if (!mounted) return;
    if (discussion.id != "0") {
      ToastUi.toastOk('Discussion created successfully!');
      Navigator.pop(context);
    } else {
      ToastUi.toastErr(discussion.title!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Post Discussion'),
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
                    "Please add a new anonymous discussion",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  //Code for Form (Title)
                  const SizedBox(height: 16),
                  Form(
                    key: _discussionKey,
                    child: Column(children: [
                      const SizedBox(height: 16),
                      TextFormField(
                        cursorColor: const Color(0xFFB87333),
                        decoration: const InputDecoration(
                          labelText: "Discussion Title",
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

                      //Code for Form (Description)
                      const SizedBox(height: 16),
                      TextFormField(
                        maxLines: 6,
                        cursorColor: const Color(0xFFB87333),
                        decoration: const InputDecoration(
                          labelText: "Discussion Description",
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
                        controller: ctrlDesc,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value.toString().length < 3
                              ? 'Description must be at least 3 characters!'
                              : null;
                        },
                      ),

                      //Code for Form (Zoom Link)
                      const SizedBox(height: 16),
                      TextFormField(
                        cursorColor: const Color(0xFFB87333),
                        decoration: const InputDecoration(
                          labelText: "Discussion Zoom Link",
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(Icons.link, color: Color(0xFFB87333)),
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
                        controller: ctrlLink,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value.toString().length < 8
                              ? 'Link must be at least 8 characters!'
                              : null;
                        },
                      ),

                      //Code for Form (Date)
                      const SizedBox(height: 24),
                      TextFormField(
                        onTap: () async {
                          DateTime date = DateTime.now();
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2024),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xFFB87333),
                                    onPrimary: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color(0xFFB87333),
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickedDate != null) {
                            TimeOfDay time = TimeOfDay.now();
                            // ignore: use_build_context_synchronously
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Color(0xFFB87333),
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFFB87333),
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (pickedTime != null) {
                              final DateTime combinedDateTime = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );

                              String formattedDate =
                                  DateFormat('dd/MM/yyyy HH:mm')
                                      .format(combinedDateTime);
                              setState(() {
                                ctrlDate.text = formattedDate;
                              });
                            }
                          } else {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy HH:mm').format(date);
                            setState(() {
                              ctrlDate.text = formattedDate;
                            });
                          }
                        },
                        readOnly: true,
                        cursorColor: const Color(0xFFB87333),
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.watch, color: Color(0xFFB87333)),
                          labelText: "Discussion Date",
                          labelStyle: TextStyle(color: Colors.black),
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
                        controller: ctrlDate,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Date cannot be empty!'
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
                              if (_discussionKey.currentState!.validate()) {
                                create(
                                    state?.id,
                                    ctrlTitle.text,
                                    ctrlDesc.text,
                                    ctrlLink.text,
                                    Helper.toUnixDateTime(ctrlDate.text));
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
