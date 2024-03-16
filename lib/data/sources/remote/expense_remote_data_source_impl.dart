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
  Future<ExpenseModel> findOne(String id) async {
    final data = await _collection.doc(id).get();
    return ExpenseModel.fromJson(data.data() as Map<String, dynamic>);
  }

  @override
  Future<ExpenseModel> insertOne(ExpenseModel expense) async {
    final doc = await _collection.add(expense.toJson());
    final snapshot = await doc.get();

    final mExpanse = ExpenseModel.fromJson(
      snapshot.data() as Map<String, dynamic>,
    ).copyWith(id: doc.id);

    await doc.update(mExpanse.toJson());
    return mExpanse;
  }

  @override
  Future<bool> updateOne(ExpenseModel expense) async {
    await _collection.doc(expense.id).update(expense.toJson());
    return true;
  }

  @override
  Future<bool> removeOne(ExpenseModel expense) async {
    await _collection.doc(expense.id).delete();
    return true;
  }

  @override
  Future<List<ExpenseModel>> findAll(String userId) async {
    final expenses =
        await _collection.where('user_id', isEqualTo: userId).get();

    return expenses.docs
        .map((e) => ExpenseModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
