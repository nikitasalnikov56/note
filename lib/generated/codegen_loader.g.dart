// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "notes": "Notes",
  "addNote": "Add note",
  "changeNote": "Change note",
  "title": "Title",
  "note": "Note",
  "add": "Add",
  "change": "Change",
  "search": "Search...",
  "edit": "Edit",
  "delete": "Delete"
};
static const Map<String,dynamic> ru = {
  "notes": "Заметки",
  "addNote": "Добавить заметку",
  "changeNote": "Изменить заметку",
  "title": "Заголовок",
  "note": "Заметка",
  "add": "Добавить",
  "change": "Изменить",
  "search": "Поиск...",
  "edit": "Редактировать",
  "delete": "Удалить"
};
static const Map<String,dynamic> uz = {
  "notes": "Eslatmalar",
  "addNote": "Eslatma qo'shish",
  "changeNote": "Eslatmani o'zgartirish",
  "title": "Sarlavha",
  "note": "Eslatma",
  "add": "Qo'shish",
  "change": "O'zgartirish",
  "search": "Qidirilmoqda...",
  "edit": "Edit",
  "delete": "O'chirish"
};

static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru, "uz": uz};
}
