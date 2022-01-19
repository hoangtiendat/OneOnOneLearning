class Rows {
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  int? timezone;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  int? price;
  bool? isOnline;
  bool? isFavorite;

  Rows(
      {this.avatar,
      this.name,
      this.country,
      this.phone,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.timezone,
      this.isPhoneAuthActivated,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.price,
      this.isOnline});

  Rows.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    timezone = json['timezone'];
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    price = json['price'];
    isOnline = json['isOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['requestPassword'] = requestPassword;
    data['isActivated'] = isActivated;
    data['timezone'] = timezone;
    data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['userId'] = userId;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['price'] = price;
    data['isOnline'] = isOnline;
    return data;
  }
}
