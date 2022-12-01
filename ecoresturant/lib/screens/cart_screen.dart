import 'package:ecoresturant/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'item_details_and_cart_screen_widgets/cart_item_sub_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kwhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kwhiteColor,
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
      body: Column(
        children: [
          const CartItemSubWidget(),
          const Divider(height: 10, thickness: 10),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: AppColors.kblueColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Rs 950.00",
                      style: TextStyle(
                          color: AppColors.kblueColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: size.width,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.2, vertical: size.height / 50),
                decoration: BoxDecoration(
                    color: AppColors.kTanColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Place order",
                  style: TextStyle(
                      color: AppColors.kwhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
