import 'package:clothing_app_ui/features/product%20page/cubit/products_state.dart';
import 'package:clothing_app_ui/features/product%20page/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await ProductRepo().getProducts();
      emit(ProductsLoaded(products: products));
      // print("succes");/
    } catch (e) {
      emit(ProductsError(message: e.toString()));
      // print(e.toString());
    }
  }
}