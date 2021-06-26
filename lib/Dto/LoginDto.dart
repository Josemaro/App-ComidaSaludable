class LoginDto{
  LoginDto({
    this.email,
    this.password,
  });

  String email, password;

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password":password,
  };
}