import 'dart:convert';

final List<CatItem> categoryList = [
  CatItem(
    id: 'lpbq11nlkczx54e',
    image: 'images/jolopa.jpg',
    title: 'جلوپا',
  ),
  CatItem(
    id: 'yhoe78e5q5ticrx',
    image: 'images/poshtpa.jpg',
    title: 'پشت پا و باسن',
  ),
  CatItem(
    id: '07iquhpceqzsxe3',
    image: 'images/sine.jpg',
    title: 'سینه',
  ),
  CatItem(
    id: 'v44k8iw3qvnea8v',
    image: 'images/sarshoone.jpg',
    title: 'سرشانه',
  ),
  CatItem(
    id: 'xxwitikuped6dmp',
    image: 'images/zirbaqal.jpg',
    title: 'زیربغل',
  ),
  CatItem(
    id: 'g3pf3kvjraenzcy',
    image: 'images/kool.jpg',
    title: 'کول و شراگز',
  ),
  CatItem(
    id: 'majs5pwwmyonmgw',
    image: 'images/jolobazoo.jpg',
    title: 'جلوبازو',
  ),
  CatItem(
    id: '6ko6xu1dec5pm97',
    image: 'images/poshtbazoo.jpg',
    title: 'پشت بازو',
  ),
  CatItem(
    id: '6fc2upwwp1kc788',
    image: 'images/shekam.jpg',
    title: 'شکم',
  ),
  CatItem(
    id: 'qrxk7xz7h4eucpy',
    image: 'images/pahloo.jpg',
    title: 'پهلو',
  ),
  CatItem(
    id: 'ff5gt5ntgrmqy2d',
    image: 'images/saeed.jpg',
    title: 'ساعد',
  ),
  CatItem(
    id: 'o062fb73arg0v4n',
    image: 'images/saq.jpg',
    title: 'ساق',
  ),
];

List<CatItem> bodyCategoryFromJson(String str) =>
    List<CatItem>.from(json.decode(str).map((x) => CatItem.fromJson(x)));

class CatItem {
  String id;
  String image;
  String title;

  CatItem({
    required this.id,
    required this.image,
    required this.title,
  });

  factory CatItem.fromJson(Map<String, dynamic> json) => CatItem(
        id: json["id"],
        image: json["image"],
        title: json["title"],
      );
}
