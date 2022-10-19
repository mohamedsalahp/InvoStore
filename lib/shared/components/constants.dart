import 'package:untitled/modules/shop_app/login/shop_login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

void signOut(context) => CacheHelper.removeData(key: 'token').then((value) {
      if (value) navigateAndFinish(context, ShopLoginScreen());
    });

String? token;

String? uid;

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
