import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/screens/item_details_screen.dart';
import 'package:ecoresturant/widgets/item_list_tile_widget.dart';
import 'package:flutter/material.dart';

class CategortItemsScreen extends StatefulWidget {
  const CategortItemsScreen({super.key});

  @override
  State<CategortItemsScreen> createState() => _CategortItemsScreenState();
}

class _CategortItemsScreenState extends State<CategortItemsScreen> {
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
        title: const Text(
          "Desert",
          style: TextStyle(
            color: AppColors.kblueColor,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
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
}
