class UserAccount {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  String? accessToken;
  String? refreshToken;
  String ? userPoints;

  UserAccount({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.address,
    this.role,
    this.accessToken,
    this.refreshToken,
    this.userPoints,
  });

  UserAccount.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'] ?? "";
    role = json['role'];
    accessToken = json['accessToken']??"";
    refreshToken = json['refreshToken']??"";
    userPoints = json['userPoints']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['address'] = address ?? "";
    data['role'] = role;
    data['refreshToken']=refreshToken;
    data['accessToken']=accessToken;
    return data;
  }
}
