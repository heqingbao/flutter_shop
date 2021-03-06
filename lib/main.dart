import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import './pages/index_page.dart';
import './provide/cart.dart';
import './provide/category_goods_list.dart';
import './provide/child_category.dart';
import './provide/currentIndex.dart';
import './provide/details_info.dart';
import './routers/application.dart';
import './routers/routes.dart';
import 'provide/counter.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var categoryGoodsList = CategoryGoodsListProvide();
  var detailsInfoProvide = DetailsInfoProvide();
  var cartProvide = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();
  var providers = Providers();

  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsList))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configuareRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: '百姓生活+',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(primaryColor: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
