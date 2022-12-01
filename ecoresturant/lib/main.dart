import 'package:ecoresturant/screens/cart_screen.dart';
import 'package:ecoresturant/screens/home_screen.dart';
import 'package:ecoresturant/screens/item_details_screen.dart';
import 'package:ecoresturant/services/item_bloc/item_bloc.dart';
import 'package:ecoresturant/services/repository/category_repository.dart';
import 'package:ecoresturant/services/repository/item_repository.dart';
import 'package:ecoresturant/services/service/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/category_bloc/category_bloc.dart';

void main() {
  Bloc.observer = EcoRestaurentBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository?>(
          create: (context) => CategoryRepository(),
        ),
        RepositoryProvider<ItemRepository?>(
          create: (context) => ItemRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(
                RepositoryProvider.of<CategoryRepository>(context)),
          ),
          BlocProvider<ItemBloc>(
            create: (context) =>
                ItemBloc(RepositoryProvider.of<ItemRepository>(context)),
          ),
        ],
        child: MaterialApp(
          title: "",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const CartScreen(),
        ),
      ),
    );
  }
}
