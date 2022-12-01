import 'package:cached_network_image/cached_network_image.dart';
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
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
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
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: "$image",
                  imageBuilder: (context, imageProvider) => Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const SizedBox(
                    child: Center(
                      heightFactor: 10,
                      widthFactor: 10,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                        Text(
                          "$dishName",
                          style: const TextStyle(
                              color: AppColors.kblueColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          maxLines: 2,
                          "$discription",
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.kblueColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$category",
                              style: const TextStyle(
                                  color: AppColors.kblueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "$price",
                              style: const TextStyle(
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
