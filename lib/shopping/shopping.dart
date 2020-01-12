
import 'package:flutter/material.dart';
import 'package:my_flutter/shopping/common/theme.dart';
import 'package:my_flutter/shopping/model/cart.dart';
import 'package:my_flutter/shopping/screen/cart.dart';
import 'package:my_flutter/shopping/screen/catelog.dart';
import 'package:provider/provider.dart';

import 'model/catelog.dart';

class ShoppingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CardModel>(
          create: (context) => CardModel.empty(),
          update: (context, catalog, previousCart) =>
          CardModel(catalog, previousCart),
        )
      ],
      child: MaterialApp(
        title: "Provider Demo",
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/' : (context) => MyCatalog(),
          '/cart' : (context) => MyCard()
        },
      ),
    );
  }

}