import 'package:flutter/material.dart';
import 'package:restaurant_app_dicoding/model/restaurant.dart';
import 'package:restaurant_app_dicoding/widgets/restaurant_item.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = "/restaurant-list";

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Restaurant",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Recommendation restaurant for you!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/json/local_restaurant.json"),
                  builder: (context, snapshot) {
                    final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        return buildRestaurantItem(context, restaurants[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

