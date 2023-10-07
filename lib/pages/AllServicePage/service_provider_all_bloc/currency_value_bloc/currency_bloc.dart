import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<UpdateCurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyState(value: 'PKR')) {
    on<UpdateCurrencyEvent>((event, emit) {
      emit(CurrencyState(value: event.value));
    });
  }
}
