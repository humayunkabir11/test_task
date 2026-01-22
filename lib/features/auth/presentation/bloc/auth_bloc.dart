import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../../core/config/routes/route_path.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../../../core/network/api_cancel_manager.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_keys.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../../../core/utils/dev_log.dart';
import '../../../../core/utils/show_toast.dart';
import '../../data/models/auth_data.dart';
import '../../data/models/role_model.dart';
import '../../domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;
  AuthBloc({required this.authUseCase}) : super(AuthInitial()) {
    on<SelectRoleEvent>(_onSelectRole);
    on<LoginEvent>(_onLogin);
  }

  void _onSelectRole(SelectRoleEvent event, Emitter<AuthState> emit) {
    emit(AuthRoleSelected(event.role));
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());

    try {
      /// Reset any previous API calls
      ApiCancelManager.reset();

      /// Reset auth interceptor
      sl<ApiClient>().authInterceptor.reset();

      final result = await authUseCase.login(event.params);

      await result.fold(
        (failure) async {
          showToast(message: failure.message ?? "Something went wrong");
          emit(LoginErrorState(message: failure.message));
        },
        (success) async {
          await sl<SecureStorageService>().write(
            SecureKeys.accessToken,
            success.data?.accessToken ?? "",
          );
          emit(LoginSuccessState(authData: success.data));
          AppRoute.router.goNamed(RoutePath.mainPage);
        },
      );
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
      devLog(tag: "Login", payload: {"err": e.toString()});
    }
  }
}
