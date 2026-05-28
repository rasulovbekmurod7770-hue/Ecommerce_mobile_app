import 'package:clothing_app_ui/features/product%20page/model/products_model.dart';

abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsError extends ProductsState {
  final String message;

  ProductsError({required this.message});
}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductsLoaded({required this.products});
}
