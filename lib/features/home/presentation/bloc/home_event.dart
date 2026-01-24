
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}
class SearchProductsEvent extends HomeEvent {
  final String query;

  const SearchProductsEvent(this.query);

  @override
  List<Object> get props => [query];
}
class LoadProductsEvent extends HomeEvent {}
class LoadHomeDataEvent extends HomeEvent {}