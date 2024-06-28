import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resizeimageto20kb/responsive/page/desktop_page.dart';
import 'package:resizeimageto20kb/responsive/page/mobile_page.dart';

class Pages extends StatefulWidget {
  const Pages({super.key, required this.pageId});
  final String pageId;

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String data = '';

  @override
  void initState() {
    super.initState();
    getPage();
  }

  Future<void> getPage() async {
    firestore.collection('page').doc(widget.pageId).get().then((value) {
      setState(() {
        data = value["body"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return MobilePage(
            data: data,
          );
        } else {
          return DesktopPage(
            data: data,
          );
        }
      },
    );
  }
}
