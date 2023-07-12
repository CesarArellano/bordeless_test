
import 'package:borderless_test/domain/datasources/invoices_datasource.dart';
import 'package:borderless_test/domain/entities/invoice.dart';
import 'package:borderless_test/domain/entities/user.dart';
import 'package:borderless_test/domain/repositories/invoices_repository.dart';

class InvoicesRepositoryImpl implements InvoicesRepository {
  final InvoicesDatasource datasource;

  InvoicesRepositoryImpl(this.datasource);

  @override
  Future<List<Invoice>> getAllInvoices() {
    return datasource.getAllInvoices();
  }

  @override
  Future<List<User>> getAllUsers() {
    return datasource.getAllUsers();
  }
  
}