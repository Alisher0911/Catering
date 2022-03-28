import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant-listing';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => RestaurantListingScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RestaurantListing')),
      body: Center(
        child: ElevatedButton(
          child: Text('Location Screen'),
          onPressed: () {
            Navigator.pushNamed(context, "/location");
          },
        ),
      ),
    );
  }
}