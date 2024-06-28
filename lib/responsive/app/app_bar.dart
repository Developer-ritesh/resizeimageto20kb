import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resizeimageto20kb/utils.dart';

import '../../routes/manage_routes.dart';

Widget app_bar(BuildContext context) {
  return Container(
    height: 60,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(color: Colors.grey[100]),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Get.toNamed(RouteClass.home),
            child: Center(
              child: Text(
                app_name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        PopupMenuButton(
          icon: Icon(Icons.menu),
          itemBuilder: (ctx) => [
            _buildPopupMenuItem('Home', 'home'),
            _buildPopupMenuItem('About', 'about'),
            _buildPopupMenuItem('Contact us', 'contact'),
            _buildPopupMenuItem('Disclaimer', 'disclaimer'),
            _buildPopupMenuItem('Privacy Policy', 'privacy-policy'),
            _buildPopupMenuItem('T & C', 'terms-and-condition'),
          ],
        ),
      ],
    ),
  );
}

PopupMenuItem _buildPopupMenuItem(String title, String url) {
  return PopupMenuItem(
    onTap: () {
      if (url == 'home') {
        Get.toNamed(RouteClass.home);
      } else if (url == 'about') {
        var parameters = {"pageId": 'about'};
        Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
      } else if (url == 'contact') {
        var parameters = {"pageId": 'contact'};
        Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
      } else if (url == 'disclaimer') {
        var parameters = {"pageId": 'disclaimer'};
        Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
      } else if (url == 'privacy-policy') {
        var parameters = {"pageId": 'privacy-policy'};
        Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
      } else if (url == 'terms-and-condition') {
        var parameters = {"pageId": 'terms-and-condition'};
        Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
      }
    },
    child: Text(title),
  );
}
