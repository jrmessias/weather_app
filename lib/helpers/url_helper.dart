import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchInBrowser(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw Exception("Não foi possível abrir a url: $url");
  }
}

Future<void> launchWhatsapp(String number, String message) async {
  String url = Uri.encodeFull(
      "https://api.whatsapp.com/send?phone=$number&text=$message");
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw Exception("Não foi possível abrir o Whatsapp para o número: $number");
  }
}
