
class HabitModel {
  final String id;
  final String name;
  final String icon;
  final int colorHex;

  const HabitModel({required this.id, required this.name, required this.icon, required this.colorHex});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'colorHex': colorHex,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] as String,
      name: map['name'] as String,
      icon: map['icon'] as String,
      colorHex: map['colorHex'] as int,
    );
  }
}
