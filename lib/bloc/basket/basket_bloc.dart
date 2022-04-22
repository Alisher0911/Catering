import 'package:bloc/bloc.dart';
import 'package:catering/models/basket_model.dart';
import 'package:catering/models/menu_item_model.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>((event, emit) async {
      emit(BasketLoading());
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(BasketLoaded(basket: Basket()));
      } catch (_) {}
    });

    on<AddItem>((event, emit) => _mapAddItemToState(event, emit));

    on<RemoveItem>((event, emit) => _mapRemoveItemToState(event, emit));

    on<RemoveAllItem>((event, emit) => _mapRemoveAllItemToState(event, emit));

    on<ToggleSwitch>((event, emit) => _mapToggleSwitchToState(event, emit));
  }



  void _mapAddItemToState(AddItem event, Emitter<BasketState> emit) async {
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(basket: (state as BasketLoaded).basket.copyWith(items: List.from((state as BasketLoaded).basket.items)..add(event.item))));
      } catch (_) {}
    }
  }

  void _mapRemoveItemToState(RemoveItem event, Emitter<BasketState> emit) async {
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(basket: (state as BasketLoaded).basket.copyWith(items: List.from((state as BasketLoaded).basket.items)..remove(event.item))));
      } catch (_) {}
    }
  }

  void _mapRemoveAllItemToState(RemoveAllItem event, Emitter<BasketState> emit) async {
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(basket: (state as BasketLoaded).basket.copyWith(items: List.from((state as BasketLoaded).basket.items)..removeWhere((item) => item == event.item))));
      } catch (_) {}
    }
  }

  void _mapToggleSwitchToState(ToggleSwitch event, Emitter<BasketState> emit) async {
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(basket: (state as BasketLoaded).basket.copyWith(
          cutlery: !(state as BasketLoaded).basket.cutlery
        )));
      } catch (_) {}
    }
  }

  // @override
  // Stream<BasketState> mapEventToState(BasketEvent event) async* {
  //   if (event is StartBasket) {
  //     yield* _mapStartBasketToState();
  //   } else if (event is AddItem) {
  //     yield* _mapAddItemToState(event, state);
  //   } else if (event is RemoveItem) {
  //     yield* _mapRemoveItemToState(event, state);
  //   } else if (event is ToggleSwitch) {
  //     yield* _mapToggleSwitchToState(event, state);
  //   }
  // }


  // Stream<BasketState> _mapStartBasketToState() async* {
  //   yield BasketLoading();
  //   try {
  //     await Future<void>.delayed(const Duration(seconds: 1));
  //     yield BasketLoaded(basket: Basket());
  //   } catch (_) {}
  // }

  // Stream<BasketState> _mapAddItemToState(AddItem event, BasketState state) async* {
  //   if (state is BasketLoaded) {
  //     try {
  //       yield BasketLoaded(basket: state.basket.copyWith(items: List.from(state.basket.items)..add(event.item)));
  //     } catch (_) {}
  //   }
  // }

  // Stream<BasketState> _mapRemoveItemToState(RemoveItem event, BasketState state) async* {
  //   if (state is BasketLoaded) {
  //     try {
  //       yield BasketLoaded(basket: state.basket.copyWith(items: List.from(state.basket.items)..remove(event.item)));
  //     } catch (_) {}
  //   }
  // }

  // Stream<BasketState> _mapToggleSwitchToState(ToggleSwitch event, BasketState state) async* {
  //   if (state is BasketLoaded) {
  //     try {
  //       yield BasketLoaded(basket: state.basket.copyWith(
  //         cutlery: !state.basket.cutlery
  //       ));
  //     } catch (_) {}
  //   }
  // }
}
