class CategoryModel {
  static List<CategoryObj> categories = [
    CategoryObj("0", "", "All", "Tất cả", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("1", "english-for-kids", "English for kids", "English for kids",
        "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
    CategoryObj(
        "2",
        "business-english",
        "English for Business",
        "English for Business",
        "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj(
        "3",
        "conversational-english",
        "Conversational",
        "Conversational",
        "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("4", "starters", "STARTERS", "STARTERS",
        "2021-06-10T14:54:31.964Z", "2021-06-10T14:54:31.964Z"),
    CategoryObj("5", "movers", "MOVERS", "MOVERS", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("6", "flyers", "FLYERS", "FLYERS", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("7", "ket", "KET", "KET", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("8", "pet", "PET", "PET", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("9", "ielts", "IELTS", "IELTS", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("10", "toefl", "TOEFL", "TOEFL", "2021-06-10T14:54:31.964Z",
        "2021-06-10T14:54:31.964Z"),
    CategoryObj("11", "toeic", "TOEIC", "TOEIC", "2021-06-10T14:54:31.964Z",
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
}
