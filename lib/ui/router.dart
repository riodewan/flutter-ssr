import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_iot/constants/route_name.dart';
import 'package:flutter_with_iot/ui/views/publish_rmq_view.dart';
import 'package:flutter_with_iot/ui/views/subscribe_rmq_view.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name) {
    case publishRmqViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: PublishRmqView()
      );
    case subscribeRmqViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: SubscribeRmqView()
      );
  }
}

PageRoute _pageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      builder: (_) => viewToShow,
    settings: RouteSettings(
      name: routeName
    )
  );
}