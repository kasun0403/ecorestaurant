import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/constants/images.dart';
import 'package:ecoresturant/widgets/count_buttton.dart';
import 'package:flutter/material.dart';

class CartItemSubWidget extends StatefulWidget {
  const CartItemSubWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CartItemSubWidget> createState() => _CartItemSubWidgetState();
}

class _CartItemSubWidgetState extends State<CartItemSubWidget> {
  List newData = ["asdas", "asdsad", "asds"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.72,
      child: ListView.builder(
        itemCount: newData.length,
        itemBuilder: (context, index) {
          final data = newData[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
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
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        newData.removeAt(index);
                                      });
                                    },
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
                              CounterWidget(),
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

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int amount = 1;
  double total = 00;
  double priceUnit = 50.00;

  double getTotal() {
    setState(() {
      total = amount.toDouble() * priceUnit.toDouble();
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CountButtonWidget(
              rightPadding: 16,
              isAdd: false,
              onTap: () {
                setState(() {
                  amount > 1 ? amount-- : amount = 1;
                });
              },
            ),
            Text(
              "$amount",
              style: const TextStyle(
                  color: AppColors.kblueColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            CountButtonWidget(
              rightPadding: 16,
              isAdd: true,
              onTap: () {
                setState(() {
                  amount++;
                });
              },
            ),
          ],
        ),
        Text(
          getTotal().toStringAsFixed(2),
          style: const TextStyle(
              color: AppColors.kblueColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
