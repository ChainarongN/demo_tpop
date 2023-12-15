import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_tpop/repositorys/repository.dart';

import 'providers/provider.dart';

List<SingleChildWidget> routeProvider() {
  return [
    ChangeNotifierProvider(create: (_) => HomeProvider(HomeRepository())),
  ];
}
