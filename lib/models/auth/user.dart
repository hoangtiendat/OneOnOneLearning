import 'feedbacks.dart';

class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String?>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  String? level;
  int? timezone;
  List<Feedbacks>? feedbacks;

  User(
      {this.id,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.roles,
      this.language,
      this.birthday,
      this.isActivated,
      this.level,
      this.timezone,
      this.feedbacks});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = json['roles'].cast<String?>();
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    level = json['level'];
    timezone = json['timezone'];
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(Feedbacks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['roles'] = roles;
    data['language'] = language;
    data['birthday'] = birthday;
    data['isActivated'] = isActivated;
    data['level'] = level;
    data['timezone'] = timezone;
    if (feedbacks != null) {
      data['feedbacks'] = feedbacks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
