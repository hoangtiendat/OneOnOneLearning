class CategoryModel {
  static List<CategoryObj> categories = [
    CategoryObj("0", "all", "All", "Tất cả", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("1", "ek", "English for kids", "English for kids",
        "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
    CategoryObj("2", "eb", "English for Business", "English for Business",
        "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
    CategoryObj("3", "cs", "Conversational", "Conversational",
        "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
    CategoryObj("4", "ie", "IELTS", "IELTS", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("5", "tf", "TOEFL", "TOEFL", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("6", "te", "TOEIC", "TOEIC", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
  ];
}

class CategoryObj {
  String id;
  String key;
  String englishName;
  String vietnameseName;
  String createdAt;
  String updatedAt;

  CategoryObj(this.id, this.key, this.englishName, this.vietnameseName,
      this.createdAt, this.updatedAt);

  // factory CategoryObj.fromJson(Map<String, dynamic> json) => CategoryObj(
  //       json['id'],
  //       json['key'],
  //       json['englishName'],
  //       json['vietnameseName'],
  //       json['createdAt'],
  //       json['updatedAt'],
  //     );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['key'] = key;
  //   data['englishName'] = englishName;
  //   data['vietnameseName'] = vietnameseName;
  //   data['createdAt'] = createdAt;
  //   data['updatedAt'] = updatedAt;
  //   return data;
  // }
}
