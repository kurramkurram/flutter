import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

extension LaunchApp on BuildContext {
  Future<bool> launchApp(String uriString) async {
    final uri = Uri.parse(uriString);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }
}
