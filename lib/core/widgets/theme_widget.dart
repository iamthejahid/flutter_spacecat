import 'package:app_ui/app_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ddd/local_cache/cache_abstract.dart';
import 'package:riverpod_ddd/local_cache/cache_provider.dart';

class ThemeNotifier extends StateNotifier<String> {
  ThemeNotifier({required Ref ref})
      : _ref = ref,
        super("light") {
    _cache = _ref.watch(hiveProvider);
  }

  final Ref _ref;
  late final CacheHandler _cache;

  updateState() => Future.microtask(() => state = _cache.themeData);

  toggle() {
    if (state == "dark") {
      _cache.setThemeData(isWhite: true);
      updateState();
    } else {
      _cache.setThemeData(isWhite: false);
      updateState();
    }
  }
}

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, String>((ref) {
  return ThemeNotifier(ref: ref);
});

class ThemeSwitch extends ConsumerWidget {
  ThemeSwitch({super.key});

  MaterialStateProperty<Icon?> thumbIcon(bool isLight) =>
      MaterialStateProperty.all<Icon?>(Icon(
        !isLight ? Icons.sunny : Icons.mode_night,
        color: Colors.white,
      ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeNotifierProvider);
    final themeDataController = ref.read(themeNotifierProvider.notifier);

    return Switch(
      thumbIcon: thumbIcon(themeData == "dark"),
      value: themeData == "dark",
      onChanged: (bool value) => themeDataController.toggle(),
    );
  }
}
