import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wallet_track/src/features/purchases/models/purchase_model.dart';
import 'package:wallet_track/src/features/purchases/state/purchase_state.dart';
import 'package:wallet_track/src/features/purchases/view_models/purchase_chart_view_model.dart';

class PurchaseChartWidget extends StatefulWidget {
  const PurchaseChartWidget({super.key});

  @override
  State<PurchaseChartWidget> createState() => _PurchaseChartWidgetState();
}

class _PurchaseChartWidgetState extends State<PurchaseChartWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      context.read<PurchaseChartViewModel>().readPurchases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseChartViewModel>(
      builder: (context, state, child) {
        return switch (state.value) {
          PurchaseInitial() => const Text('Sem registros.'),
          PurchaseLoading() => const CircularProgressIndicator(),
          PurchaseSuccess(purchases: final purchases) => SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ColumnSeries<PurchaseModel, String>>[
                ColumnSeries<PurchaseModel, String>(
                  dataSource: purchases,
                  xValueMapper: (PurchaseModel point, _) => point.store,
                  yValueMapper: (PurchaseModel point, _) => point.value,
                ),
              ],
            ),
          PurchaseFailure(message: final message) => Text(message),
        };
      },
    );
  }
}
