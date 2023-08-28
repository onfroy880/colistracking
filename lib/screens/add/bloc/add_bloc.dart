import 'package:colistracking/screens/add/bloc/add_event.dart';
import 'package:colistracking/screens/add/bloc/add_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddState()) {
    //chargement de l'ecran d'ajout
    on<AddEvent>((event, emit) {
      AddState();
    });
  }
}
