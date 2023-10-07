part of 'service_bloc.dart';

sealed class ServiceState {}

final class ServiceInitialState extends ServiceState {}

final class ServiceLoadingState extends ServiceState {}

final class ServiceLoadedState extends ServiceState {
  final List<EmployeeService> services;
  ServiceLoadedState({required this.services});
}

final class ServiceErrorState extends ServiceState {
  final String error;
  ServiceErrorState({required this.error});
}
