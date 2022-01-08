class Specialties {
  final topic = [
    {
      "id": 3,
      "key": "english-for-kids",
      "name": "English for Kids",
      "createdAt": "2021-09-03T13:27:18.266Z",
      "updatedAt": "2021-09-03T13:27:18.266Z"
    },
    {
      "id": 4,
      "key": "business-english",
      "name": "Business English",
      "createdAt": "2021-09-03T13:27:18.266Z",
      "updatedAt": "2021-09-03T13:27:18.266Z"
    },
    {
      "id": 5,
      "key": "conversational-english",
      "name": "Conversational English",
      "createdAt": "2021-09-03T13:27:18.266Z",
      "updatedAt": "2021-09-03T13:27:18.266Z"
    },
    {
      "id": 6,
      "key": "starters",
      "name": "STARTERS",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 7,
      "key": "movers",
      "name": "MOVERS",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 8,
      "key": "flyers",
      "name": "FLYERS",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 9,
      "key": "ket",
      "name": "KET",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 10,
      "key": "pet",
      "name": "PET",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 11,
      "key": "ielts",
      "name": "IELTS",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 12,
      "key": "toefl",
      "name": "TOEFL",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    },
    {
      "id": 13,
      "key": "toeic",
      "name": "TOEIC",
      "createdAt": "2021-09-03T13:27:18.820Z",
      "updatedAt": "2021-09-03T13:27:18.820Z"
    }
  ];

  getSpecialtie(key) {
    final topics = topic.firstWhere((element) => element["key"] == key);
    if (topics.isNotEmpty) {
      return topics["name"];
    } else {
      throw Exception("Topic key incorrect");
    }
  }
}
