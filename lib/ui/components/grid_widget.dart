import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/ui/components/card_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.notes,
  });

  final Box<NotesData> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 150,
      ),
      itemBuilder: (context, i) {
        return CardWidget(
          index: i,
          title: 'Title',
          date: '04.12.2023',
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        );
      },
      itemCount: 5,
    );
  }
}
