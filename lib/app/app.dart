import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ddd/core/widgets/locale_switch.dart';
import 'package:riverpod_ddd/core/widgets/theme_widget.dart';
import 'package:riverpod_ddd/flavor/flavor.dart';
import 'package:riverpod_ddd/l10n/l10n.dart';
import 'package:riverpod_ddd/router/app_route.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final localeProvider = ref.watch(localeNotifierProvider);
    final themeProvider = ref.watch(themeNotifierProvider);

    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, c) => DismissKeyboard(
        child: MaterialApp.router(
          title: 'Caretutors',
          routerConfig: router,

          /// For preventing system dark.
          themeMode: ThemeMode.light,

          /// There will be a flex theme soon!
          theme: themeProvider == "dark"
              ? const AppDarkTheme().themeData
              : const AppTheme().themeData,

          debugShowCheckedModeBanner:
              BuildConfig.instance.environment != Environment.PRODUCTION,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: context.allSupportedLocale,
          locale: Locale(localeProvider),
        ),
      ),
      designSize: const Size(187.5, 406),
    );
  }
}
