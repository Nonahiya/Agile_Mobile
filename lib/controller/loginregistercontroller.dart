part of 'controller.dart';

class LoginRegisterController {
  static Future<User> register(
      String name,
      String email,
      String password,
      String gender,
      String city,
      String birthdate,
      String phone,
      String role) async {
    var response = await StellacrabService.register(
        name, email, password, gender, city, birthdate, phone, role);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 201 && job['message'] != null) {
      var userJson = json.encode(job['user']);
      return User.fromJson(userJson);
    } else {
      return User(id: '0', name: job['error']);
    }
  }

  static Future<User> login(String email, String password) async {
    var response = await StellacrabService.login(email, password);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 200 && job['message'] != null) {
      var userJson = json.encode(job['user']);
      return User.fromJson(userJson);
    } else {
      return User(id: '0', name: job['error']);
    }
  }

  static void navigateToMainMenu(BuildContext context, User user) {
    Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(builder: (context) => const MainMenuPage()),
        (route) => false);
  }

  static Future<User> getUserById(String id) async {
    var response = await StellacrabService.getUserById(id);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 200 && job['message'] != null) {
      var userJson = json.encode(job['user']);
      return User.fromJson(userJson);
    } else {
      return User(id: '0', name: job['error']);
    }
  }
}
