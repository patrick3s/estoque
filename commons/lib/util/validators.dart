class Validators {
  static String? mandatory (String? text){
    text = text ?? '';
    if(text.isEmpty){
      return "Campo não pode ser vazio";
    }
    return null;
  }

  static String? email(String? email){
    email = email??'';
    if(email.isEmpty){
      return "Email não pode ser vazio";
    }else if(!email.contains('@') || !email.contains('.')){
      return "Email invalido";
    }else {
      return null;
    }
  }

  static String? password(String? pass){
    pass = pass ?? '';
    if(pass.isEmpty){
      return "Senha não pode ser vazia";
    }else if(pass.length < 6){
      return "Senha não pode ter menos de 6 caracteres";
    }else {
      return null;
    }
  }
}