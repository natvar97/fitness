import 'dart:ui';

class PopularModel {
  String name;
  Color boxColor;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool isViewSelected;
  PopularModel({
    required this.name,
    required this.boxColor,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.isViewSelected,
  });

  static List<PopularModel> getPopulars() {
    List<PopularModel> diets = [];
    diets.add(
      PopularModel(
        name: 'Honey Pancake',
        boxColor: const Color(0xff92A3FD),
        iconPath: 'assets/icons/ic_pancakes.svg',
        level: 'Easy',
        duration: '30 mins',
        calorie: '180 kCal',
        isViewSelected: true,
      ),
    );
    diets.add(
      PopularModel(
        name: 'Canai Bread',
        boxColor: const Color(0xffC58BF2),
        iconPath: 'assets/icons/ic_canai_bread.svg',
        level: 'Easy',
        duration: '20 mins',
        calorie: '230 kCal',
        isViewSelected: false,
      ),
    );
    return diets;
  }
}
