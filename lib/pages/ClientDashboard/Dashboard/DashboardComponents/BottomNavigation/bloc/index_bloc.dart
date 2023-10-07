import 'package:flutter_bloc/flutter_bloc.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<ChangeIndexEvent, ChangedIndexState> {
  IndexBloc() : super(ChangedIndexState(index: 0)) {
    on<ChangeIndexEvent>((event, emit) {
      emit(ChangedIndexState(index: event.index));
    });
  }
}
