import 'package:auto_route/annotations.dart';
import 'package:elibrary/ui/book_detail.dart';
import 'package:elibrary/ui/dashboard.dart';


@AdaptiveAutoRouter(routes: <AutoRoute>[
    AutoRoute(page: BookDetail,),
    AutoRoute(page: Dashboard, initial: true),
  ],
)
// extend the generated private router
class  $FlutterRouter {}
