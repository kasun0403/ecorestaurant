import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/screens/item_details_screen.dart';
import 'package:ecoresturant/services/item_bloc/item_bloc.dart';
import 'package:ecoresturant/services/model/category_model.dart';
import 'package:ecoresturant/widgets/item_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategortItemsScreen extends StatefulWidget {
  final CategoryModel? singleCategory;
  final ItemBloc? itemBloc;
  const CategortItemsScreen({super.key, this.singleCategory, this.itemBloc});

  @override
  State<CategortItemsScreen> createState() => _CategortItemsScreenState();
}

class _CategortItemsScreenState extends State<CategortItemsScreen> {
  @override
  void initState() {
    widget.itemBloc!.add(GetItemsBycategoryId(widget.singleCategory!.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          widget.singleCategory!.name,
          style: const TextStyle(
            color: AppColors.kblueColor,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            height: 10,
            thickness: 10,
          ),
          GestureDetector(onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemDetailsScreen(),
                ));
          }, child: BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
              if (state is ItemByCategoryLoaded) {
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
}
