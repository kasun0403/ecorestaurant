import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
          cartItemSection(size),
          const Divider(height: 10, thickness: 10),
          placeOrderSection(size),
        ],
      ),
    );
  }

  Widget placeOrderSection(Size size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
              horizontal: size.width * 0.2, vertical: size.height / 60),
          decoration: BoxDecoration(
              color: AppColors.kTanColor,
              borderRadius: BorderRadius.circular(8)),
          child: const Text(
            "Place order",
            style: TextStyle(
                color: AppColors.kwhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }

  Widget cartItemSection(Size size) {
    return SizedBox(
      height: size.height * 0.72,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
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
                        child: Container(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.close,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Chicken Club Sandwitch",
                                style: TextStyle(
                                    color: AppColors.kblueColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            shape: BoxShape.rectangle,
                                            color: AppColors.kwhiteColor),
                                        child: const Icon(
                                          Icons.remove,
                                          color: AppColors.kblueColor,
                                          size: 20,
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
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            shape: BoxShape.rectangle,
                                            color: AppColors.kTanColor),
                                        child: const Icon(
                                          Icons.add,
                                          color: AppColors.kwhiteColor,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "Rs 950.00",
                                    style: TextStyle(
                                        color: AppColors.kblueColor,
                                        fontSize: 16,
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
        },
      ),
    );
  }
}
