import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/note_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.btnFunc,
    required this.btnName,
  });
  final String btnName;
  final Function btnFunc;
  @override
  Widget build(BuildContext context) {
    final titleController = context.watch<NoteProvider>().titleController;
    final textController = context.watch<NoteProvider>().textController;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFieldWidget(
            formController: titleController,
            labelText: LocaleKeys.title.tr(),
          ),
          const SizedBox(height: 16),
          TextFieldWidget(
            formController: textController,
            labelText: LocaleKeys.note.tr(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.bgColor,
              onPressed: () {
                btnFunc();
              },
              label: Text(
                btnName,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.formController,
  });

  final String labelText;
  final TextEditingController formController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: formController,
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyle.fontStyle.copyWith(
          fontSize: 14,
          color: AppColors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
