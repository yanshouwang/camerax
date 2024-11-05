import 'package:clover/clover.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'view_models.dart';
import 'views.dart';

final routeObserver = RouteObserver<ModalRoute>();

final routerConfig = GoRouter(
  observers: [
    routeObserver,
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ViewModelBinding(
          viewBuilder: (context) => const HomeView(),
          viewModelBuilder: (context) => HomeViewModel(),
        );
      },
      routes: [
        GoRoute(
          path: 'viewer',
          builder: (context, state) {
            final filePath = state.uri.queryParameters['uri'];
            if (filePath == null) {
              throw ArgumentError.notNull('uri');
            }
            final uri = Uri.file(filePath);
            return InteractiveView(
              uri: uri,
            );
          },
        ),
      ],
    ),
  ],
);
