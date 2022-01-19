import '../../constants.dart';

class Feedbacks {
  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  double? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  FirstInfo? firstInfo;

  Feedbacks(
      {this.id,
      this.bookingId,
      this.firstId,
      this.secondId,
      this.rating,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.firstInfo});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = checkDouble(json['rating']);
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstInfo = json['firstInfo'] != null
        ? FirstInfo.fromJson(json['firstInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bookingId'] = bookingId;
    data['firstId'] = firstId;
    data['secondId'] = secondId;
    data['rating'] = rating;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (firstInfo != null) {
      data['firstInfo'] = firstInfo!.toJson();
    }
    return data;
  }
}

class FirstInfo {
  String? id;
  String? level;
  String? email;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  int? timezone;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;

  FirstInfo(
      {this.id,
      this.level,
      this.email,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.isPhoneActivated,
      this.timezone,
      this.isPhoneAuthActivated,
      this.createdAt,
      this.updatedAt});

  FirstInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    email = json['email'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['email'] = email;
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['language'] = language;
    data['birthday'] = birthday;
    data['requestPassword'] = requestPassword;
    data['isActivated'] = isActivated;
    data['isPhoneActivated'] = isPhoneActivated;
    data['timezone'] = timezone;
    data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
