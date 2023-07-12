import 'package:go_router/go_router.dart';

import '../../presentation/screens/invoices_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: ( _, __) => const InvoicesScreen(),
    )
  ]
);