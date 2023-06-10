import 'package:domain/models/core_router.dart';
import 'package:domain/models/enums.dart';
import 'package:domain/models/page_route.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';

class PageRouterService implements IPageRouterService {
  List<PageRoutePoint> routes = [];

  @override
  late CoreRouter router;

  @override
  late int currentIndex = 0;

  @override
  late Object? callbackResult;

  @override
  backToPrevious(BuildContext context) {
    var page = routes.elementAt(routes.length - 2);
    routes.removeLast();
    context.go(
      page.route,
      extra: TransitionData(next: PageTransition.slideBack),
    );
  }

  @override
  bool changePage(String name, BuildContext context, TransitionData data,
      {Object? bindingData}) {
    routes.add(PageRoutePoint(route: name, data: bindingData));
    context.go(name, extra: data);
    return true;
  }

  @override
  void registerRouter(CoreRouter currentRouter) {
    router = currentRouter;
  }

  @override
  void setPageIndex(int index) {
    currentIndex = index;
  }

  @override
  void setCallbackResult(Object current) {
    callbackResult = current;
  }

  @override
  late String lastPage;

  @override
  late String onSubmit;

  @override
  late String dashboard;

  @override
  bool clearNavigationData() {
    routes.clear();
    return true;
  }

  @override
  Object getPageBindingData() {
    return routes.elementAt(routes.length - 1).data ?? "";
  }
}
