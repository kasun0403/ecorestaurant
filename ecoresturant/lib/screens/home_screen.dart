import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:ecoresturant/screens/cart_screen.dart';
import 'package:ecoresturant/screens/category_Items_screen.dart';
import 'package:ecoresturant/screens/item_details_screen.dart';
import 'package:ecoresturant/widgets/item_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dashboardSearch(),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Category",
                  style: TextStyle(
                      color: AppColors.kblueColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CategortItemsScreen(),
                              ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: AppColors.kTanColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Designs.searchSvg,
                                fit: BoxFit.scaleDown,
                                color: AppColors.kwhiteColor,
                              ),
                              const Text(
                                "Category",
                                style: TextStyle(
                                    color: AppColors.kwhiteColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 15,
            thickness: 15,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailsScreen(),
                    ));
              },
              child: const ItemTileWidget()),
        ],
      ),
    );
  }

  Widget dashboardSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ));
              },
              child: const Image(
                image: AssetImage(Designs.cartImg),
                height: 35,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  filled: true,
                  fillColor: AppColors.kwhiteColor,
                  prefixIcon: SvgPicture.asset(
                    Designs.searchSvg,
                    fit: BoxFit.scaleDown,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
