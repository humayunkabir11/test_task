
part of 'all_product_bloc.dart';

abstract class AllProductState extends Equatable {
  const AllProductState();

  @override
  List<Object> get props => [];
}

class AllProductInitial extends AllProductState {}

class AllProductLoading extends AllProductState {}

class AllProductLoaded extends AllProductState {
  final List<ProductModel> products;
  final bool hasReachedMax;

  const AllProductLoaded({
    required this.products,
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [products, hasReachedMax];
}

class AllProductError extends AllProductState {
  final String message;

  const AllProductError({required this.message});

  @override
  List<Object> get props => [message];
}
