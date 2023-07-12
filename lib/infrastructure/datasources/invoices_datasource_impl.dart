import 'package:borderless_test/domain/datasources/invoices_datasource.dart';
import 'package:borderless_test/domain/entities/invoice.dart';
import 'package:borderless_test/domain/entities/user.dart';
import 'package:dio/dio.dart';

class InvoicesDatasourceImpl implements InvoicesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://borderless-mobile-test-default-rtdb.firebaseio.com'
  ));

  @override
  Future<List<Invoice>> getAllInvoices() async {
    try {
      final resp = await dio.get('/invoices.json');
      final data = resp.data;

      List<Invoice> invoiceList = [];
      
      for (final invoice in data) {
        invoiceList = [ ...invoiceList, Invoice.fromJson(invoice) ];
      }

      return invoiceList;

    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    try {
      final resp = await dio.get('/users.json');
      final data = resp.data;

      List<User> userList = [];
      
      for (final user in data) {
        userList = [ ...userList, User.fromJson(user) ];
      }

      return userList;
      
    } catch (e) {
      return [];
    }
  }
}