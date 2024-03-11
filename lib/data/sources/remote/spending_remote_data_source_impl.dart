import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/data/sources/local/user_local_data_source.dart';
import 'package:spending/data/sources/remote/spending_remote_data_source.dart';
import 'package:spending/domain/models/spending/spending_model.dart';

@LazySingleton(as: SpendingRemoteDataSource)
class SpendingRemoteDataSourceImpl implements SpendingRemoteDataSource {
  final FirebaseFirestore _firestore;
  final Logger _logger;

  SpendingRemoteDataSourceImpl(
    this._firestore,
    this._logger,
  );

  CollectionReference get collection => _firestore.collection('spending');

  @override
  Future<List<SpendingModel>> findAll(String userId) async {
    try {
      final snapshot = await collection.where('user_id', isEqualTo: userId).get();
      return snapshot.docs
          .map((e) => SpendingModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Find all spending failed");
    }
  }

  @override
  Future<SpendingModel> findOne(String id) async {
    try {
      final snapshot = await collection.doc(id).get();
      final data = snapshot.data();
      return SpendingModel.fromJson(data as Map<String, dynamic>);
    } catch (_) {
      throw Exception('Find one spending failed');
    }
  }

  @override
  Future<SpendingModel> insertOne(SpendingModel spending) async {
    try {
      final docRef = await collection.add(spending.toJson());
      final snapshot = await docRef.get();
      final data = SpendingModel.fromJson(
        snapshot.data() as Map<String, dynamic>,
      ).copyWith(id: docRef.id);
      await docRef.update(data.toJson());
      return data;
    } catch (_) {
      throw Exception('Insert one spending failed');
    }
  }

  @override
  Future<bool> removeOne(SpendingModel spending) async {
    try {
      await collection.doc(spending.id).delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateOne(SpendingModel spending) async {
    try {
      await collection.doc(spending.id).update(spending.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }
}
