class Trainer {
  final String name;
  final String gender;
  final int calories;
  final int weight;
  final int height;
  final int wrist;
  final String goal;
  final int age;
  final int protein;
  final int carbo;
  final int fat;
  final String activity;
  final List<Map<String, dynamic>> daylimeal;

  Trainer({
    required this.name,
    required this.gender,
    required this.calories,
    required this.weight,
    required this.height,
    required this.wrist,
    required this.goal,
    required this.age,
    required this.protein,
    required this.carbo,
    required this.fat,
    required this.activity,
    required this.daylimeal,
  });
}
