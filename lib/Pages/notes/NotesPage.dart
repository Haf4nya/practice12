import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:practice12/theme/modelTheme.dart';
import 'package:practice12/widgets/firstAlertDialog.dart';
import 'package:practice12/Pages/TabNavigator.dart';
import 'package:provider/provider.dart';

//Widget for the root/inintial pages if the bottom navigation bar.
class NotesPage extends StatefulWidget {
  //Creates a RootPage
  const NotesPage(
      {required this.label,
      required this.detailsPath,
      required this.detailsHomePhonePath,
      Key? key})
      : super(key: key);

  //label
  final String label;

  //Path to the details page
  final String detailsPath;

  //Path to the details page
  final String detailsHomePhonePath;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    //WidgetsBinding.instance.addPostFrameCallback(alertFirst);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNoifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Заметки'),
            actions: [
              IconButton(
                icon: Icon(themeNoifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  themeNoifier.isDark
                      ? themeNoifier.isDark = false
                      : themeNoifier.isDark = true;
                },
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () => Beamer.of(context)
                          .beamToNamed(widget.detailsHomePhonePath),
                      child: const Text(
                        'Домофоны',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () =>
                          Beamer.of(context).beamToNamed(widget.detailsPath),
                      child: const Text(
                        'Квартиры',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
