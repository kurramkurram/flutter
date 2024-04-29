import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void show(String msg,
      {Toast? duration, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
    );
  }
}
