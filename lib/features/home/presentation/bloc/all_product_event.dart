
part of 'all_product_bloc.dart';

abstract class AllProductEvent extends Equatable {
  const AllProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends AllProductEvent {}

class SearchProductsEvent extends AllProductEvent {
  final String query;

  const SearchProductsEvent(this.query);

  @override
  List<Object> get props => [query];
}

class FilterProductsByCategoryEvent extends AllProductEvent {
  final int categoryId;

  const FilterProductsByCategoryEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class LoadMoreProductsEvent extends AllProductEvent {}
