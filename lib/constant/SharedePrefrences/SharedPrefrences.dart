import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences{
  static  SharedPreferences? _preference;

  static const boolkey="boolkey";
  static const First="First";

  static init()async {
    _preference=await SharedPreferences.getInstance();
    return _preference;
  }
// ============ This Is For WhatsApp Business Permission * Start * ====== //
  static Future saveBool(bool a){
    return _preference!.setBool("boolkey", a);
  }
  static bool fetchData(){
    return _preference!.getBool("boolkey")??false;
  }
// ============ This Is For WhatsApp Business Permission * Ends * ====== //

// ============ This Is For WhatsApp Permission * Start * ====== //
  static Future saveWhatsappPermission(bool b){
    return _preference!.setBool("First", b);
  }
  static bool? fetchWhatsAppPermission(){
    return _preference!.getBool("First");
  }
// ============ This Is For WhatsApp Permission * Ends * ====== //
}