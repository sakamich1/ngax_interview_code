import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngax_interview_code/i18n/locale_keys.dart';
import '../../global/constants.dart';
import '../../r.g.dart';

class HomeController extends GetxController {
  final TextEditingController textFiledController1 = TextEditingController();
  final TextEditingController textFiledController2 = TextEditingController();
  final TextEditingController textFiledController3 = TextEditingController();

  RxMap<String, dynamic> data = RxMap({
    // Map<String, Map<String, String>> '10%20%30%' 可以编辑
    LocaleKeys.title1.tr: '10%/20%/30%',
    LocaleKeys.title2.tr: '10%/20%/30%',
    // Map<String, String> value(如：'18.5年') 可以编辑
    LocaleKeys.title3.tr: '18.5年',
    LocaleKeys.title4.tr: '50.5岁',
    LocaleKeys.title5.tr: '18時間',
    LocaleKeys.title6.tr: '15人',
    // Map<String, List<Map<String, String>>> List<Map<String, String>> 可以编辑，可删除 Map<String, String>，并且可以无限增加 Map<String, String>
    LocaleKeys.title7.tr: RxList([
      {'正社員': '34%'},
      {'専門職': '50%'},
    ]),
    LocaleKeys.title8.tr: RxList([
      {'正社員': '11%'},
      {'専門職': '22%'},
    ]),
  });

  String getDefaultValue(int index) {
    String value = '';
    switch (index) {
      case 0:
        value = data[LocaleKeys.title1.tr] as String;
        break;

      case 1:
        value = data[LocaleKeys.title2.tr] as String;
        break;

      case 2:
        value = data[LocaleKeys.title3.tr] as String;
        break;

      case 3:
        value = data[LocaleKeys.title4.tr] as String;

        break;
      case 4:
        value = data[LocaleKeys.title5.tr] as String;

        break;
      case 5:
        value = data[LocaleKeys.title6.tr] as String;
        break;
    }
    return value;
  }

  Map<String, String> getNestedDefaultValue(int index, int parentIndex) {
    if (parentIndex == 6) {
      return (data[LocaleKeys.title7.tr] as List<Map<String, String>>)[index];
    } else if (parentIndex == 7) {
      return (data[LocaleKeys.title8.tr] as List<Map<String, String>>)[index];
    }

    return {};
  }

  void removeNestedItem(int index, int parentIndex) {
    if (parentIndex == 6) {
      (data[LocaleKeys.title7.tr] as List<Map<String, String>>).removeAt(index);
    } else if (parentIndex == 7) {
      (data[LocaleKeys.title8.tr] as List<Map<String, String>>).removeAt(index);
    }
  }

  void edit(int index, {int nestedIndex = -1}) {
    _showEditDialog(index, nestedIndex: nestedIndex);
  }

