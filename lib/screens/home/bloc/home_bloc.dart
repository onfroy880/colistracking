import 'package:colistracking/screens/home/bloc/home_event.dart';
import 'package:colistracking/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(data: [])) {
    //chargement de l'ecran d'acceuil
    on<HomeEvent>((event, emit) {
      emit(HomeState(data: state.data));
    });
    //rafraichissement de l'ecran d'acceuil
    on<HomeEventReload>((event, emit) {
      state.data = [
        {
          "trackinkNumber": "TR123456",
          "status": "En cours de traitement",
          "location": "Entrepot A",
          "history": [
            {"status": "Enregistre", "timestamp": "2023-08-28T10:00:00"},
            {
              "status": "En cours de traitement",
              "timestamp": "2023-08-28T14:00:00"
            }
          ]
        },
        {
          "trackinkNumber": "TR789012",
          "status": "En cours de traitement",
          "location": "Entrepot A",
          "history": [
            {"status": "Enregistre", "timestamp": "2023-08-28T10:00:00"},
            {
              "status": "En cours de traitement",
              "timestamp": "2023-08-28T14:00:00"
            }
          ]
        },
        {
          "trackinkNumber": "TR345678",
          "status": "En cours de traitement",
          "location": "Entrepot A",
          "history": [
            {"status": "Enregistre", "timestamp": "2023-08-28T10:00:00"},
            {
              "status": "En cours de traitement",
              "timestamp": "2023-08-28T14:00:00"
            }
          ]
        }
      ];
      emit(HomeState(data: state.data));
    });
  }
}
