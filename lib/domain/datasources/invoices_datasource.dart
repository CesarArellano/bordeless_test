import '../entities/invoice.dart';
import '../entities/user.dart';

abstract class InvoicesDatasource {
  Future<List<Invoice>> getAllInvoices();
  Future<List<User>> getAllUsers();
}