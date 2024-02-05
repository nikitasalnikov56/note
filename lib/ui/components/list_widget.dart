import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/ui/components/card_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key, required this.notes});

  final Box<NotesData> notes;

  @override
  Widget build(BuildContext context) {
    final allNotes = notes.values.toList();
    return ListView.separated(
      itemBuilder: (context, i) {
        return CardWidget(
          index: i,
          title: allNotes[i].title,
          date: allNotes[i].date,
          text: allNotes[i].text,
        );
      },
      separatorBuilder: (context, i) => const SizedBox(height: 16),
      itemCount: allNotes.length,
    );
  }
}
