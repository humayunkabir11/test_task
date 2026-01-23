
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/home_data-response_model.dart';
import '../../domain/usecase/get_home_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeBloc({required this.getHomeDataUseCase}) : super(HomeInitial()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await getHomeDataUseCase(NoParams());
    result.fold(
      (failure) => emit(HomeError(message: failure.message ?? "Something went wrong")),
      (data) => emit(HomeLoaded(homeData: data)),
    );
  }
}