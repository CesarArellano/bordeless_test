import 'package:borderless_test/config/constants/global_constanst.dart';
import 'package:borderless_test/domain/entities/user.dart';
import 'package:borderless_test/presentation/providers/invoices_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/invoice.dart';

class InvoicesScreen extends StatelessWidget {
  
  const InvoicesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _InvoicesView(),
    );
  }
}

class _InvoicesView extends ConsumerWidget {
  const _InvoicesView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(invoiceProvider.notifier);
    final invoicesProvider = ref.watch(invoiceProvider);
    
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('Invoices', style: TextStyle(fontSize: 34),),
          const SizedBox(height: 20),
          if( invoicesProvider.isUserLoading || invoicesProvider.isInvoicesLoading )
            const Center(child: CircularProgressIndicator()),
          Expanded(
            child: ListView.separated(
              itemCount: invoicesProvider.invoiceList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final invoice = invoicesProvider.invoiceList[index];
                return CustomInvoiceListTile(invoice: invoice);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomInvoiceListTile extends ConsumerWidget {
  const CustomInvoiceListTile({
    super.key,
    required this.invoice
  });

  final Invoice invoice;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoicesProvider = ref.watch(invoiceProvider);

    final String submittedDate = (invoice.submittedDate == null) 
      ? 'N/A'
      : GlobalConstants.convertDateTimeToHumanFormat(invoice.submittedDate!);
    final username = invoicesProvider.userList.firstWhere(
      (user) => user.id == invoice.submittedByUserId,
      orElse: () => User()
    );
    final status = invoice.status ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(submittedDate, style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              Text("${ username.firstName } ${ username.lastName } - #${ invoice.invoiceNumber ?? 'N/A' }")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${ invoice.currency } ${ GlobalConstants.convertCurrencyToHumanFormat(invoice.amount ?? 0) }', style: const TextStyle(fontWeight: FontWeight.bold)),
              Chip(
                backgroundColor: GlobalConstants.getStatusColor(status),
                label: Text('${ status[0].toUpperCase() }${ status.substring(1) }'),
              )
            ],
          ),
        ],
      ),
    );
  }
}