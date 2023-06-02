part of'controller.dart';

class MaterialsController {
  static Future<Materials> create(
      String userId,
      String title,
      String content) async {
    var response = await StellacrabService.createMaterials(
        userId, title, content);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 201 && job['message'] != null) {
      var materialsJson = json.encode(job['materials']);
      return Materials.fromJson(materialsJson);
    } else {
      return Materials(id: '0', title: job['error']);
    }
  }
  // API Get
  static Future<dynamic> get() async {
    List<Materials> materialsList = [];
    await StellacrabService.getMaterials().then((value) {
      materialsList = value;
    });
    return materialsList;
  }
}
