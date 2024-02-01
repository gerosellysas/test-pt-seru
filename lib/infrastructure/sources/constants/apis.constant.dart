class APIs {
  static const String _baseRegional =
      "https://www.emsifa.com/api-wilayah-indonesia/api";

  String regionalProvinces = "$_baseRegional/provinces.json";
  String regionalRegencies(String provinceId) =>
      "$_baseRegional/regencies/$provinceId.json";
  String regionalDistricts(String regencyId) =>
      "$_baseRegional/districts/$regencyId.json";
  String regionalSubDistricts(String districtId) =>
      "$_baseRegional/villages/$districtId.json";
}
