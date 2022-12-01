import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:ecoresturant/screens/cart_screen.dart';
import 'package:ecoresturant/screens/category_Items_screen.dart';
import 'package:ecoresturant/screens/item_details_screen.dart';
import 'package:ecoresturant/services/category_bloc/category_bloc.dart';
import 'package:ecoresturant/services/item_bloc/item_bloc.dart';
import 'package:ecoresturant/widgets/item_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  late ItemBloc itemBloc;

  @override
  void initState() {
    super.initState();
    CategoryBloc categoryBloc = BlocProvider.of<CategoryBloc>(context);
    // categoryBloc.add(const GetAllCategories());
    itemBloc = BlocProvider.of<ItemBloc>(context);
    // itemBloc.add(const GetAllItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dashboardSearch(),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
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
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is AllCategoryLoaded) {
                      final category = state.categories;
                      return Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, index) {
                            var singleCategory = category[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategortItemsScreen(
                                        singleCategory: singleCategory,
                                        itemBloc: itemBloc,
                                      ),
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
                                    CachedNetworkImage(
                                      imageUrl: singleCategory!.image,
                                      imageBuilder: (context, imageProvider) =>
                                          Image(
                                        image: imageProvider,
                                        // NetworkImage(imageProvider),
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        height: 20,
                                      ),
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                        child: Center(
                                          heightFactor: 10,
                                          widthFactor: 10,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      singleCategory.name,
                                      style: const TextStyle(
                                          color: AppColors.kwhiteColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(
            height: 10,
            thickness: 10,
          ),
          GestureDetector(onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(),
                ));
          }, child: BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
              if (state is AllItemLoaded) {
                final items = state.items;
                return SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        var singleItem = items[index];
                        return ItemTileWidget(
                          dishName: singleItem!.name,
                          image: singleItem.image,
                          price: singleItem.price.toString(),
                          discription: singleItem.description,
                          category: singleItem.categotyName,
                        );
                      },
                    ));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
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
