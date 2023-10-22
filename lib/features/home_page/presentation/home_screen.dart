import 'package:app_ui/app_ui.dart'; // Import your app UI library
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ddd/local_cache/cache_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key});

  static String get path => '/homeScreen';
  static String get name => '/homeScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cache = ref.watch(hiveProvider);

    return Scaffold(
      appBar: const KAppBar(titleText: 'Home Page'),
      body: Container(
        padding: padding6,
        child: Column(
          children: [
            gap10,
            Text(
              'User One',
              style: ContentTextStyle.bodyText1,
            ),
            const Spacer(),
            Padding(
              padding: padding10,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  elevation: MaterialStateProperty.all(8),
                ),
                onPressed: cache.cleanBox,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Log out'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('johndoe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
