import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/remote/expense_remote_data_source.dart';
import 'package:spending/domain/models/expense/expense_model.dart';

@LazySingleton(as: ExpenseRemoteDataSource)
class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final FirebaseFirestore _firestore;

  ExpenseRemoteDataSourceImpl(this._firestore);

  CollectionReference get _collection => _firestore.collection('expenses');

  @override
  Future<ExpenseModel> findOne(String id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<ExpenseModel> insertOne(ExpenseModel expense) {
    // TODO: implement insertOne
    throw UnimplementedError();
  }

  @override
  Future<bool> updateOne(ExpenseModel expense) {
    // TODO: implement updateOne
    throw UnimplementedError();
  }

  @override
  Future<bool> removeOne(ExpenseModel expense) {
    // TODO: implement removeOne
    throw UnimplementedError();
  }

  @override
  Future<List<ExpenseModel>> findAll(String userId) {
    // TODO: implement findAll
    throw UnimplementedError();
  }
}
