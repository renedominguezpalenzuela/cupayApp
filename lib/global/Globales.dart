class Globales {
  // ignore: non_constant_identifier_names
  //static String _urlBase = 'http://localhost/cuPAYBack/public/index.php';
  static String _urlBase = 'http://10.0.2.2/cuPAYBack/public/index.php';
  static int _timeOutTime = 3;

  static String get urlBase {
    return _urlBase;
  }

 static int get timeOutTime {
    return _timeOutTime;
  }
  static String get urlLoguin {
    return _urlBase + "/authentication_token";
  }

  static String get urlVerifyEmail {
    return _urlBase + "/api/verifify_email2";
  }
}
