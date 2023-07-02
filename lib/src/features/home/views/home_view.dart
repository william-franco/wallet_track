import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_track/src/features/client_info/widgets/client_info_card_widget.dart';
import 'package:wallet_track/src/features/home/view_models/home_view_model.dart';
import 'package:wallet_track/src/features/home/widgets/drawer_widget.dart';
import 'package:wallet_track/src/features/purchases/widgets/purchase_chart_widget.dart';
import 'package:wallet_track/src/features/purchases/widgets/purchase_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final listOfWidgets = const <Widget>[
    PurchaseChartWidget(),
    ClientInfoCardWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final tab = context.watch<HomeViewModel>().value;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        centerTitle: false,
        title: const Text('Mob4Pay'),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(child: listOfWidgets.elementAt(tab)),
          ),
          const Expanded(
            flex: 5,
            child: Center(child: PurchaseListWidget()),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: tab,
        onTap: (int index) {
          context.read<HomeViewModel>().updateIndex(index: index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Credit Card',
          ),
        ],
      ),
    );
  }
}
