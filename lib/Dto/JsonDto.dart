class JsonDto{
  JsonDto({
    this.token,
    this.bearer = "Bearer",
    this.nombreUsuario
  });

  String token, bearer,nombreUsuario;

  factory JsonDto.fromJson(Map<String, dynamic> json) => JsonDto(
    token: json["token"],
    bearer: json["bearer"],
    nombreUsuario: json["nombreUsuario"]
  );



  Map<String, dynamic> toJson() => {
    "token": token,
    "bearer": bearer,
    "nombreUsuario": nombreUsuario
  };
}