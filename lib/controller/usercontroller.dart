part of 'controller.dart';

class UserController {
  static Future<dynamic> getUser() async {
    List<User> userList = [];
    await StellacrabService.getUser().then((value) {
      userList = value;
    });
    return userList;
  }
}