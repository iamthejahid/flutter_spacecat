import 'package:app_ui/app_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ddd/local_cache/cache_abstract.dart';
import 'package:riverpod_ddd/local_cache/cache_provider.dart';

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier({required Ref ref})
      : _ref = ref,
        super("en") {
    _cache = _ref.watch(hiveProvider);
  }

  final Ref _ref;
  late final CacheHandler _cache;

  updateState() => Future.microtask(() => state = _cache.locale);

  localeSet({required String locale}) {
    _cache.localeSet(locale: locale);
    updateState();
  }
}

final localeNotifierProvider =
    StateNotifierProvider<LocaleNotifier, String>((ref) {
  return LocaleNotifier(ref: ref);
});

// Widget
class LanguageSelectorWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final localeState = ref.watch(localeNotifierProvider);
    final localeController = ref.read(localeNotifierProvider.notifier);

    return DropdownButton<String>(
      value: localeState,
      items: [
        {"value": "en", "label": "🇺🇸 English"},
        {"value": "bn", "label": "🇧🇩 Bangla"},
        {"value": "ar", "label": "🇸🇦 Arabic"}
      ].map((Map e) {
        return DropdownMenuItem<String>(
          value: e["value"],
          child: Text(e["label"]),
        );
      }).toList(),
      onChanged: (v) => localeController.localeSet(locale: v!),
    );
  }
}
