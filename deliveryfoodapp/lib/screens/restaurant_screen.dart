import 'package:deliveryfoodapp/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {

  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           Stack(
             children: [
               Image(image: AssetImage(widget.restaurant.imageUrl),)
             ],
           )
         ],
       ),
    );
  }
}