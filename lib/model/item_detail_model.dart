class ItemDetailModel {
  late String tabName;
  late String description;
  late List<String> imageList;

  ItemDetailModel(
      {required this.tabName,
      required this.description,
      required this.imageList});

  static List detailList = [
    ItemDetailModel(
        tabName: "Hotel",
        description: "Surrounded by rich fields, Vill Kayu Lama offer a peaceful retreat in ubud. Guests can take a leisurely swim in the pri...",
        imageList: [
          "assets/images/ic_hotel_one.png",
          "assets/images/ic_hotel_two.png",
          "assets/images/ic_hotel_two.png"
        ]),
    ItemDetailModel(
        tabName: "Foods",
        description: "Foods are renowned for their rich flavors and vibrant spices, offering a delightful culinary experience. From savory satay to sweet rice cakes, Bali's diverse cuisine is a feast for the senses.",
        imageList: [
          "assets/images/ic_food_one.png",
          "assets/images/ic_food_two.png",
          "assets/images/ic_food_two.png"
        ]),
    ItemDetailModel(
        tabName: "Activities",
        description: "Discover 81 cool things to do in Bali that you don't want to miss! from stunning diving spots to amazing beach clubs.",
        imageList: [
          "assets/images/ic_activity_one.png",
          "assets/images/ic_activity_two.png",
          "assets/images/ic_activity_two.png"
        ])
  ];
}
