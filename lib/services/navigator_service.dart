import 'package:flutter/cupertino.dart';

class NavigationService{
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  Future<dynamic> navigateTo(String routeName,{dynamic arguments}){
    return _navigationKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) async {
    return _navigationKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}