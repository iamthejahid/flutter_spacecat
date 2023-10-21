import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mac_address/mac_address.dart';
import 'package:riverpod_ddd/core/widgets/theme_widget.dart';
import 'package:riverpod_ddd/features/login_page/presentation/login_state_notifier.dart';
import 'package:riverpod_ddd/features/registration_screen/presentation/registration_screen.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});
  static String get path => '/loginScreen';
  static String get name => '/loginScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginProvider.notifier);
    final sTate = ref.watch(loginProvider);

    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final phoneControllerKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());
    final passwordControllerKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    return Scaffold(
      appBar: const KAppBar(titleText: 'Login'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: Column(
            children: [
              ThemeSwitch(),
              gap48,
              AppTextField(
                controller: phoneController,
                formFieldKey: phoneControllerKey,
                validator: (v) => TextInputValidator().phone(v),
                onChanged: (v) => phoneControllerKey.currentState!.validate(),
              ),
              gap4,
              AppTextField(
                controller: passwordController,
                formFieldKey: passwordControllerKey,
                obSecureText: true,
                validator: (v) => TextInputValidator().password(v),
                onChanged: (v) =>
                    passwordControllerKey.currentState!.validate(),
              ),
              gap8,
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  elevation: MaterialStateProperty.all(8.r),
                ),
                onPressed: !sTate.isLoading
                    ? () async {
                        phoneControllerKey.currentState!.validate();
                        passwordControllerKey.currentState!.validate();
                        if ((phoneControllerKey.currentState?.isValid ??
                                false) &&
                            (passwordControllerKey.currentState?.isValid ??
                                false)) {
                          final macAddress = await await GetMac.macAddress;
                          Map<String, dynamic> body = {
                            "phone": phoneController.text,
                            "password": passwordController.text,
                            "mac_address": macAddress,
                          };
                          await controller.login(body: body);
                        }
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Login'),
                    gap10,
                    if (sTate.isLoading)
                      Padding(
                        padding: paddingV4,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              gap4,
              InkWell(
                onTap: () => context.pushReplacement(RegistrationScreen.path),
                child: Text(
                  'Not Registered? Sign up',
                  style: UITextStyle.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
