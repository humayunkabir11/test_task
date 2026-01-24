
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/home_data-response_model.dart';
import '../../data/models/product_list_response_model.dart';
import '../../domain/usecase/get_products_usecase.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final GetProductsUseCase getProductsUseCase;

  int _currentPage = 1;
  int _lastPage = 1;
  bool _isFetching = false;
  String? _searchQuery;
  int? _selectedCategoryId;
  List<ProductModel> _products = [];

  AllProductBloc({required this.getProductsUseCase}) : super(AllProductInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<LoadMoreProductsEvent>(_onLoadMoreProducts);
    on<SearchProductsEvent>(_onSearchProducts);
    on<FilterProductsByCategoryEvent>(_onFilterProductsByCategory);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<AllProductState> emit,
  ) async {
    emit(AllProductLoading());
    _currentPage = 1;
    _products = [];
    _searchQuery = null;
    _selectedCategoryId = null;

    final result = await getProductsUseCase(GetProductsParams(page: _currentPage));

    result.fold(
      (failure) => emit(AllProductError(message: failure.message ?? "Something went wrong")),
      (data) {
        _products = data.products?.data ?? [];
        _lastPage = data.products?.lastPage ?? 1;
        emit(AllProductLoaded(products: _products, hasReachedMax: _currentPage >= _lastPage));
      },
    );
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<AllProductState> emit,
  ) async {
    emit(AllProductLoading());
    _currentPage = 1;
    _products = [];
    _searchQuery = event.query;
    _selectedCategoryId = null; /// Reset category when searching or keep it? User said "Category-wise search AND keyword search". Assuming combined or independent. Let's assume independent for now or combined if UI supports it.

    _selectedCategoryId = null; 

    final result = await getProductsUseCase(GetProductsParams(
      page: _currentPage,
      search: _searchQuery,
      categoryId: _selectedCategoryId,
    ));

    result.fold(
      (failure) => emit(AllProductError(message: failure.message ?? "Something went wrong")),
      (data) {
        _products = data.products?.data ?? [];
        _lastPage = data.products?.lastPage ?? 1;
        emit(AllProductLoaded(products: _products, hasReachedMax: _currentPage >= _lastPage));
      },
    );
  }

  Future<void> _onFilterProductsByCategory(
    FilterProductsByCategoryEvent event,
    Emitter<AllProductState> emit,
  ) async {
    emit(AllProductLoading());
    _currentPage = 1;
    _products = [];
    _selectedCategoryId = event.categoryId;
    // _searchQuery = null; // Optionally reset search query

    final result = await getProductsUseCase(GetProductsParams(
      page: _currentPage,
      search: _searchQuery,
      categoryId: _selectedCategoryId,
    ));

    result.fold(
      (failure) => emit(AllProductError(message: failure.message ?? "Something went wrong")),
      (data) {
        _products = data.products?.data ?? [];
        _lastPage = data.products?.lastPage ?? 1;
        emit(AllProductLoaded(products: _products, hasReachedMax: _currentPage >= _lastPage));
      },
    );
  }

  Future<void> _onLoadMoreProducts(
    LoadMoreProductsEvent event,
    Emitter<AllProductState> emit,
  ) async {
    if (_isFetching || _currentPage >= _lastPage) return;
    _isFetching = true;

    final result = await getProductsUseCase(GetProductsParams(
      page: _currentPage + 1,
      search: _searchQuery,
      categoryId: _selectedCategoryId,
    ));

    result.fold(
      (failure) => emit(AllProductError(message: failure.message ?? "Something went wrong")), // Or shows snackbar, but here changing state
      (data) {
        _currentPage++;
        final newProducts = data.products?.data ?? [];
        _products.addAll(newProducts);
        _lastPage = data.products?.lastPage ?? _currentPage;
        emit(AllProductLoaded(products: _products, hasReachedMax: _currentPage >= _lastPage));
      },
    );
    _isFetching = false;
  }
}
