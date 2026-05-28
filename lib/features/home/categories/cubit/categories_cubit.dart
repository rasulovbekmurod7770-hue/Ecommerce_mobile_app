import 'package:clothing_app_ui/features/home/categories/cubit/categories_state.dart';
import 'package:clothing_app_ui/features/home/categories/repo/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState>{
  CategoriesCubit() : super(CategoriesInitial());

   Future<void> getUsers() async {
    emit(CategoriesLoading());
    try {
      final categories = await CategoriesRepo().getCategories();
      emit(CategoriesLoaded(categories: categories));
      // print("succes");/
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
      // print(e.toString());
    }
  }
}