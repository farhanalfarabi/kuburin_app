import 'package:flutter/material.dart';
import 'package:kuburin_app/models/models.dart';

final List<HairStylist> hairStylist = [
  HairStylist(
    'Pemakaman Umum',
    'Sederhana Namun Bermakna',
    4.8,
    'assets/images/13.png',
    const Color(0xFFFFF0EB),
  ),
  HairStylist(
    'Pemakaman VIP',
    'Pemakaman Terpopuler',
    4.7,
    'assets/images/5.png',
    const Color(0xFFEBF6FF),
  ),
  HairStylist(
    'Pemakaman VVIP',
    'Khusus non muslim',
    4.9,
    'assets/images/9.png',
    const Color(0xFFEBFFED),
  )
];

final List<ServiceList> servicesList = [
  ServiceList('Silver', 'Hanya Pemakaman', 200),
  ServiceList('Gold', 'Paket mandi, kafan dan pemakaman', 300),
  ServiceList(
      'Platinum', 'Paket mandi, kafan, pemakaman dan pemeliharaan', 500),
];
