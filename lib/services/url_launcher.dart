import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error: can NOT open $url';
    }
  }
}
