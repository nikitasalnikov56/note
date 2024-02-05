import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/providers/note_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class DialogWindow extends StatelessWidget {
  const DialogWindow({
    super.key,
    required this.index,
    required this.title,
    required this.text,
  });

  final String title, text;
  final int index;

  Widget modalLine() {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xFFDEDEDE),
        ),
        child: const SizedBox(
          height: 4,
          width: 34,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modalLine(),
          const SizedBox(height: 10),
          Center(
            child: Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          RowButtons(
            icon: Icons.edit,
            btnName: LocaleKeys.edit.tr(),
            func: () {
              context.go(AppRoutes.changeNotes, extra:index );
            },
          ),
          const SizedBox(height: 8),
          RowButtons(
            icon: Icons.delete_outlined,
            btnName: LocaleKeys.delete.tr(),
            func: () {
              model.deleteNote(context, index);
            },
          ),
        ],
      ),
    );
  }
}

class RowButtons extends StatelessWidget {
  const RowButtons({
    super.key,
    required this.icon,
    required this.func,
    required this.btnName,
  });
  final IconData icon;
  final Function func;
  final String btnName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.grey, size: 30),
          const SizedBox(width: 16),
          Text(
            btnName,
            style: AppStyle.fontStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
