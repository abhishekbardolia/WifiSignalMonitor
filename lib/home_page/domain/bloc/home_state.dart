part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}
class HomeInitial extends HomeState{}
class ItemsLoading extends HomeState {}
class ItemsLoaded extends HomeState {
  final List<String> items;
  ItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}
class ItemsError extends HomeState {}