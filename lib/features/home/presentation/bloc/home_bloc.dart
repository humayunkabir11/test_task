
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/home_data-response_model.dart';
import '../../domain/usecase/get_home_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeDataResponseModel? _originalHomeData;

  HomeBloc({required this.getHomeDataUseCase}) : super(HomeInitial()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
    on<SearchProductsEvent>(_onSearchProducts);
    on<LoadProductsEvent>(_onLoadProducts);
  }
  ///------------------------------ home data load--------------------------->
  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await getHomeDataUseCase(NoParams());
    result.fold(
      (failure) => emit(HomeError(message: failure.message ?? "Something went wrong")),
      (data) {
        _originalHomeData = data;
        emit(HomeLoaded(homeData: data));
      },
    );
  }
  ///-------------------------- SEARCH HOME DATA ------------------->
  void _onSearchProducts(
    SearchProductsEvent event,
    Emitter<HomeState> emit,
  ) {
    if (_originalHomeData != null) {
      final filteredProducts = _originalHomeData!.newArrivalProducts?.where((product) {
        return product.name?.toLowerCase().contains(event.query.toLowerCase()) ?? false;
      }).toList();

      final filteredData = HomeDataResponseModel(
        homepageCategories: _originalHomeData!.homepageCategories,
        newArrivalProducts: filteredProducts,
      );
      emit(HomeLoaded(homeData: filteredData));
    }
  }

  void _onLoadProducts(
    LoadProductsEvent event,
    Emitter<HomeState> emit,
  ) {
    if (_originalHomeData != null) {
      emit(HomeLoaded(homeData: _originalHomeData!));
    }
  }
}