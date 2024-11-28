import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart"), backgroundColor: const Color.fromARGB(156, 191, 87, 122),),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final totalBalance = state.totalCost; // Calculate the total cost
          return Column(
            children: [
              // Display the total balance at the top
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Your Total: \$${totalBalance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ListTile(
                      leading: Image.asset(product.imageUrl),
                      title: Text(product.name),
                      subtitle: Text("\$${product.price}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          // Remove item from the cart
                          context.read<CartBloc>().add(RemoveItem(product));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
