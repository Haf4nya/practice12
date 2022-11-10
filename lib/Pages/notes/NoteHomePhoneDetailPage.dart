import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

// The details screen for either the A or B screen.
class NoteHomePhoneDetailsPage extends StatefulWidget {
  /// Constructs a [NoteDetailScreen].
  const NoteHomePhoneDetailsPage({
    required this.label,
    required this.detailsHomePhonePath,
    Key? key,
  }) : super(key: key);

  final String detailsHomePhonePath;

  @override
  State<NoteHomePhoneDetailsPage> createState() =>
      _NoteHomePhoneDetailsPageState();
}

class _NoteHomePhoneDetailsPageState extends State<NoteHomePhoneDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домофоны - Список домофонов'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Детальный ссписок домофонов',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        //Beamer.of(context).beamToNamed(widget.detailsHomePhonePath),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
