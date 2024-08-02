// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

Future shareThisContent(String? source) async {
  // Add your function code here!
  String url = "";

  //Email Content
  String emailSubject = "Slammy, your Trash Talking AI";
  String emailContent =
      "Hey, I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  //Facebook Content
  String facebookContent =
      "I just got slammed by a trash-talki' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  //Instagram Content
  String instagramContent =
      "I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  //Twitter Content
  String twitterContent =
      " I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  //Copy Content
  String copyContent =
      "I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  //SMS Content
  String smsContent =
      "I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  //WhatsApp Content
  String whatsAppContent =
      "I just got slammed by a trash-talkin' AI chatbot. See if you can fleece it. Have fun chirpin' https://slammie.ai/";

  switch (source) {
    case "email":
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: '',
        query: "subject=$emailSubject&body=$emailContent",
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        // Use canLaunchUrl for consistency
        await launchUrl(emailLaunchUri); // Use launchUrl for consistency
      } else {
        throw 'Could not launch $url';
      }

      break;
    case "facebook":
      final String facebookShareUrl =
          'https://www.facebook.com/sharer/sharer.php?u={url}';
      url = facebookShareUrl.replaceAll('{url}', facebookContent);
      break;
    case "twitter":
      final String twitterUrl =
          'https://twitter.com/intent/tweet?text=$twitterContent';
      if (await canLaunchUrl(Uri.parse(twitterUrl))) {
        url = twitterUrl;
      } else {
        url = 'https://twitter.com/home?status=$twitterContent';
      }
      break;
    case "whatsapp":
      final String whatsappUrl = 'https://wa.me/?text=$whatsAppContent';
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        url = whatsappUrl;
      } else {
        url = 'https://web.whatsapp.com/send?text=$whatsAppContent';
      }
      break;
    case "sms":
      // **SMS sharing with pre-filled message:**
      url = 'sms:?body=$smsContent'; // Android only (limitations)
      break;
    case "instagram":
      // Encode message
      // String encodedMessage = Uri.encodeComponent(instagramContent);
      // // Construct the Instagram direct message sharing URL with the message
      // url = 'instagram://direct_message?text=$encodedMessage';
      await Clipboard.setData(ClipboardData(text: instagramContent));
      url = "https://instagram.com";
      break;
    case "copy":
      await Clipboard.setData(ClipboardData(text: copyContent));
      break;
    default:
      break;
  }

  if (url != "") {
    if (await canLaunchUrl(Uri.parse(url))) {
      // Use canLaunchUrl for consistency
      await launchUrl(Uri.parse(url)); // Use launchUrl for consistency
    } else {
      throw 'Could not launch $url';
    }
  }
}
