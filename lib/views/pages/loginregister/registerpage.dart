part of '../pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedGender = 'Male';
  var enumGender = ['Male', 'Female'];

  final _registerKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlName = TextEditingController();
  final ctrlGender = TextEditingController();
  final ctrlCity = TextEditingController();
  final ctrlBirthdate = TextEditingController();
  final ctrlPhone = TextEditingController();
  bool isHidden = true;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    ctrlName.dispose();
    ctrlGender.dispose();
    ctrlCity.dispose();
    ctrlBirthdate.dispose();
    ctrlPhone.dispose();
    super.dispose();
  }

  late User user;
  void register(String name, String email, String password, String gender, String city, String birthdate, String phone) async {
    await LoginRegisterController.register(name, email, password, gender, city, birthdate, phone, "Member").then((value) {
      setState(() {
        user = value;
      });
    });
    if (!mounted) return;
    if (user.id != "0") {
      BlocProvider.of<UserCubit>(context).login(user);
      SharedPrefs.update(user.id!);
      ToastUi.toastOk('Registered successfully!');
      LoginRegisterController.navigateToMainMenu(context, user);
    } else {
      ToastUi.toastErr(user.name!);
      setState(() {
        ctrlEmail.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color(0xFFB87333),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(
                "Please fill your data",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
        
              //Code for Form (Email)
              const SizedBox(height: 16),
              Form(
                key: _registerKey,
                child: Column(children: [
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0xFFB87333),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                      icon: Icon(Icons.email, color: Color(0xFFB87333)),
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
                    controller: ctrlEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return !EmailValidator.validate(value.toString())
                          ? 'Invalid email!'
                          : null;
                    },
                  ),
        
                  //Code for Form (Password)
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0xFFB87333),
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: Icon(
                            isHidden ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      icon: const Icon(Icons.lock, color: Color(0xFFB87333)),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    controller: ctrlPass,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 8
                          ? 'Password must be at least 8 characters!'
                          : null;
                    },
                  ),
        
                  //Code for Form (Name)
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0xFFB87333),
                    decoration: const InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black),
                      icon: Icon(Icons.person, color: Color(0xFFB87333)),
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
                    controller: ctrlName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 2
                          ? 'Name must be at least 2 characters!'
                          : null;
                    },
                  ),
        
                  //Code for Form (Gender)
                  const SizedBox(height: 24),
                  DropdownButtonFormField(
                      focusColor: Colors.transparent,
                      decoration: InputDecoration(
                        icon: selectedGender == "Male"
                            ? const Icon(Icons.man, color: Color(0xFFB87333))
                            : const Icon(Icons.woman, color: Color(0xFFB87333)),
                        labelText: "Gender",
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      value: selectedGender,
                      items: enumGender.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                      }),
        
                  //Code for Form (City)
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0xFFB87333),
                    decoration: const InputDecoration(
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.black),
                      icon: Icon(Icons.location_city, color: Color(0xFFB87333)),
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
                    controller: ctrlCity,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 2
                          ? 'City must be at least 2 characters!'
                          : null;
                    },
                  ),
        
                  //Code for Form (Birthdate)
                  const SizedBox(height: 24),
                  TextFormField(
                    onTap: () async {
                      DateTime date = DateTime.now();
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1924),
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
                        String formattedDate =
                            DateFormat('dd/MM/yyyy').format(pickedDate);
                        setState(() {
                          ctrlBirthdate.text = formattedDate;
                        });
                      } else {
                        String formattedDate =
                            DateFormat('dd/MM/yyyy').format(date);
                        setState(() {
                          ctrlBirthdate.text = formattedDate;
                        });
                      }
                    },
                    readOnly: true,
                    cursorColor: const Color(0xFFB87333),
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_month, color: Color(0xFFB87333)),
                      labelText: "Birthdate",
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
                    controller: ctrlBirthdate,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value!.isEmpty ? 'Birthdate cannot be empty!' : null;
                    },
                  ),
        
                  //Code for Form (Phone)
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0xFFB87333),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      labelStyle: TextStyle(color: Colors.black),
                      icon: Icon(Icons.phone, color: Color(0xFFB87333)),
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
                    controller: ctrlPhone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 10
                          ? 'Phone must be at least 10 characters!'
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
                          if (_registerKey.currentState!.validate()) {
                            register(ctrlName.text, ctrlEmail.text, ctrlPass.text, selectedGender, ctrlCity.text, Helper.toUnix(ctrlBirthdate.text), ctrlPhone.text);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content:
                                    const Text('Please fill all the fields!'),
                                actions: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor:
                                              const Color(0xFFB87333)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Try Again'))
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text("Register")),
                  ),
        
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                                context,
                                MaterialPageRoute<dynamic>(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                color: Color(0xFFB87333),
                              )))
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
