part of 'services.dart';

class StellacrabService {

  // User
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

  // Discussion
  static Future<List<Discussion>> getDiscussion() async {

    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/discussion"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Discussion> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['discussion'] != null) {
        result = (job['discussion'] as List)
            .map((e) => Discussion.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }

  static Future<List<Discussion>> getDiscussionById(String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/discussion", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Discussion> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['discussion'] != null) {
        result = (job['discussion'] as List)
            .map((e) => Discussion.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }

  static Future<http.Response> createDiscussion(
      String leaderId,
      String title,
      String description,
      String zoomLink,
      String date) async {
    var response = await http.post(Uri.https(Const.stellacrabUrl, "index.php/api/discussion"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'leader_id': leaderId,
          'title': title,
          'description': description,
          'zoom_link': zoomLink,
          'date': date
        });

    return response;
  }

  static Future<http.Response> editDiscussion(
      String id,
      String title,
      String description,
      String zoomLink,
      String date) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.put(Uri.https(Const.stellacrabUrl, "index.php/api/discussion", queryParams),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'title': title,
          'description': description,
          'zoom_link': zoomLink,
          'date': date
        });

    return response;
  }

  static Future<http.Response> deleteDiscussion(
      String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.delete(Uri.https(Const.stellacrabUrl, "index.php/api/discussion", queryParams),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        }
    );

    return response;
  }

  // Materials
  static Future<List<Materials>> getMaterials() async {
    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/materials"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Materials> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['materials'] != null) {
        result = (job['materials'] as List)
            .map((e) => Materials.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }  

  
  static Future<List<Materials>> getMaterialsById(String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/materials", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Materials> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['materials'] != null) {
        result = (job['materials'] as List)
            .map((e) => Materials.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }  

  static Future<http.Response> createMaterials(
      String userId,
      String title,
      String content) async {
    var response = await http.post(Uri.https(Const.stellacrabUrl, "index.php/api/materials"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'user_id': userId,
          'title': title,
          'content': content
        });

    return response;
  }
  
  static Future<http.Response> editMaterials(
      String id,
      String title,
      String content) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.put(Uri.https(Const.stellacrabUrl, "index.php/api/materials", queryParams),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'title': title,
          'content': content
        });

    return response;
  }

  static Future<http.Response> deleteMaterials(
      String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.delete(Uri.https(Const.stellacrabUrl, "index.php/api/materials", queryParams),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
    );

    return response;
  }

  // Reminder
  static Future<List<Reminder>> getReminder() async {
    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/reminder"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Reminder> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['reminder'] != null) {
        result = (job['reminder'] as List)
            .map((e) => Reminder.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }  
  
  static Future<List<Reminder>> getReminderById(String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.get(
      Uri.https(Const.stellacrabUrl, "index.php/api/reminder", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Reminder> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['reminder'] != null) {
        result = (job['reminder'] as List)
            .map((e) => Reminder.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }  

  static Future<http.Response> createReminder(
      String leaderId,
      String content,
      String date) async {
    var response = await http.post(Uri.https(Const.stellacrabUrl, "index.php/api/reminder"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'leader_id': leaderId,
          'content': content,
          'date': date
        });

    return response;
  }
  
  static Future<http.Response> editReminder(
      String id,
      String content,
      String date) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.put(Uri.https(Const.stellacrabUrl, "index.php/api/reminder", queryParams),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'content': content,
          'date': date
        });

    return response;
  }
    
  static Future<http.Response> deleteReminder(
      String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.delete(Uri.https(Const.stellacrabUrl, "index.php/api/reminder", queryParams),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
    );

    return response;
  }
}
