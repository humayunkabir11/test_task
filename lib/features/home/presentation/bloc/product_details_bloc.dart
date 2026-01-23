
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_product_details_usecase.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  ProductDetailsBloc({
    required GetProductDetailsUseCase getProductDetailsUseCase,
  })  : _getProductDetailsUseCase = getProductDetailsUseCase,
        super(ProductDetailsInitial()) {
    on<LoadProductDetailsEvent>(_onLoadProductDetails);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());
    final result = await _getProductDetailsUseCase(event.slug);
    result.fold(
      (failure) => emit(ProductDetailsError(failure.message ?? "An error occurred")),
      (data) => emit(ProductDetailsLoaded(data)),
    );
  }
}
