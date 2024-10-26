import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> populars = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategoryModels();
    diets = DietModel.getDiets();
    populars = PopularModel.getPopulars();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 20,
          ),
          _dietSection(),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                  scrollDirection: Axis.vertical,
                  itemCount: populars.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    PopularModel popular = populars[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40,
                                spreadRadius: 0,
                                color: popular.isViewSelected
                                    ? const Color(0xff1D1617).withOpacity(0.11)
                                    : Colors.transparent,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                popular.iconPath,
                                height: 45,
                                width: 45,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  popular.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${popular.level} | ${popular.duration} | ${popular.calorie}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/icons/ic_arrow_right.svg',
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: diets.length,
              itemBuilder: (context, index) {
                DietModel diet = diets[index];
                return Padding(
                  padding: (index != 0 && (index != diets.length - 1))
                      ? const EdgeInsets.all(8)
                      : (index == 0)
                          ? const EdgeInsets.only(
                              left: 20.0, top: 8, bottom: 8, right: 8)
                          : const EdgeInsets.only(
                              right: 20.0, top: 8, bottom: 8, left: 8),
                  child: Container(
                    height: 240,
                    width: 200,
                    decoration: BoxDecoration(
                      color: diet.boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 116,
                          height: 80,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(diet.iconPath),
                        ),
                        Column(
                          children: [
                            Text(
                              diet.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${diet.level} | ${diet.duration} | ${diet.calorie}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                diet.isViewSelected
                                    ? const Color(0xff9DCEFF)
                                    : Colors.transparent,
                                diet.isViewSelected
                                    ? const Color(0xff92A3FD)
                                    : Colors.transparent
                              ],
                            ),
                          ),
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: diet.isViewSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 125,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              CategoryModel category = categories[index];
              return Padding(
                padding: (index != 0 && (index != categories.length - 1))
                    ? const EdgeInsets.all(8)
                    : (index == 0)
                        ? const EdgeInsets.only(
                            left: 20.0, top: 8, bottom: 8, right: 8)
                        : const EdgeInsets.only(
                            right: 20.0, top: 8, bottom: 8, left: 8),
                child: Container(
                  height: 125,
                  width: 100,
                  decoration: BoxDecoration(
                    color: category.boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(category.iconPath),
                      ),
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/ic_search.svg',
            ),
          ),
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xffDDDADA),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),
          suffixIcon: SizedBox(
            width: 60,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Color(0xffDDDADA),
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 8,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/ic_filter.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF7F8F8),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/ic_back.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF7F8F8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/ic_more.svg',
              width: 5,
              height: 5,
            ),
          ),
        ),
      ],
    );
  }
}
