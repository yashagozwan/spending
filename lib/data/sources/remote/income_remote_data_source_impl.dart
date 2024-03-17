import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/remote/income_remote_data_source.dart';
import 'package:spending/domain/models/income/income_model.dart';

@LazySingleton(as: IncomeRemoteDataSource)
class IncomeRemoteDataSourceImpl implements IncomeRemoteDataSource {
  final FirebaseFirestore _firestore;

  const IncomeRemoteDataSourceImpl(this._firestore);

  CollectionReference get _collection => _firestore.collection('incomes');

  @override
  Future<List<IncomeModel>> findAll(String userId) async {
    final incomes = await _collection.where('user_id', isEqualTo: userId).get();

    return incomes.docs
        .map((e) => IncomeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<IncomeModel> findOne(String id) async {
    final data = await _collection.doc(id).get();
    return IncomeModel.fromJson(data.data() as Map<String, dynamic>);
  }

  @override
  Future<IncomeModel> insertOne(IncomeModel income) async {
    final doc = await _collection.add(income.toJson());
    final snapshot = await doc.get();

    final mIncome = IncomeModel.fromJson(
      snapshot.data() as Map<String, double>,
    ).copyWith(id: doc.id);

    await doc.update(mIncome.toJson());

    return mIncome;
  }

  @override
  Future<bool> removeOne(IncomeModel income) async {
    await _collection.doc(income.id).delete();
    return true;
  }

  @override
  Future<bool> updateOne(IncomeModel income) async {
    await _collection.doc(income.id).update(income.toJson());
    return true;
  }
}
