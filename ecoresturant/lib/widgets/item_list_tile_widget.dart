import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:flutter/material.dart';

class ItemTileWidget extends StatelessWidget {
  final String? image;
  final String? dishName;
  final String? discription;
  final String? category;
  final String? price;
  const ItemTileWidget({
    super.key,
    this.image,
    this.dishName,
    this.discription,
    this.category,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.kwhiteColor,
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(3, 4),
              ),
            ]),
        child: Card(
          shadowColor: AppColors.kwhiteColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(Designs.foodImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: const Image(
                                image: AssetImage(Designs.favoriteImg),
                                height: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          "Chicken Club Sandwitch",
                          style: TextStyle(
                              color: AppColors.kblueColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          maxLines: 2,
                          "Duis proident labore aliquip eiusmod proident exercitation nulla esse",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.kblueColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Main Dish",
                              style: TextStyle(
                                  color: AppColors.kblueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Rs 900.00",
                              style: TextStyle(
                                  color: AppColors.kblueColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
