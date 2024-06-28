import 'package:flutter/material.dart';
import 'package:resizeimageto20kb/responsive/details.dart';
import 'package:resizeimageto20kb/responsive/app/desktop_app_bar.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

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
                child: details(),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: constraints.maxWidth / 2,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  child: details(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
