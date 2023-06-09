part of '../pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHidden = true;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    super.dispose();
  }

  late User user;
  void login(String email, String password) async {
    await LoginRegisterController.login(email, password).then((value) {
      setState(() {
        user = value;
      });
    });
    if (!mounted) return;
    if (user.id != "0") {
      BlocProvider.of<UserCubit>(context).login(user);
      SharedPrefs.update(user.id!);
      ToastUi.toastOk('Logged in successfully!');
      LoginRegisterController.navigateToMainMenu(context, user);
    } else {
      ToastUi.toastErr(user.name!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFFB87333),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome back",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(
              "Please login to your account",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            //Code for Form (Email)
            const SizedBox(height: 16),
            Form(
              key: _loginKey,
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
                        if (_loginKey.currentState!.validate()) {
                          login(ctrlEmail.text, ctrlPass.text);
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
                      child: const Text("Login")),
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) => const RegisterPage()),
                              (route) => false);
                        },
                        child: const Text("Register",
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
    );
  }
}
