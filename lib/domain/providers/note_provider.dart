import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/database/hive_box.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/ui/routes/app_routes.dart';

class NoteProvider extends ChangeNotifier {
  //контроллеры
  final titleController = TextEditingController();
  final textController = TextEditingController();

  //добавление заметок

  Future<void> addNote(BuildContext context) async {
    await HiveBox.notes
        .add(
          NotesData(
              title: titleController.text.isNotEmpty
                  ? titleController.text
                  : 'Название заметки',
              text: textController.text.isNotEmpty
                  ? textController.text
                  : 'Описание заметки'),
        )
        .then((value) => context.go(AppRoutes.home))
        .then((value) => controllerClear());
  }

  controllerClear() {
    textController.clear();
    titleController.clear();
  }

  //удаление заметок
  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBox.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  //изменение заметки
  Future<void> changeNote(BuildContext context, int index) async {
    await HiveBox.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text,
            text: textController.text,
          ),
        )
        .then(
          (value) => context.go(AppRoutes.home),
        )
        .then(
          (value) => controllerClear(),
        );
  }

  //смена темы
  bool isTheme = false;

  changeTheme(bool value) {
    isTheme = value;
    notifyListeners();
  }

  //смена языка
  changeLanguage(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(const Locale('en'));
    } else if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('uz'));
    } else {
      context.setLocale(const Locale('ru'));
    }
    notifyListeners();
  }
}
