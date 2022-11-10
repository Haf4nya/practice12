import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:practice12/theme/modelTheme.dart';
import 'package:practice12/widgets/FirstAlertDialog.dart';
import 'package:provider/provider.dart';

/// Widget for the root/initial pages in the bottom navigation bar.
class RootPage extends StatefulWidget {
  /// Creates a RootScreen
  const RootPage({required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String label;

  /// The path to the detail page
  final String detailsPath;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(alertFirst);
    super.initState();
  }

  void alertFirst(_) {
    Future.delayed(
      Duration(seconds: 0),
      () {
        showDialog(context: context, builder: (context) => FirstAlertDialog());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotitfier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Root Screen - ${widget.label}'),
          actions: [
            IconButton(
              icon: Icon(themeNotitfier.isDark
                  ? Icons.nightlight_round
                  : Icons.wb_sunny),
              onPressed: () {
                themeNotitfier.isDark
                    ? themeNotitfier.isDark = false
                    : themeNotitfier.isDark;
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Screen ${widget.label}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Padding(
                padding: EdgeInsets.all(4),
              ),
              TextButton(
                onPressed: () =>
                    Beamer.of(context).beamToNamed(widget.detailsPath),
                child: const Text('Wiew Details'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
