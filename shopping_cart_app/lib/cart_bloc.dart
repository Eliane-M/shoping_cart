import 'package:bloc/bloc.dart';
import 'product.dart';

// CartState
abstract class CartEvent {}

class AddItem extends CartEvent {
  final Product product;

  AddItem(this.product);
}

class RemoveItem extends CartEvent {
  final Product product;

  RemoveItem(this.product);
}

// CartState
class CartState {
  final List<Product> products;

  CartState({this.products = const []});

  double get totalCost =>
      products.fold(0, (total, current) => total + current.price);
}

// CartBloc
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddItem>((event, emit) {
      emit(CartState(products: List.from(state.products)..add(event.product)));
    });

    on<RemoveItem>((event, emit) {
      emit(CartState(products: List.from(state.products)..remove(event.product)));
    });
  }
}
