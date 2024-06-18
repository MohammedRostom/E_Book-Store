class UserModel {
  final String? id, UserName, Role, Email, Password, Re_Password, Phone;
  String? ImagePath;

  UserModel(
      {this.id,
      required this.UserName,
      required this.Role,
      required this.Email,
      required this.Password,
      required this.Re_Password,
      required this.Phone,
      this.ImagePath});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      UserName: json['UserName'] as String?,
      Role: json['Role'] as String?,
      Email: json['Email'] as String?,
      Password: json['Password'] as String?,
      Re_Password: json['Re_Password'] as String?,
      Phone: json['Phone'] as String?,
      ImagePath: json['ImagePath'] as String?,
    );
  }

  Map<String, dynamic> toMap({required Uid}) => {
        "id": Uid,
        "UserName": UserName,
        "Role": Role,
        "Email": Email,
        "Password": Password,
        "Re_Password": Re_Password,
        "Phone": Phone,
      };
}
