
import 'package:equatable/equatable.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDetailsEvent extends ProductDetailsEvent {
  final String slug;

  const LoadProductDetailsEvent(this.slug);

  @override
  List<Object> get props => [slug];
}
