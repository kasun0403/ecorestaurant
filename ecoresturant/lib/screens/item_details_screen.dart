import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.kblueColor,
            )),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: const Image(
              image: AssetImage(Designs.foodImg),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.65,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Divider(
                        endIndent: size.width * 0.4,
                        indent: size.width * 0.4,
                        thickness: 5,
                      ),
                    ),
                    nameFavSection(),
                    const SizedBox(height: 16),
                    unitTypeSection(),
                    const SizedBox(height: 16),
                    priceAndCountSection(),
                    const Divider(thickness: 2),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Rs 950.00",
                          style: TextStyle(
                              color: AppColors.kblueColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Duis proident labore aliquip eiusmod proident exercitation nulla esse",
                          style: TextStyle(
                              color: AppColors.kblueColor.withOpacity(0.5),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: size.width,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.2,
                          vertical: size.height / 60),
                      decoration: BoxDecoration(
                          color: AppColors.kTanColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                            color: AppColors.kwhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget priceAndCountSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Rs 950.00",
          style: TextStyle(
              color: AppColors.kblueColor,
              fontSize: 25,
              fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  color: AppColors.kwhiteColor),
              child: const Icon(
                Icons.remove,
                color: AppColors.kblueColor,
              ),
            ),
            const Text(
              "1",
              style: TextStyle(
                  color: AppColors.kblueColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 16),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  color: AppColors.kTanColor),
              child: const Icon(
                Icons.add,
                color: AppColors.kwhiteColor,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget unitTypeSection() {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.kTanColor),
          child: const Text(
            "M",
            style: TextStyle(
                color: AppColors.kwhiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.kTanColor),
          child: const Text(
            "M",
            style: TextStyle(
                color: AppColors.kwhiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
  }

  Widget nameFavSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Chicken Pizza",
          style: TextStyle(
              color: AppColors.kblueColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: const Image(
            image: AssetImage(Designs.favoriteFillImg),
            height: 25,
          ),
        ),
      ],
    );
  }
}
