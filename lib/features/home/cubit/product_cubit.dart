import 'package:clothing_app_ui/features/home/cubit/product_state.dart';
import 'package:clothing_app_ui/features/home/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  
  ProductCubit() : super(const ProductInit());

  Future<void> getProducts() async {
    emit(const ProductsLoading());
    try {
      final products = await ProductRepo().getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
      print("error is here ${e.toString()}");
    }
  }
}