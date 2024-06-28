import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:resizeimageto20kb/responsive/app/app_bar.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: app_bar(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: HtmlWidget(data),
      ),
    );
  }
}
