class User {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  User({this.name,this.email,this.password,this.confirmPassword});

  void imprimir(){
    print("Nombre  $name   Email $email Password $password Confirm Password $confirmPassword");
  }
}