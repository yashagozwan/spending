import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending/core/constants/image_asset_path.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_bloc.dart';
import 'package:spending/presentation/screens/connection/bloc/connection_event.dart';
import 'package:spending/presentation/screens/sync/bloc/sync_bloc.dart';
import 'package:spending/presentation/screens/sync/bloc/sync_event.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ConnectionBloc>().add(ConnectionSetContext(context: context));
    context.read<SyncBloc>().add(SyncStarted(context: context));

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(ImageAssetPath.syncFolder),
              ),
              const SizedBox(height: 16),
              const LinearProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Sync',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const Text(
                'Data is being fetched from cloud please wait.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
