/*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Url extends StatefulWidget {
  const Url({super.key});

  @override
  State<Url> createState() => _UrlState();
}

class _UrlState extends State<Url> {
  void _callPhone(String number) async {
    final Uri callUri = Uri.parse("tel:$number");
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      print("Could not launch phone call to $number");
    }
  }

  void _openWhatsApp(String number) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$number");
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      print("Could not open WhatsApp chat for $number");
    }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/
