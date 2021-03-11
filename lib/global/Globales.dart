class Globales {
  // ignore: non_constant_identifier_names
  static String _urlBase = 'http://localhost/cuPAYBack/public/index.php';

 static String get urlBase {
    return _urlBase;
  }

 static String get urlLoguin {
    return _urlBase+"/authentication_token";
  }

  static String get urlVerifyEmail {
    return _urlBase+"/api/verifify_email2";
  }

  

 


}
