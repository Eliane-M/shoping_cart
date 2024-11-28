import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';
import 'product.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(name: "Dove Lotion", price: 20.0, imageUrl: "images/lotion.jpg"),
    Product(name: "Dove soap bar", price: 10.0, imageUrl: "images/original_soap.jpg"),
    Product(name: "Dove Antiperspirant", price: 15.0, imageUrl: "images/antiperspirant.jpg"),
    Product(name: "Dove soap bar for sensitive skin", price: 11.0, imageUrl: "images/sensitive_skin.jpg"),
    Product(name: "Dove Shower Gel", price: 13.5, imageUrl: "images/shower_gel.jpg"),
    Product(name: "Dove Spray", price: 15.0, imageUrl: "images/spray.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dove Products in Store"), backgroundColor: const Color.fromARGB(156, 191, 87, 122),),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.asset(product.imageUrl),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<CartBloc>().add(AddItem(product));
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
      ),
    );
  }
}
