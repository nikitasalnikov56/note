import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/components/dialog_window.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.text,
    required this.date,
    required this.index,
  });

  final String title, date, text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(AppRoutes.noteAbout, extra: index);
      },
      onLongPress: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: DialogWindow(
                index: index,
                title: title,
                text: text,
              ),
            );
          },
        );
      },
      child: Card(
        color: AppColors.bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  color: AppColors.lgrey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
