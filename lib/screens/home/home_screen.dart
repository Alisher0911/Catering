import 'package:catering/models/category_model.dart';
import 'package:catering/models/promo_model.dart';
import 'package:catering/models/restaurant_model.dart';
import 'package:catering/widgets/category_box.dart';
import 'package:catering/widgets/food_search_box.dart';
import 'package:catering/widgets/promo_box.dart';
import 'package:catering/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Category.categories.length,
                      itemBuilder: ((context, index) {
                        return CategoryBox(
                            category: Category.categories[index]);
                      })),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 125,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Promo.promos.length,
                      itemBuilder: ((context, index) {
                        return PromoBox(promo: Promo.promos[index]);
                      })),
                ),
              ),

              FoodSearchBox(),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Top Rated",
                          style: Theme.of(context).textTheme.headline4))),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(restaurant: Restaurant.restaurants[index]);
                }
              ),
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {},
      ),
      centerTitle: false,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Current Location",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        ),
        Text("Singapore, 1 Shenton Way",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white))
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
