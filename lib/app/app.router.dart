// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../model/person.dart';
import '../views/add_screen/add_screen_view.dart';
import '../views/info_screen/info_screen_view.dart';
import '../views/update_screen/update_screen_view.dart';

class Routes {
  static const String addScreenView = '/';
  static const String infoScreenView = '/info-screen-view';
  static const String updateScreenView = '/update-screen-view';
  static const all = <String>{
    addScreenView,
    infoScreenView,
    updateScreenView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.addScreenView, page: AddScreenView),
    RouteDef(Routes.infoScreenView, page: InfoScreenView),
    RouteDef(Routes.updateScreenView, page: UpdateScreenView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    AddScreenView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AddScreenView(),
        settings: data,
      );
    },
    InfoScreenView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const InfoScreenView(),
        settings: data,
      );
    },
    UpdateScreenView: (data) {
      var args = data.getArgs<UpdateScreenViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UpdateScreenView(
          key: args.key,
          index: args.index,
          person: args.person,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// UpdateScreenView arguments holder class
class UpdateScreenViewArguments {
  final Key? key;
  final int index;
  final Person person;
  UpdateScreenViewArguments(
      {this.key, required this.index, required this.person});
}
