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
    color: Colors.orange,
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

const DUMMY_PRODUCTS = const [
  product(
    id: 'm1',
    categories: [
      'c2',
    ],
    price: 100,
    title: 'Confrence T-shirt',
    imageUrl: 'https://m.media-amazon.com/images/I/41UOwPBXvZL._AC_.jpg',
  ),
  product(
    id: 'm2',
    categories: [
      'c1',
    ],
    title: 'Fiber wristband',
    price: 20,
    imageUrl:
        'https://images.24hourwristbands.com/image/upload/f_auto,q_auto/shop_images/product/Cloth_Wristbands_592de6cd15b7c.png',
  ),
  product(
    id: 'm3',
    categories: [
      'c1',
    ],
    title: 'Rubber wristband',
    price: 50,
    imageUrl:
        'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/72/998822/1.jpg?7745',
  ),
  product(
    id: 'm4',
    categories: [
      'c1',
    ],
    title: 'Glowing wristband',
    price: 80,
    imageUrl:
        'https://www.wristband.com/getmedia/b119b279-77d9-423c-bd1c-689aa9e4deeb/B3G-23-Green-Glow-in-Dark_SU.jpg.aspx?width=1500&height=900&ext=.jpg',
  ),
  product(
    id: 'm5',
    categories: ['c3'],
    title: 'Conference Socks',
    price: 70,
    imageUrl:
        'https://wwws.dior.com/couture/ecommerce/media/catalog/product/cache/1/cover_image_1/870x580/17f82f742ffe127f42dca9de82fb58b1/G/9/1635929114_14SOC503A203_C520_E01_ZHC.jpg?imwidth=870',
  ),
  product(
    id: 'm6',
    categories: [
      'c4',
    ],
    title: 'Conference cap',
    price: 80,
    imageUrl:
        'https://4.imimg.com/data4/GL/TU/MY-13230786/colorfull-caps-500x500.jpg',
  ),
  product(
    id: 'm7',
    categories: [
      'c5',
    ],
    title: 'Keychain',
    price: 20,
    imageUrl:
        'https://www.tradeinn.com/f/13816/138166482/belkin-f8w973btblu-secure-holder-keychain-for-airtag.jpg',
  ),
  product(
    id: 'm8',
    categories: [
      'c6',
    ],
    title: 'Conference Sticker',
    price: 90,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/51FhJIF7h-L.__AC_SX300_SY300_QL70_FMwebp_.jpg',
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
