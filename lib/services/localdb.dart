import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
static final uidKey = "fsfjkfskjfsfv";
static final lkey = "467435bvesgwyh";
static final rkey = "4543467435bvesgwyh";
static final nkey = "45363w54svegrft";
static final mkey = "65g14er4efesdfeaswcsdfv45";
static final pkey = "65g14ascafder4ev45";
static final Audkey = "65g14ascjhkjlikafder4ev45";
static final Jokkey = "65g14kjhihascafder4ev45";
static final F50key = "65g14jhkjascafder4ev45";
static final Expkey = "65g14tfghjascafder4ev45";


  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

   static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }



 static Future<bool> saveMoney(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mkey, money);
  }

   static Future<String?> getMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mkey);
  }



   static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nkey, name);
  }

   static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nkey);
  }


  static Future<bool> saveUrl(String prourl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pkey, prourl);
  }

   static Future<String?> getUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(pkey);
  }



 static Future<bool> saveLevel(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(lkey, level);
  }

   static Future<String?> getLevel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(lkey);
  }

 static Future<bool> saveRank(String rank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rkey, rank);
  }

   static Future<String?> getRank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rkey);
  }






 static Future<bool> saveAud(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(Audkey, isAvail);
  }

   static Future<bool?> getAud() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(Audkey);
  }
  

 static Future<bool> saveJok(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(Jokkey, isAvail);
  }

   static Future<bool?> getJok() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(Jokkey);
  }
  
   static Future<bool> save50(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(F50key, isAvail);
  }

   static Future<bool?> get50() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(F50key);
  }
  
   static Future<bool> saveExp(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(Expkey, isAvail);
  }

   static Future<bool?> getExp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(Expkey);
  }
  



  
}