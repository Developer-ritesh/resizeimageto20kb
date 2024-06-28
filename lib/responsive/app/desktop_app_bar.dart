import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resizeimageto20kb/routes/manage_routes.dart';
import 'package:resizeimageto20kb/utils.dart';

Widget desktop_app_bar() {
  return Container(
    height: 60,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(color: Colors.grey[100]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(RouteClass.home),
          child: Text(
            app_name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed(RouteClass.home);
              },
              child: Text(
                'Home',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                var parameters = {"pageId": 'about'};
                Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
              },
              child: Text(
                'About',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                var parameters = {"pageId": 'contact'};
                Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
              },
              child: Text(
                'Contact us',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                var parameters = {"pageId": 'disclaimer'};
                Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
              },
              child: Text(
                'Disclaimer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                var parameters = {"pageId": 'privacy-policy'};
                Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                var parameters = {"pageId": 'terms-and-condition'};
                Get.toNamed('${RouteClass.page}/${parameters["pageId"]}');
              },
              child: Text(
                'T & C',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
