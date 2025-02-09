class HiveShagerd {
  String name;
  int jalase;
  bool khosusi;
  final int shagerdId;
  int plan;
  DateTime registerdate;
  String phone;
  String workouttime;

  HiveShagerd(
      {required this.name,
      required this.jalase,
      required this.khosusi,
      required this.shagerdId,
      required this.plan,
      required this.registerdate,
      required this.phone,
      required this.workouttime});
  factory HiveShagerd.fromJson(Map<String, dynamic> json) => HiveShagerd(
        shagerdId: json["shagerdId"],
        name: json["name"],
        jalase: json["jalase"],
        khosusi: json["khosusi"],
        plan: json["plan"],
        registerdate: DateTime.parse(json["registerdate"]),
        phone: json["phone"],
        workouttime: json["workouttime"],
      );

  static List<HiveShagerd> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HiveShagerd.fromJson(json)).toList();
  }
}
