import 'package:get/get.dart';
import 'package:resizeimageto20kb/main.dart';
import 'package:resizeimageto20kb/responsive/page/pages.dart';

class RouteClass {
  static final String home = '/';
  static final String page = '/page';



  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => InitialPage(),
      children: [

        GetPage(
          name: page + '/:pageId',
          page: () {
            final postId = Get.parameters['pageId'];
            return Pages(pageId: postId.toString());
          },
        ),

        
      ],
    ),
  ];
}
