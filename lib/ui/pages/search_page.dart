import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/database/hive_box.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/card_widget.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  var filteredNotes = <NotesData>[];
  final _notes = HiveBox.notes.values.toList();

  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }

  void _searchNotes() {
    final query = searchController.text;

    if (query.isNotEmpty) {
      filteredNotes = _notes.where((element) {
        return element.title.toLowerCase().contains(query.toLowerCase()) ||
            element.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredNotes = _notes;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.black,
            size: 25,
          ),
        ),
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.grey,
          style: AppStyle.fontStyle,
          decoration: InputDecoration(
            hintText: LocaleKeys.search.tr(),
            hintStyle: AppStyle.fontStyle,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: AppColors.black,
              size: 28,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: HiveBox.notes.listenable(),
          builder: (context, box, _) {
            return ListView.separated(
              itemBuilder: (context, i) {
                return CardWidget(
                  title: filteredNotes[i].title,
                  text: filteredNotes[i].text,
                  date: filteredNotes[i].date,
                  index: i,
                );
              },
              separatorBuilder: (context, i) => const SizedBox(height: 16),
              itemCount: filteredNotes.length,
            );
          }),
    );
  }
}
