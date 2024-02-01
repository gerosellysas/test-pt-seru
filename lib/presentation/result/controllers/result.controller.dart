import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';

class ResultController extends GetxController {
  final AppService app = Get.find<AppService>();

  @override
  void onInit() {
    generateResult();
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  void generateResult() async {
    var data =
        """
  {
    "name": {
      "first_name": "${app.personal[0].value}",
      "last_name": "${app.personal[1].value}"
    },
    "biodata": "${app.personal[2].value}",
    "address": {
      "province": "${app.region[0].value}",
      "regency": "${app.region[1].value}",
      "district": "${app.region[2].value}",
      "subdistrict": "${app.region[3].value}"
    },
    "id_card_image": "${app.cameraBase64[0].value}",
    "selfie_image": "${app.cameraBase64[1].value}",
    "freestyle_image": "${app.cameraBase64[2].value}"
  }
  """;
    app.result = json.decode(data);
  }

  void onEditTapped() async {
    await Get.offAllNamed("/personal");
  }
}
