class Webuser {
  int? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? key;
  bool? driver;

  Webuser(
      {this.userId,
      this.userName,
      this.firstName,
      this.lastName,
      this.key,
      this.driver});

  factory Webuser.fromJson(Map<String, dynamic> json) {
    return Webuser(
        userId: json['userId'],
        userName: json['userName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        key: json['authKey'],
        driver: json['driver']);
  }
}
