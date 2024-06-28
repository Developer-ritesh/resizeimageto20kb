import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:resizeimageto20kb/controller/tools_controller.dart';
import 'package:resizeimageto20kb/responsive/app/footer.dart';
import 'package:resizeimageto20kb/responsive/image_pic.dart';

final toolsCOntroller = Get.put(ToolsController());

Widget details() {
  return Column(
    children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Obx(() => HtmlWidget(toolsCOntroller.title.value)),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      imageupload(),
      Obx(
        () => Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Maximum file size'),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: toolsCOntroller.fileSize,
                              decoration: InputDecoration(
                                label: Text(
                                  'File size [ KB ]',
                                ),
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 232, 232, 232),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.transparent),
                            ),
                            child: Text('KB'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.7),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        focusColor: Colors.white,
                        underline: Container(),
                        borderRadius: BorderRadius.circular(5),
                        value: toolsCOntroller.selectedValue.value,
                        items: ['JPG', 'PNG', 'JPEG'].map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          toolsCOntroller.selectedValue.value = newValue!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: toolsCOntroller.width,
                      decoration: InputDecoration(
                        label: Text('Width'),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      controller: toolsCOntroller.height,
                      decoration: InputDecoration(
                        label: Text('Height'),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () => toolsCOntroller.uploadImageToServer(),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      FutureBuilder(
        future: toolsCOntroller.getHomeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An error occurred!"));
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: HtmlWidget(toolsCOntroller.data.value),
            );
          }
        },
      ),
      footer(),
    ],
  );
}
