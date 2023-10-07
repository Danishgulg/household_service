import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/constants/firestore_referances.dart';
import 'package:home_service/pages/AllServicePage/service_provider_all_bloc/services.dart/service_event.dart';
import '../../all_service_composit_widget/modal.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceFetchEvent, ServiceState> {
  ServiceBloc() : super(ServiceInitialState()) {
    on<ServiceFetchEvent>((event, emit) async {
      emit(ServiceLoadingState());
      List<QueryDocumentSnapshot> docs = (await providedServiceColRef
              .orderBy('timeOfPost', descending: true)
              .get())
          .docs;
      List<EmployeeService> serviceList = docs
          .map((doc) =>
              EmployeeService.fromMap(doc.data() as Map<String, dynamic>))
          .toList()
        ..reversed;

      try {
        emit(ServiceLoadedState(services: serviceList));
      } catch (e) {
        emit(ServiceErrorState(error: 'Koi data ni hy!!'));
      }
    });
  }
}
