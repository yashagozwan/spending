import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:spending/core/services/notification_service.dart';
import 'package:spending/data/sources/local/spending_local_data_source.dart';
import 'package:spending/data/sources/remote/spending_remote_data_source.dart';
import 'package:spending/domain/models/spending/spending_model.dart';
import 'package:spending/domain/repositories/spending_repository.dart';
import 'package:spending/data/sources/local/user_local_data_source.dart';

@LazySingleton(as: SpendingRepository)
class SpendingRepositoryImpl implements SpendingRepository {
  final SpendingRemoteDataSource _remote;
  final SpendingLocalDataSource _local;
  final UserLocalDataSource _userLocalDataSource;
  final NotificationService _notificationService;

  SpendingRepositoryImpl(
    this._remote,
    this._local,
    this._userLocalDataSource,
    this._notificationService,
  );

  @override
  Future<List<SpendingModel>> findAll() async {
    final spendings = await _local.findAll();
    spendings.sort((b, a) =>
        DateTime.parse(a.createdAt).compareTo(DateTime.parse(b.createdAt)));
    return spendings;
  }

  @override
  Future<List<SpendingModel>> findAllRemote() async {
    await _local.removeAll();
    final userId = (await _userLocalDataSource.getUser())!.id;
    return _remote.findAll(userId);
  }

  @override
  Future<SpendingModel> findOne(String id) {
    return _local.findOne(id);
  }

  @override
  Future<bool> insertOne(SpendingModel spending) async {
    try {
      await _local.insertOne(spending);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> removeOne(SpendingModel spending) async {
    try {
      await _local.removeOne(spending);
      await _remote.removeOne(spending);
      _showNotify(
        title: spending.title,
        body: 'Report successfully deleted',
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateOne(SpendingModel spending) async {
    try {
      await _local.updateOne(spending);
      await _remote.updateOne(spending);
      _showNotify(
        title: spending.title,
        body: 'Report successfully updated',
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  void _showNotify({
    required String title,
    required String body,
  }) {
    _notificationService.showNotification(
      id: Random().nextInt(5000),
      title: title,
      body: body,
    );
  }

  @override
  Future<bool> insertOneNetwork(SpendingModel spending) async {
    try {
      final mSpending = await _remote.insertOne(spending);
      await _local.insertOne(mSpending);
      _showNotify(
        title: spending.title,
        body: 'Report successfully created',
      );
      return true;
    } catch (_) {
      return false;
    }
  }
}
