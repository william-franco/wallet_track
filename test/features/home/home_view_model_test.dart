import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_track/src/features/home/view_models/home_view_model.dart';

void main() {
  group('HomeViewModel', () {
    late HomeViewModel homeViewModel;

    setUp(() {
      homeViewModel = HomeViewModelImpl();
    });

    test('initial value is 0', () {
      expect(homeViewModel.value, equals(0));
    });

    test('change index', () {
      homeViewModel.updateIndex(index: 1);
      expect(homeViewModel.value, equals(1));
    });
  });
}
