import 'package:budgetkp/domain/transactions/models/transactions.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions({int offset});
}
