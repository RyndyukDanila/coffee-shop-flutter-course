part of 'menu_bloc.dart';

class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuReady extends MenuState {
  MenuReady({
    required this.menu,
    required this.categoriesList,
  });

  final Map<Category, List<Drink>> menu;
  final List<Category> categoriesList;
}

class MenuError extends MenuState {
  MenuError({
    required this.exception,
  });

  final Object? exception;
}
