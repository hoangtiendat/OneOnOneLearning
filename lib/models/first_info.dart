class FirstInfo {
  String? id;
  String? email;
  String? avatar;
  String? video;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;

  FirstInfo({
    required this.id,
    required this.email,
    required this.avatar,
    required this.video,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
  });

  factory FirstInfo.fromJson(Map<String, dynamic> json) => FirstInfo(
        id: json['id'],
        email: json['email'],
        avatar: json['avatar'],
        video: json['video'],
        name: json['name'],
        country: json['country'],
        phone: json['phone'],
        language: json['language'],
        birthday: json['birthday'],
      );
}
