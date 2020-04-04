class ValidationMixin {

  String validateFirstName(String value) {
    if (value.length < 2) {
      return "isim en az iki karakter olmalıdır";
    }
    return null;
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyadınız en az iki karakter olmalıdır";
    }
    return null;
  }

  String validateEmailName(String value) {
    if (!value.contains("@")) {
      return "Mail Geçerli Değil";
    }
    return null;
  }

 
}
