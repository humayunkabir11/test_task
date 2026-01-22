import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/splash_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUseCase splashUseCase;
  SplashBloc({required this.splashUseCase}) : super(SplashInitial());

  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    // if (event is FetchUser) {
    //   yield UserLoading();
    //   try {
    //     final user = await getUserUseCase(event.userId);
    //     yield UserLoaded(user);
    //   } catch (e) {
    //     yield UserError(e.toString());
    //   }
    // }
  }
}