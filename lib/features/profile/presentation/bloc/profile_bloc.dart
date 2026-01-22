import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileBloc({required this.profileUseCase}) : super(ProfileInitial());

  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
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