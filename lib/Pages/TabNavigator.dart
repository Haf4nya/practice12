import 'dart:html';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:practice12/Pages/DetailsPage.dart';
import 'package:practice12/Pages/RootPage.dart';
import 'package:practice12/Pages/notes/NotesPage.dart';
import 'package:practice12/theme/modelTheme.dart';
import 'package:provider/provider.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/a',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => const ScaffoldWithBottomNavBar(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDark
                ? ThemeData(brightness: Brightness.dark)
                : ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.blue[700],
                    primarySwatch: Colors.blue),
            routerDelegate: routerDelegate,
            routeInformationParser: BeamerParser(),
            backButtonDispatcher:
                BeamerBackButtonDispatcher(delegate: routerDelegate),
          );
        }));
  }
}

//первый шаг
class ALocation extends BeamLocation<BeamState> {
  ALocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('a'),
          title: 'Tab A',
          type: BeamPageType.noTransition,
          child: NotesPage(
            label: 'A',
            detailsPath: '/a/details',
            detailsHomePhonePath: '',
          ), //???
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('a/details'),
            title: 'Details A',
            child: DetailsPage(label: 'A'),
          ),
      ];
}

//Второй шаг
class BLocation extends BeamLocation<BeamState> {
  BLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('b'),
          title: 'Tab B',
          type: BeamPageType.noTransition,
          child: RootPage(label: 'B', detailsPath: '/b/details'),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('b/details'),
            title: 'Details B',
            child: DetailsPage(label: 'B'),
          ),
      ];
}

class CLocation extends BeamLocation<BeamState> {
  CLocation(super.routeInfomation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('c'),
          title: 'Tab C',
          type: BeamPageType.noTransition,
          child: RootPage(label: 'C', detailsPath: '/c/details'),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
              key: ValueKey('c/details'),
              title: 'Details C',
              child: DetailsPage(label: 'C'))
      ];
}

class DLocation extends BeamLocation<BeamState> {
  DLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('d'),
          title: 'tab D',
          type: BeamPageType.noTransition,
          child: RootPage(label: 'D', detailsPath: 'd/details'),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('d/details'),
            title: 'details D',
            child: DetailsPage(label: 'D'),
          ),
      ];
}

class ELocation extends BeamLocation<BeamState> {
  ELocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('e'),
          title: 'Tab E',
          type: BeamPageType.noTransition,
          child: RootPage(label: 'E', detailsPath: 'e/details'),
        ),
        if (state.uri.pathSegments.length == 2)
          const BeamPage(
            key: ValueKey('e/details'),
            title: 'Details E',
            child: DetailsPage(label: 'E'),
          ),
      ];
}

/// A widget class that shows the BottomNavigationBar and performs navigation
/// between tabs
class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({super.key});

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  late int _currentIndex;

  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/a',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/a')) {
          return ALocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/b',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/b')) {
          return BLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/c',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/c')) {
          return CLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/d',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/d')) {
          return DLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
        initialPath: '/e',
        locationBuilder: (routeInformation, _) {
          if (routeInformation.location!.contains('/e')) {
            return ELocation(routeInformation);
          }
          return NotFound(path: routeInformation.location!);
        }),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    _currentIndex = uriString.contains('/a') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(routerDelegate: _routerDelegates[0]),
          Beamer(routerDelegate: _routerDelegates[1]),
          Beamer(routerDelegate: _routerDelegates[2]),
          Beamer(routerDelegate: _routerDelegates[3]),
          Beamer(routerDelegate: _routerDelegates[4]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              label: 'Section A',
              icon: Icon(
                Icons.assignment_outlined,
                color: Theme.of(context).unselectedWidgetColor,
              )),
          BottomNavigationBarItem(
              label: 'Section A',
              icon: Icon(
                Icons.assignment_ind_outlined,
                color: Theme.of(context).unselectedWidgetColor,
              )),
          BottomNavigationBarItem(
              label: 'Section B',
              icon: Icon(
                Icons.email_outlined,
                color: Theme.of(context).unselectedWidgetColor,
              )),
          BottomNavigationBarItem(
              label: 'Section C',
              icon: Icon(
                Icons.add_circle_outline,
                color: Theme.of(context).unselectedWidgetColor,
              )),
          BottomNavigationBarItem(
              label: 'Section D',
              icon: Icon(
                Icons.calculate,
                color: Theme.of(context).unselectedWidgetColor,
              )),
          BottomNavigationBarItem(
              label: 'Section E',
              icon: Icon(
                Icons.search,
                color: Theme.of(context).unselectedWidgetColor,
              )),
        ],
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
            _routerDelegates[_currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}
