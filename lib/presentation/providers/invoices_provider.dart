
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/invoice.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/invoices_repository.dart';
import '../../infrastructure/datasources/invoices_datasource_impl.dart';
import '../../infrastructure/repositories/invoices_repository_impl.dart';

final invoiceRepositoryProvider = Provider((ref) {
  return InvoicesRepositoryImpl(InvoicesDatasourceImpl());
});

final invoiceProvider = StateNotifierProvider<InvoiceProviderNotifier, InvoiceState>((ref) {
  final invoiceRepository = ref.watch(invoiceRepositoryProvider);
  return InvoiceProviderNotifier(invoicesRepository: invoiceRepository);
});

class InvoiceProviderNotifier extends StateNotifier<InvoiceState> {
  final InvoicesRepository invoicesRepository;

  InvoiceProviderNotifier({
    required this.invoicesRepository
  }): super(InvoiceState(invoiceList: [], userList: [])) {
    getAllInvoices();
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    try {
      state = state.copyWith(
        isUserLoading: true
      );
      final userList = await invoicesRepository.getAllUsers();
      state = state.copyWith(
        isUserLoading: false
      );
      state = state.copyWith(
        userList: userList
      );
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
        isUserLoading: false
      );
    }
  }

  Future<void> getAllInvoices() async {
    try {
      state = state.copyWith(
        isInvoicesLoading: true
      );
      final invoicesList = await invoicesRepository.getAllInvoices();
      state = state.copyWith(
        isInvoicesLoading: false
      );
      state = state.copyWith(
        invoiceList: invoicesList
      );
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
        isInvoicesLoading: false
      );
    }
  }

}

class InvoiceState {
  final List<Invoice> invoiceList;
  final List<User> userList;
  final bool isInvoicesLoading;
  final bool isUserLoading;
  
  InvoiceState({
    required this.invoiceList,
    required this.userList,
    this.isInvoicesLoading = false,
    this.isUserLoading = false
  });

  
  InvoiceState copyWith({
    List<Invoice>? invoiceList,
    List<User>? userList,
    bool? isInvoicesLoading,
    bool? isUserLoading,
  }) => InvoiceState(
    invoiceList: invoiceList ?? this.invoiceList,
    userList: userList ?? this.userList,
    isInvoicesLoading: isInvoicesLoading ?? this.isInvoicesLoading,
    isUserLoading: isUserLoading ?? this.isUserLoading
  );

}