// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:wallet_track/src/features/client_info/repositories/client_info_repository.dart';
import 'package:wallet_track/src/features/client_info/view_models/client_info_view_model.dart';
import 'package:wallet_track/src/features/home/view_models/home_view_model.dart';
import 'package:wallet_track/src/features/purchases/repositories/purchase_repository.dart';
import 'package:wallet_track/src/features/purchases/view_models/purchase_chart_view_model.dart';
import 'package:wallet_track/src/features/purchases/view_models/purchase_list_view_model.dart';
import 'package:wallet_track/src/features/settings/repositories/setting_repository.dart';
import 'package:wallet_track/src/features/settings/view_models/setting_view_model.dart';
import 'package:wallet_track/src/services/http_service.dart';
import 'package:wallet_track/src/services/storage_service.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Services
        Provider<HttpService>(
          create: (context) => HttpServiceImpl(),
        ),
        Provider<StorageService>(
          create: (context) => StorageServiceImpl(),
        ),
        // Repositories
        Provider<PurchaseRepository>(
          create: (context) => PurchaseRepositoryImpl(
            httpService: context.read<HttpService>(),
          ),
        ),
        Provider<ClientInfoRepository>(
          create: (context) => ClientInfoRepositoryImpl(
            httpService: context.read<HttpService>(),
          ),
        ),
        Provider<SettingRepository>(
          create: (context) => SettingRepositoryImpl(
            storageService: context.read<StorageService>(),
          ),
        ),
        // ViewModels
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModelImpl(),
        ),
        ChangeNotifierProvider<PurchaseListViewModel>(
          create: (context) => PurchaseListViewModelImpl(
            purchaseRepository: context.read<PurchaseRepository>(),
          ),
        ),
        ChangeNotifierProvider<PurchaseChartViewModel>(
          create: (context) => PurchaseChartViewModelImpl(
            purchaseRepository: context.read<PurchaseRepository>(),
          ),
        ),
        ChangeNotifierProvider<ClientInfoViewModel>(
          create: (context) => ClientInfoViewModelImpl(
            clientInfoRepository: context.read<ClientInfoRepository>(),
          ),
        ),
        ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModelImpl(
            settingRepository: context.read<SettingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
