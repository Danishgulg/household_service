import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service_provider_all_bloc/services.dart/service_bloc.dart';
import 'services_state_widgets.dart';

class ServiceAllStatesWidget extends StatelessWidget {
  const ServiceAllStatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceBloc serviceBloc = context.read<ServiceBloc>();
    return BlocBuilder<ServiceBloc, ServiceState>(
      bloc: serviceBloc,
      builder: (context, state) {
        if (state is ServiceInitialState) {
          return const InitialStateWidget();
        } else if (state is ServiceLoadingState) {
          return const LoadingStateWidget();
        } else if (state is ServiceLoadedState) {
          return LoadedStateWidget(services: state.services);
        } else {
          return ErrorStateWidget(error: (state as ServiceErrorState).error);
        }
      },
    );
  }
}
