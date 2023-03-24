import 'package:flutter/material.dart';

import './models/category.dart';
import './models/comic.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: 'c9',
    title: 'All',
    color: Colors.yellow,
  ),
  Category(
    id: 'c1',
    title: 'Spooky',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Fighting',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Adventure',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Historic',
    color: Colors.amber,
  ),
  Category(
    id: 'c6',
    title: 'Cartoon',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Sea travels',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Game-like',
    color: Colors.lightGreen,
  ),
];

const DUMMY_COMICS =  [
  Comic(
    id: 'm1',
    chapter: 1,
    categories: [
      'c1',
      'c2',
      'c9',
    ],
    title: 'Batman',
    imageUrl: 'https://i0.wp.com/thenerdhoard.com/wp-content/uploads/2022/05/batman-comic-covers-6.webp?resize=400%2C587&ssl=1',
  ),
  Comic(
      id: 'm2',
      chapter: 1,
      categories: [
        'c2',
        'c9',
      ],
      title: 'Spider-man',
      imageUrl: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2017%2F07%2F18_amazing-spider-man-70-john-romita-sr-1969-2000.jpg',
  ),
  Comic(
      id: 'm3',
      chapter: 1,
      categories: [
        'c5',
        'c9',
      ],
      title: 'Superman',
      imageUrl: 'https://d29xot63vimef3.cloudfront.net/image/superman/201-1.jpg',
  ),
  Comic(
      id: 'm4',
      chapter: 1,
      categories: [
        'c4',
        'c9',
      ],
      title: 'Naruto',
      imageUrl: 'https://i.pinimg.com/originals/8f/ee/98/8fee98fb2296d70ddd247a3a0195d7a1.jpg'
  ),
  Comic(
      id: 'm5',
      chapter: 2,
      categories: [
        'c6',
        'c9',
      ],
      title: 'Naruto',
      imageUrl: 'https://i.pinimg.com/originals/3f/3b/fe/3f3bfe56a521f53daa52470ee80c7f33.jpg',
  ),
  Comic(
      id: 'm6',
      chapter: 1,
      categories: [
        'c3',
        'c5',
        'c9',
      ],
      title: 'Dragon ball',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c9/DB_Tank%C5%8Dbon.png'
  ),
  Comic(
      id: 'm7',
      chapter: 1,
      categories: [
        'c3',
        'c7',
        'c9',
      ],
      title: 'Avatar The Last Airbender',
      imageUrl: 'https://i.pinimg.com/474x/1a/7c/ed/1a7ced02806b06aed00e1635fcd94e46.jpg'
  ),
  Comic(
      id: 'm8',
      chapter: 1,
      categories: [
        'c8',
        'c9',
      ],
      title: 'Death note',
      imageUrl: 'https://static.wikia.nocookie.net/deathnote/images/6/60/How_to_Read_13.jpg/revision/latest?cb=20160531004943'
  ),
  Comic(
      id: 'm9',
      chapter: 1,
      categories: [
        'c9',
        'c4',
        'c9',
      ],
      title: 'Baki',
      imageUrl: 'http://st.cdjapan.co.jp/pictures/l/00/09/NEOBK-2707287.jpg'
  ),
  Comic(
      id: 'm10',
      chapter: 1,
      categories: [
        'c1',
        'c2',
        'c9',
      ],
      title: 'JoJo Bizarre Adventures',
      imageUrl: 'https://i.pinimg.com/originals/fa/25/21/fa2521bc0824d46cfedd394b8395d5f2.jpg'
  ),
  Comic(
      id: 'm11',
      chapter: 1,
      categories: [
        'c5',
        'c6',
        'c9',
      ],
      title: 'AOT',
      imageUrl: 'https://i.pinimg.com/236x/16/cd/ea/16cdead23629f526f975f8e3001a1dc8.jpg'
  ),
];
