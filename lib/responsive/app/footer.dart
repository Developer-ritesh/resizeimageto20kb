import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../image_pic.dart';

Widget footer() {
  return Container(
    height: 100,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 10),
    color: Colors.grey[200],
    child: Obx(() => HtmlWidget(toolsCOntroller.footer.value)),
  );
}
