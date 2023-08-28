import 'package:colistracking/screens/detail/bloc/detail_event.dart';
import 'package:colistracking/screens/detail/bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState()) {
    //chargement de l'ecran de detail
    on<DetailEvent>((event, emit) {
      emit(DetailState());
    });
  }
}
