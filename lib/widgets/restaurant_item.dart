import "package:flutter/material.dart";
import "package:restaurant_app_dicoding/model/restaurant.dart";
import "package:restaurant_app_dicoding/view/restaurant_detail_page.dart";

Widget buildRestaurantItem(BuildContext context, Restaurant restaurant){
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, RestaurantDetailPage.routeName, arguments: restaurant);
    },
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              restaurant.pictureId,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error))
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    restaurant.name,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(restaurant.city),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text(restaurant.rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}