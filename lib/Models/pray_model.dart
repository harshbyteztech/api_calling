// To parse this JSON data, do
//
//     final prayModel = prayModelFromJson(jsonString);

import 'dart:convert';

List<PrayModel> prayModelFromJson(String str) => List<PrayModel>.from(json.decode(str).map((x) => PrayModel.fromJson(x)));

String prayModelToJson(List<PrayModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrayModel {
  PrayModel({
    this.ayatNoArabic,
    this.arabicAyat,
    this.translation,
    this.tafsirMukhtasar,
    this.mukhtasarFawaid,
    this.tafsir,
  });

  String? ayatNoArabic;
  String? arabicAyat;
  String? translation;
  String? tafsirMukhtasar;
  String? mukhtasarFawaid;
  String? tafsir;

  factory PrayModel.fromJson(Map<String, dynamic> json) => PrayModel(
    ayatNoArabic: json["ayat_no_arabic"],
    arabicAyat: json["arabic_ayat"],
    translation: json["translation"],
    tafsirMukhtasar: json["tafsir_mukhtasar"],
    mukhtasarFawaid: json["mukhtasar_fawaid"],
    tafsir: json["tafsir"],
  );

  Map<String, dynamic> toJson() => {
    "ayat_no_arabic": ayatNoArabic,
    "arabic_ayat": arabicAyat,
    "translation": translation,
    "tafsir_mukhtasar": tafsirMukhtasar,
    "mukhtasar_fawaid": mukhtasarFawaid,
    "tafsir": tafsir,
  };
}
