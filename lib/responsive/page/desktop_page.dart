import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:resizeimageto20kb/responsive/app/desktop_app_bar.dart';

class DesktopPage extends StatelessWidget {
  final String data;

  const DesktopPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: desktop_app_bar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1000) {
            return SingleChildScrollView(
              child: Container(
                width: constraints.maxWidth / 1,
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  child: HtmlWidget(data),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: constraints.maxWidth / 2,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    child: HtmlWidget(data),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
