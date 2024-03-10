import 'package:flutter/material.dart' show Navigator, MaterialPageRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/core/services/connection_service.dart';
import 'package:spending/core/services/connection_status_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_state.dart';
import 'package:spending/presentation/screens/connection/connection_screen.dart';

@lazySingleton
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final ConnectionService _connectionService;

  ConnectionBloc(
    @Named.from(ConnectionServiceImpl) this._connectionService,
  ) : super(const ConnectionState()) {
    on<ConnectionInitial>(_initial);
    on<ConnectionSetContext>(_setContext);
    on<ConnectionDestroy>(_destroy);
  }

  void _initial(ConnectionInitial event, Emitter<ConnectionState> emit) {
    emit(state.copyWith(context: event.context));

    _connectionService.status.listen((value) {
      if (!value) {
        Toast.show("Sorry you are offline", isError: true);

        final context = state.context;

        if (context == null) {
          return Toast.show('Context is not initialized', isError: true);
        }

        if (!context.mounted) {
          return Toast.show('Context not mounted', isError: true);
        }

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ConnectionScreen();
            },
          ),
          (route) => false,
        );
      } else {
        Toast.show("Now it's back online");
      }
    });
  }

  void _setContext(ConnectionSetContext event, Emitter<ConnectionState> emit) {
    emit(state.copyWith(context: event.context));
  }

  void _destroy(ConnectionDestroy event, Emitter<ConnectionState> emit) {
    _connectionService.destroy();
  }
}
