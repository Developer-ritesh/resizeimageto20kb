import 'package:flutter/material.dart';
import 'package:resizeimageto20kb/responsive/app/app_bar.dart';
import 'package:resizeimageto20kb/responsive/details.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: app_bar(context),
      ),
      body: SingleChildScrollView(child: details()),
      
    );
  }
}
