import 'dart:js';

import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/loginshop.dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';

void signout(context)
{
  cachehelper.removedata(key: 'token',).then((value) {
    navigateandfinish(context, loginshopp(),);
  });
}