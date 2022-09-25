import 'package:flutter/material.dart';
import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        CartScreen.routeName: (_) => const CartScreen(),
        OrdersScreen.routeName: (_) => const OrdersScreen(),
        UserProductScreen.routeName: (_) => const UserProductScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(
                ProductsManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
      home: const ProductOverviewScreen(),
    );
  }
}
