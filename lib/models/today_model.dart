import 'package:flutter/material.dart';

class TodayModel {
  String name;
  String iconPath;
  Color boxColor;

  TodayModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<TodayModel> gettoday() {
    List<TodayModel> today = [];

    today.add(TodayModel(
        name: 'Salad',
        iconPath: 'assets/images/lays.jpg',
        boxColor: Color(0xff9DCEFF)));

    today.add(TodayModel(
        name: 'Cake',
        iconPath: 'assets/images/nuts.jpg',
        boxColor: Color(0xffEEA4CE)));

    today.add(TodayModel(
        name: 'Pie',
        iconPath: 'assets/images/mon.webp',
        boxColor: Color(0xff9DCEFF)));

    return today;
  }
}

class BoxModel {
  String name;
  String iconPath;
  String price;

  BoxModel({
    required this.name,
    required this.iconPath,
    required this.price,
  });

  static List<BoxModel> getbox() {
    List<BoxModel> box = [];

    box.add(BoxModel(
        name: 'Cheese', iconPath: 'assets/images/cheese.webp', price: '100'));

    box.add(BoxModel(
        name: 'Colgate', iconPath: 'assets/images/col.jpg', price: '129'));

    box.add(BoxModel(
        name: 'Dark-fantasy',
        iconPath: 'assets/images/dark.webp',
        price: '45'));

    box.add(BoxModel(
        name: 'Himalaiya baby',
        iconPath: 'assets/images/him.webp',
        price: '189'));
    return box;
  }
}
