import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/database/hive_box.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class NoteAbout extends StatelessWidget {
  const NoteAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final extra =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra;

    final index = extra is int ? extra : 0;

    final notes = HiveBox.notes.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
        title: Text(
          notes[index].title,
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          notes[index].text,
          style: AppStyle.fontStyle.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
