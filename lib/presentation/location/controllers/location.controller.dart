import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pt_seru/infrastructure/sources/constants/constants.dart';
import 'package:test_pt_seru/presentation/components/services/services.components.dart';

class LocationController extends GetxController with WidgetsBindingObserver {
  final AppService app = Get.find();

  var provinceData = <List<String>>[];
  var regencyData = <List<String>>[];
  var districtData = <List<String>>[];
  var subDistrictData = <List<String>>[];

  var errors = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    _onScreenReady();
    super.onReady();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void onBackTapped() {
    Get.back();
  }

  Future<void> _onScreenReady() async {
    if (app.region[0].value != "") {
      await _getProvincesData();
    }
    if (app.region[1].value != "") {
      await _getRegenciesData();
    }
    if (app.region[2].value != "") {
      await _getDistrictsData();
    }
  }

  Future<List<List<String>>> _getProvincesData() async {
    var result = await app.fetchData(APIs().regionalProvinces);
    for (var res in result) {
      provinceData.add(res);
    }
    return provinceData;
  }

  Future<List<List<String>>> _getRegenciesData() async {
    var provinceId = await _getRegionIdData(
      provinceData,
      matcher: app.region[0].value,
    );
    var result = await app.fetchData(APIs().regionalRegencies(provinceId));
    for (var res in result) {
      regencyData.add(res);
    }
    return regencyData;
  }

  Future<List<List<String>>> _getDistrictsData() async {
    var regenciesId = await _getRegionIdData(
      regencyData,
      matcher: app.region[1].value,
    );
    var result = await app.fetchData(APIs().regionalDistricts(regenciesId));
    for (var res in result) {
      districtData.add(res);
    }
    return districtData;
  }

  Future<List<List<String>>> _getSubDistrictsData() async {
    var districtId = await _getRegionIdData(
      districtData,
      matcher: app.region[2].value,
    );
    var result = await app.fetchData(
      APIs().regionalSubDistricts(districtId),
    );
    for (var res in result) {
      subDistrictData.add(res);
    }
    return subDistrictData;
  }

  Future<String> _getRegionIdData(
    List<List<String>> data, {
    required String matcher,
  }) async {
    var index = data[1].indexWhere((name) => name == matcher);
    if (index == -1) return "";

    return data[0][index];
  }

  Future<List<String>> getRegionNameData(int i) async {
    if (app.region[0].value == "") {
      provinceData.clear();
    }
    if (app.region[1].value == "") {
      regencyData.clear();
    }
    if (app.region[2].value == "") {
      districtData.clear();
    }
    if (app.region[3].value == "") {
      subDistrictData.clear();
    }
    switch (i) {
      case 0:
        await _getProvincesData();
        return provinceData[1];
      case 1:
        await _getRegenciesData();
        return regencyData[1];
      case 2:
        await _getDistrictsData();
        return districtData[1];
      case 3:
        await _getSubDistrictsData();

        return subDistrictData[1];
      default:
        return [];
    }
  }

  void onDropdownChanged(int i, String str) {
    switch (i) {
      case 0:
        if (app.region[i].value != str) {
          app.region = ["".obs, "".obs, "".obs, "".obs];
        }
        break;
      case 1:
        if (app.region[i].value != str) {
          app.region = [app.region[0], "".obs, "".obs, "".obs];
        }
        break;
      case 2:
        if (app.region[i].value != str) {
          app.region = [app.region[0], app.region[1], "".obs, "".obs];
        }
        break;
      case 3:
        if (app.region[i].value != str) {
          app.region = [app.region[0], app.region[1], app.region[2], "".obs];
        }
        break;
      default:
    }
    update();
    app.region[i].value = str;
    if (app.region[i].value != "") errors[i].value = false;
  }

  void onDropdownCleared(int i) {
    switch (i) {
      case 0:
        app.region = ["".obs, "".obs, "".obs, "".obs];
        break;
      case 1:
        app.region = [app.region[0], "".obs, "".obs, "".obs];

        break;
      case 2:
        app.region = [app.region[0], app.region[1], "".obs, "".obs];

        break;
      case 3:
        app.region = [app.region[0], app.region[1], app.region[2], "".obs];
      default:
    }
    update();
  }

  void onNextTapped() async {
    var empty = app.region.any((data) => data.value == "");
    if (empty) {
      for (var i = 0; i < app.region.length; i++) {
        if (app.region[i].value == "") {
          errors[i].value = true;
        }
      }
      return;
    }
    await Get.toNamed("/photo");
  }
}
