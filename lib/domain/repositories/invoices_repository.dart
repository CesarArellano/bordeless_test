import '../entities/invoice.dart';
import '../entities/user.dart';

abstract class InvoicesRepository {
  Future<List<Invoice>> getAllInvoices();
  Future<List<User>> getAllUsers();
}