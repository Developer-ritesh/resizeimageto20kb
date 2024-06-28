import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:resizeimageto20kb/controller/tools_controller.dart';

final toolsCOntroller = Get.put(ToolsController());
var webFile;

Widget imageupload() {
  return Container(
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(5)),
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text('Please select a image to start editing'),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () async {
            FilePickerResult? filePickerResult =
                await FilePicker.platform.pickFiles();
            if (filePickerResult != null) {
              webFile = filePickerResult.files.first.bytes!;
            }
            if (webFile != null) {
              toolsCOntroller.setWebFile(webFile);
            }
          },
          child: Obx(
            () => Center(
              child: toolsCOntroller.webFile.value != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: webFile != null
                          ? Image.memory(
                              webFile!, // Change this line
                              height: 200,
                            )
                          : CircularProgressIndicator(),
                    )
                  : Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                            width: 0.6,
                            color: Color.fromARGB(255, 208, 208, 208)),
                      ),
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tap to select image',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? filePickerResult =
                                  await FilePicker.platform.pickFiles();
                              if (filePickerResult != null) {
                                webFile = filePickerResult.files.first.bytes!;
                              }
                              if (webFile != null) {
                                toolsCOntroller.setWebFile(webFile);
                              }
                            },
                            child: Text('Select Image'),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
