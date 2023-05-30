part of 'services.dart';

class StellacrabService {
  static Future<http.Response> register(
      String name,
      String email,
      String password,
      String gender,
      String city,
      String birthdate,
      String phone,
      String role) async {
    var response = await http.post(Uri.https(Const.stellacrabUrl, "index.php/api/user"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'name': name,
          'email': email,
          'password': password,
          'gender': gender,
          'city': city,
          'birthdate': birthdate,
          'phone': phone,
          'role': role,
        });

    return response;
  }

  static Future<http.Response> getUserById(String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/user", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    var response = await http.post(
        Uri.https(Const.stellacrabUrl, "index.php/api/user/login"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'password': password,
        });

    return response;
  }

  static Future<List<User>> getUser() async {

    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/user"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<User> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['user'] != null) {
        result = (job['user'] as List)
            .map((e) => User.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }
}
