import 'package:flutter/material.dart';

import './models/category.dart';
import './models/product.dart';
import 'package:flutter/cupertino.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Wristband',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'T-shirt',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Socks',
    color: Color.fromARGB(255, 92, 80, 63),
  ),
  Category(
    id: 'c4',
    title: 'Cap',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Keychain',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Stickers',
    color: Colors.green,
  ),
  // Category(
  //   id: 'c7',
  //   title: 'Breakfast',
  //   color: Colors.lightBlue,
  // ),
  // Category(
  //   id: 'c8',
  //   title: 'Asian',
  //   color: Colors.lightGreen,
  // ),
  // Category(
  //   id: 'c9',
  //   title: 'French',
  //   color: Colors.pink,
  // ),
  // Category(
  //   id: 'c10',
  //   title: 'Summer',
  //   color: Colors.teal,
  // ),
];

List<product> DUMMY_PRODUCTS = [
  product(
    id: 'm1',
    categories: [
      'c2',
    ],
    price: 100,
    title: 'Confrence T-shirt',
    imageUrl: Image.asset(
      'images/icons/Delegates T-Shirt.jpg',
      fit: BoxFit.cover,
    ),
  ),
  product(
    id: 'm2',
    categories: [
      'c1',
    ],
    title: 'Fiber wristband',
    price: 20,
    imageUrl: Image.asset('images/icons/buyicon.png'),
  ),
  product(
    id: 'm3',
    categories: [
      'c1',
    ],
    title: 'Rubber wristband',
    price: 50,
    imageUrl: Image.asset('images/icons/Rubber Wristband (Normal).jpg'),
  ),
  product(
    id: 'm4',
    categories: [
      'c1',
    ],
    title: 'Glowing wristband',
    price: 80,
    imageUrl: Image.asset('images/icons/Rubber Wristband (Glowing).JPG'),
  ),
  product(
    id: 'm5',
    categories: ['c3'],
    title: 'Conference Socks',
    price: 70,
    imageUrl: Image.asset('images/icons/buyicon.png'),
  ),
  product(
    id: 'm6',
    categories: [
      'c4',
    ],
    title: 'Conference cap',
    price: 80,
    imageUrl: Image.asset(
      'images/icons/buyicon.png',
      fit: BoxFit.cover,
    ),
  ),
  product(
    id: 'm7',
    categories: [
      'c5',
    ],
    title: 'Keychain',
    price: 20,
    imageUrl: Image.asset('images/icons/Key Chain (Back Side).jpg'),
  ),
  product(
    id: 'm8',
    categories: [
      'c6',
    ],
    title: 'Conference Sticker',
    price: 90,
    imageUrl: Image.asset('images/icons/buyicon.png'),
  ),
  // product(
  //   id: 'm9',
  //   categories: [
  //     'c9',
  //   ],
  //   title: 'Chocolate Souffle',
  //   price: 80,
  //   imageUrl:
  //       'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
  // ),
  // product(
  //   id: 'm10',
  //   categories: [
  //     'c2',
  //     'c5',
  //     'c10',
  //   ],
  //   title: 'Asparagus Salad with Cherry Tomatoes',
  //   price: 900,
  //   imageUrl:
  //       'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
  // ),
];
