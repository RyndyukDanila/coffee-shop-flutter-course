import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/models/category.dart';
import 'package:flutter_course/src/features/menu/models/drink.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<LoadMenu>((event, emit) async {
      try {
        emit(MenuLoading());
        final MenuRepository menuRepository = MenuRepository();
        final menu = await menuRepository.getMenu();
        final categoriesList = menu.keys.toList();
        emit(MenuReady(menu: menu, categoriesList: categoriesList));
      } catch (e) {
        emit(MenuError(exception: e));
      }
    });
  }
}
