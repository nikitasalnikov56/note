import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/providers/note_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/form_widget.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class ChangeNotePage extends StatelessWidget {
  const ChangeNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    final extra =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra;
        
    final index = extra is int ? extra : 0;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title:  Text(LocaleKeys.changeNote.tr(), style: AppStyle.fontStyle),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
          ),
        ),
      ),
      body: FormWidget(
        btnName: LocaleKeys.change.tr(),
        btnFunc: () {
          model.changeNote(context, index);
        },
      ),
    );
  }
}
