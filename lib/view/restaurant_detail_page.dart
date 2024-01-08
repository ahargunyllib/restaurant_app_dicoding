import 'package:flutter/material.dart';
import 'package:restaurant_app_dicoding/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = "/restaurant-detail";

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Image.network(restaurant.pictureId),
        Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(
                      restaurant.city,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  restaurant.description,
                  softWrap: true,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  "Foods",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: restaurant.menus["foods"]
                        .map<Widget>((food) => Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.restaurant_menu,
                                            size: 120), // Insert food icon
                                        Text(
                                          food["name"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "IDR 15.000",
                                        ),
                                      ])),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Drinks",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: restaurant.menus["drinks"]
                        .map<Widget>((food) => Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.restaurant_menu,
                                            size: 120), // Insert food icon
                                        Text(
                                          food["name"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "IDR 15.000",
                                        ),
                                      ])),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ))
      ],
    )));
  }
}
