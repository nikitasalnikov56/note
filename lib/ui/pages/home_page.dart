import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/providers/note_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/notes_body.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    return Scaffold(
      drawer: Drawer(
        width: 80,
        backgroundColor: AppColors.bgColor,
        child: DrawerItems(model: model),
      ),
      appBar: AppBar(
        leading: const OpenDrawer(),
        backgroundColor: AppColors.bgColor,
        title: Text(LocaleKeys.notes.tr(), style: AppStyle.fontStyle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go(AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.grey,
              size: 25,
            ),
          ),
        ],
      ),
      body: const NoteBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          context.go(AppRoutes.addNotes);
        },
        child: const Icon(
          Icons.edit_outlined,
          color: AppColors.purple,
          size: 28,
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key, required this.model});
  final NoteProvider model;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Switch(
            value: model.isTheme,
            onChanged: (value) {
              model.changeTheme(value);
            },
          ),
          IconButton(
            onPressed: () {
              model.changeLanguage(context);
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        color: AppColors.black,
        size: 28,
      ),
    );
  }
}
