part 'controller.dart';

class MaterialsController {

  // API Get
  static Future<dynamic> get() async {
    List<Materials> materialsList = [];
    await StellacrabService.getMaterials().then((value) {
      materialsList = value;
    });
    return materialsList;
  }
}
