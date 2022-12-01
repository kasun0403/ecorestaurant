import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:ecoresturant/screens/item_details_and_cart_screen_widgets/price_and_amount_sub_widget.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int amount = 1;
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
      body: SizedBox(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: const Image(
                image: AssetImage(Designs.foodImg),
                fit: BoxFit.cover,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    height: size.height * 0.8,
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
                          const PriceAndAmountSubWidget(),
                          const Divider(thickness: 2),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                    color: AppColors.kblueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "description Labore exercitation adipisicing occaecatdescription Labore exercitation adipisicing occaecatdescription Labore exercitation adipisicing occaecat velit officia commodo occaecat laboris qui cupidatat veniam fugiat. Veniam laborum cillum anim ullamco qui non aliqua ad veniam velit adipisicing nostrud. Nostrud laborum do est dolore aliquip consequat id. Et ut do minim minim aliqua tempor amet est. Proident excepteur pariatur deserunt cillum velit aliqua incididunt voluptate laborum",
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    height: 1.5,
                                    color:
                                        AppColors.kblueColor.withOpacity(0.5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            alignment: Alignment.center,
                            width: size.width,
                            margin: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.2,
                                vertical: size.height / 50),
                            decoration: BoxDecoration(
                                color: AppColors.kTanColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: AppColors.kwhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
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
