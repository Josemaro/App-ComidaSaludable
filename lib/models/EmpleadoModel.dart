
// MARK: - Usuario
class EmpleadoModel{
  EmpleadoModel({
    this.idUser,
    this.username,
    this.email,
    this.password,
    this.role,
    this.enabled,
});

int idUser;
String username, email, password, role;
String enabled;

factory EmpleadoModel.fromJson(Map<String, dynamic> json) => EmpleadoModel(
  idUser: json["idUser"],
  username: json["username"],
  email: json["email"],
  password: json["password"],
  role: json["role"],
  enabled: json["enabled"],
);

Map<String, dynamic> toJson() => {
    "idUser": idUser,
    "username": username,
    "email": email,
    "password":password,
    "role":role,
    "enabled":enabled,
  };
}