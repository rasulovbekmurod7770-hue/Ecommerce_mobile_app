import 'package:clothing_app_ui/features/home/categories/model/categories_model.dart';

abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError({required this.message});
}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoriesModel> categories;

  CategoriesLoaded({required this.categories});
}


