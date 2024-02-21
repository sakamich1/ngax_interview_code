
import 'package:get/get.dart';

import '../i18n/translation.dart';

Future<void> init() async {
  Get.lazyPut<TranslationsService>(() => TranslationsService());
}
