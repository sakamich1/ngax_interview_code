import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ngax_interview_code/module/home/home_controller.dart';
import '../../global/constants.dart';
import '../../i18n/locale_keys.dart';
import '../../r.g.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 19, 16, 0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildListItem(LocaleKeys.title1.tr, 0, 66,
                    text2: LocaleKeys.desc_year.tr),
                _buildListItem(LocaleKeys.title2.tr, 1, 66,
                    text2: LocaleKeys.desc_year.tr),
                _buildListItem(LocaleKeys.title3.tr, 2, 50),
                _buildListItem(LocaleKeys.title4.tr, 3, 50),
                _buildListItem(LocaleKeys.title5.tr, 4, 50),
                _buildListItem(LocaleKeys.title6.tr, 5, 66),
                _buildNestedListItem(6),
                _buildNestedListItem(7),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildListItem(String text1, int index, double height,
      {String text2 = ''}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: _buildBoxDecorationGray(),
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 6, 0),
          child: Row(
            children: [
              Text(
                text1,
                style: _buildItemTextStyle(),
                textAlign: TextAlign.center,
              ),
              text2.isEmpty
                  ? const Spacer()
                  : Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Text(
                        text2,
                        style: _buildItemTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  controller.edit(index);
                },
                child: Container(
                  width: index > 1 ? 68 : 100,
                  height: 32,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: index > 1
                          ? R.image.bg_dash_box_S()
                          : R.image.bg_dash_box(),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Obx(
                        () => Center(
                          child: Text(
                            controller.getDefaultValue(index),
                            style: _buildItemTextStyle(),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Image(
                          image: R.image.icon_text_editor(),
                          width: 16,
                          height: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNestedListItem(int index) {
    int parentIndex = index;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: _buildBoxDecorationGray(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 6, 0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 19, 0, 19),
                child: Text(
                  index == 6 ? LocaleKeys.title7.tr : LocaleKeys.title8.tr,
                  style: _buildItemTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 217,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 6, 12),
                  child: Column(
                    children: [
                      Obx(
                        () => ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                _buildNestedItem(context, index, parentIndex),
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 12,
                                color: Color(Iro.gray1),
                              );
                            },
                            itemCount: index == 6
                                ? (controller.data[LocaleKeys.title7.tr]
                                        as List<Map<String, String>>)
                                    .length
                                : (controller.data[LocaleKeys.title8.tr]
                                        as List<Map<String, String>>)
                                    .length),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.edit(index);
                        },
                        child: Container(
                          height: 32,
                          width: 217,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: R.image.bg_dash_box_L(),
                                fit: BoxFit.fill),
                          ),
                          child: const Text(
                            '+',
                            style: TextStyle(color: Color(Iro.blue1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNestedItem(
    BuildContext context,
    int index,
    int parentIndex,
  ) {
    return Obx(() => Stack(clipBehavior: Clip.none, children: [
          GestureDetector(
              onTap: () {
                controller.edit(parentIndex, nestedIndex: index);
              },
              child: Container(
                height: 32,
                width: 217,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: R.image.bg_dash_box_L(), fit: BoxFit.fill),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                      controller
                          .getNestedDefaultValue(index, parentIndex)
                          .keys
                          .first,
                      style: _buildItemTextStyle(),
                    ),
                    const Spacer(),
                    Text(
                      controller
                          .getNestedDefaultValue(index, parentIndex)
                          .values
                          .first,
                      style: _buildItemTextStyle(),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              )),
          Positioned(
            right: -6,
            top: -6,
            child: GestureDetector(
              onTap: () => controller.removeNestedItem(index, parentIndex),
              child: Image(
                width: 14,
                height: 14,
                image: R.image.icon_delete(),
              ),
            ),
          )
        ]));
  }

  TextStyle _buildItemTextStyle() => const TextStyle(
        color: Color(Iro.textColor1),
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  BoxDecoration _buildBoxDecorationGray() => BoxDecoration(
        border: Border.all(color: const Color(Iro.gray1), width: 1),
        borderRadius: BorderRadius.circular(8),
      );
}
