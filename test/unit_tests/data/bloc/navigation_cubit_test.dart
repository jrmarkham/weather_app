import 'package:weather/src/data/blocs/navigation/navigation_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NavigationCubit', () {
    NavigationCubit navigationCubit = NavigationCubit();

    test('initial state is home', () {
      expect(navigationCubit.state, NavScreenStatus.home);
    });
    test(' state is search when search is called ', () {
      navigationCubit.updateNav(NavScreenStatus.search);
      expect(navigationCubit.state, NavScreenStatus.search);
    });

    test(' state is setting when setting is called ', () {
      navigationCubit.updateNav(NavScreenStatus.setting);
      expect(navigationCubit.state, NavScreenStatus.setting);
    });

    test(' state is home when home is called ', () {
      navigationCubit.updateNav(NavScreenStatus.home);
      expect(navigationCubit.state, NavScreenStatus.home);
    });
  });
}
