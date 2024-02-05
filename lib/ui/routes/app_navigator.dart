import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/pages/add_notes_page.dart';
import 'package:notes_app/ui/pages/change_notes_page.dart';
import 'package:notes_app/ui/pages/home_page.dart';
import 'package:notes_app/ui/pages/note_about.dart';
import 'package:notes_app/ui/pages/search_page.dart';
import 'package:notes_app/ui/routes/app_routes.dart';

class AppNavigator {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
          path: AppRoutes.addNotes,
          builder: (context, state) => const AddNotePage()),
      GoRoute(
          path: AppRoutes.changeNotes,
          builder: (context, state) => const ChangeNotePage()),
      GoRoute(
          path: AppRoutes.searchNotes,
          builder: (context, state) => const SearchPage()),
      GoRoute(
          path: AppRoutes.noteAbout,
          builder: (context, state) => const NoteAbout()),
    ],
  );

  static GoRouter get router => _router;
}
