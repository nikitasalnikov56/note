import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/database/hive_box.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/ui/components/grid_widget.dart';
import 'package:notes_app/ui/components/list_widget.dart';
import 'package:notes_app/ui/style/app_colors.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: ValueListenableBuilder(
            valueListenable: HiveBox.notes.listenable(),
            builder: (context, Box<NotesData> notes, _) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return ListWidget(
                      notes: notes,
                    );
                  } else {
                    return GridWidget(
                      notes: notes,
                    );
                  }
                },
              );
            }),
      ),
    );
  }
}