  void _showEditDialog(int index, {int nestedIndex = -1}) {
    String title = '';
    String subtitle1 = '';
    String subtitle2 = '';
    String subtitle3 = '';
    String hint1 = '';
    String hint2 = '';
    String hint3 = '';

    switch (index) {
      case 0:
        title = LocaleKeys.title_dialog_1.tr;
        subtitle1 =
            '${LocaleKeys.string_year_1.tr}(${LocaleKeys.string_unit.tr}：%)';
        subtitle2 =
            '${LocaleKeys.string_year_2.tr}(${LocaleKeys.string_unit.tr}：%)';
        subtitle3 =
            '${LocaleKeys.string_year_3.tr}(${LocaleKeys.string_unit.tr}：%)';
        hint1 = '${LocaleKeys.string_year_1.tr}${LocaleKeys.title_dialog_1.tr}';
        hint2 = '${LocaleKeys.string_year_2.tr}${LocaleKeys.title_dialog_1.tr}';
        hint3 = '${LocaleKeys.string_year_3.tr}${LocaleKeys.title_dialog_1.tr}';
        break;

      case 1:
        title = LocaleKeys.title_dialog_2.tr;
        subtitle1 =
            '${LocaleKeys.string_year_1.tr}(${LocaleKeys.string_unit.tr}：%)';
        subtitle2 =
            '${LocaleKeys.string_year_2.tr}(${LocaleKeys.string_unit.tr}：%)';
        subtitle3 =
            '${LocaleKeys.string_year_3.tr}(${LocaleKeys.string_unit.tr}：%)';
        hint1 = '${LocaleKeys.string_year_1.tr}${LocaleKeys.title_dialog_1.tr}';
        hint2 = '${LocaleKeys.string_year_2.tr}${LocaleKeys.title_dialog_1.tr}';
        hint3 = '${LocaleKeys.string_year_3.tr}${LocaleKeys.title_dialog_1.tr}';
        break;

      case 2:
        subtitle1 =
            '${LocaleKeys.title3.tr}(${LocaleKeys.string_unit.tr}：${LocaleKeys.unit_year.tr})';
        break;
      case 3:
        subtitle1 =
            '${LocaleKeys.title4.tr}(${LocaleKeys.string_unit.tr}：${LocaleKeys.unit_yo.tr})';
        break;
      case 4:
        subtitle1 =
            '${LocaleKeys.title5.tr}(${LocaleKeys.string_unit.tr}：${LocaleKeys.unit_hrs.tr})';
        break;
      case 5:
        subtitle1 = '${LocaleKeys.title6.tr}(${LocaleKeys.string_unit.tr}：人)';
        break;
      case 6:
        title = LocaleKeys.title_dialog_3.tr;
        subtitle1 = LocaleKeys.string_career.tr;
        subtitle2 = LocaleKeys.string_percent.tr;
        hint1 = LocaleKeys.input_hint_1.tr;
        hint2 = LocaleKeys.input_hint_2.tr;
        break;
      case 7:
        title = LocaleKeys.title_dialog_4.tr;
        subtitle1 = LocaleKeys.string_career.tr;
        subtitle2 = LocaleKeys.string_percent.tr;
        hint1 = LocaleKeys.input_hint_1.tr;
        hint2 = LocaleKeys.input_hint_1.tr;
        break;
    }

    Get.dialog(Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.fromLTRB(37, 0, 37, 0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          )
                        : Container(),
                    subtitle1.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(26, 24, 26, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subtitle1,
                                  style: _buildSubtitleStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(Iro.gray2)),
                                  child: TextField(
                                    autofocus: true,
                                    controller: textFiledController1,
                                    decoration: _buildInputDecoration(hint1),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    subtitle2.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(26, 8, 26, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subtitle2,
                                  style: _buildSubtitleStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(Iro.gray2)),
                                  child: TextField(
                                    controller: textFiledController2,
                                    decoration: _buildInputDecoration(hint2),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    subtitle3.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(26, 8, 26, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subtitle3,
                                  style: _buildSubtitleStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(Iro.gray2)),
                                  child: TextField(
                                    controller: textFiledController3,
                                    decoration: _buildInputDecoration(hint3),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 10, 26, 26),
                      child: GestureDetector(
                        onTap: () {
                          String result = '';
                          switch (index) {
                            case 0:
                              result =
                                  '${textFiledController1.text.trim()}%${textFiledController2.text.trim()}%${textFiledController3.text.trim()}%';
                              data[LocaleKeys.title1.tr] = result;
                              break;
                            case 1:
                              result =
                                  '${textFiledController1.text.trim()}%${textFiledController2.text.trim()}%${textFiledController3.text.trim()}%';
                              data[LocaleKeys.title2.tr] = result;
                              break;
                            case 2:
                              result =
                                  '${textFiledController1.text.trim()}${LocaleKeys.unit_year.tr}';
                              data[LocaleKeys.title3.tr] = result;
                              break;
                            case 3:
                              result =
                                  '${textFiledController1.text.trim()}${LocaleKeys.unit_yo.tr}';
                              data[LocaleKeys.title4.tr] = result;
                              break;
                            case 4:
                              result =
                                  '${textFiledController1.text.trim()}${LocaleKeys.unit_hrs.tr}';
                              data[LocaleKeys.title5.tr] = result;
                              break;
                            case 5:
                              result = '${textFiledController1.text.trim()}人';
                              data[LocaleKeys.title6.tr] = result;
                              break;
                            case 6:
                              if (nestedIndex == -1) {
                                //add
                                if (textFiledController1.text
                                        .trim()
                                        .isNotEmpty &&
                                    textFiledController2.text
                                        .trim()
                                        .isNotEmpty) {
                                  (data[LocaleKeys.title7.tr]
                                          as List<Map<String, String>>)
                                      .add({
                                    textFiledController1.text.trim():
                                        textFiledController2.text.trim()
                                  });
                                }
                              } else {
                                //update
                                (data[LocaleKeys.title7.tr] as List<
                                    Map<String, String>>)[nestedIndex] = {
                                  textFiledController1.text.trim():
                                      textFiledController2.text.trim()
                                };
                              }
                              break;
                            case 7:
                              if (nestedIndex == -1) {
                                //add
                                if (textFiledController1.text
                                    .trim()
                                    .isNotEmpty &&
                                    textFiledController2.text
                                        .trim()
                                        .isNotEmpty) {
                                  (data[LocaleKeys.title8.tr]
                                  as List<Map<String, String>>)
                                      .add({
                                    textFiledController1.text.trim():
                                    textFiledController2.text.trim()
                                  });
                                }
                              } else {
                                //update
                                (data[LocaleKeys.title8.tr] as List<
                                    Map<String, String>>)[nestedIndex] = {
                                  textFiledController1.text.trim():
                                  textFiledController2.text.trim()
                                };
                              }
                              break;
                          }
                          textFiledController1.clear();
                          textFiledController2.clear();
                          textFiledController3.clear();
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(Iro.blue1)),
                          child: Text(
                            LocaleKeys.string_confirm.tr,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: R.image.bg_header(),
              ),
            ),
          ],
        )));
  }

  TextStyle _buildSubtitleStyle() => const TextStyle(
      fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400);

  InputDecoration _buildInputDecoration(String hint) => InputDecoration(
      contentPadding: const EdgeInsets.only(left: 16),
      hintText: hint,
      hintStyle: const TextStyle(
          color: Color(Iro.gray3), fontSize: 12, fontWeight: FontWeight.w400),
      border: InputBorder.none,
      counterText: '');
}
