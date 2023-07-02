import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_track/src/features/purchases/state/purchase_state.dart';
import 'package:wallet_track/src/features/purchases/view_models/purchase_list_view_model.dart';
import 'package:wallet_track/src/features/purchases/widgets/date_purchase_widget.dart';
import 'package:wallet_track/src/features/purchases/widgets/price_purchase_widget.dart';

class PurchaseListWidget extends StatefulWidget {
  const PurchaseListWidget({super.key});

  @override
  State<PurchaseListWidget> createState() => _PurchaseListWidgetState();
}

class _PurchaseListWidgetState extends State<PurchaseListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      context.read<PurchaseListViewModel>().readPurchases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<PurchaseListViewModel>().readPurchases();
      },
      child: Consumer<PurchaseListViewModel>(
        builder: (context, state, child) {
          return switch (state.value) {
            PurchaseInitial() => const Text('Sem registros.'),
            PurchaseLoading() => const CircularProgressIndicator(),
            PurchaseSuccess(purchases: final purchases) => ListView.builder(
                shrinkWrap: true,
                itemCount: purchases.length,
                itemBuilder: (BuildContext context, int index) {
                  final purchase = purchases[index];
                  return Row(
                    children: [
                      DatePurchaseWidget(date: purchase.date!),
                      PricePurchaseWidget(
                        price: purchase.value?.toString() ?? '0,00',
                      ),
                    ],
                  );
                },
              ),
            PurchaseFailure(message: final message) => Text(message),
          };
        },
      ),
    );
  }
}
