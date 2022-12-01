import 'package:ecoresturant/constants/app_colors.dart';
import 'package:ecoresturant/widgets/count_buttton.dart';
import 'package:flutter/material.dart';

class PriceAndAmountSubWidget extends StatefulWidget {
  const PriceAndAmountSubWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PriceAndAmountSubWidget> createState() =>
      _PriceAndAmountSubWidgetState();
}

class _PriceAndAmountSubWidgetState extends State<PriceAndAmountSubWidget> {
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
      children: [
        Text(
          getTotal().toStringAsFixed(2),
          style: const TextStyle(
              color: AppColors.kblueColor,
              fontSize: 25,
              fontWeight: FontWeight.w800),
        ),
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
              isAdd: true,
              rightPadding: 0,
              onTap: () {
                setState(() {
                  amount++;
                });
              },
            )
          ],
        )
      ],
    );
  }
}
