import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mac_address/mac_address.dart';
import 'package:riverpod_ddd/features/login_page/presentation/login_state_notifier.dart';

class RegistrationScreen extends HookConsumerWidget {
  RegistrationScreen({super.key});
  static String get path => '/registrationScreen';
  static String get name => '/registrationScreen';

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

    final nameController = useTextEditingController();
    final nameControllerKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    final emailController = useTextEditingController();
    final emailControllerKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    final selectedGender = useState("");
    final genders = ["Male", "Female"];

    final dobController = useTextEditingController();

    // Country

    // Division id

    // district Id

    // Address

    final rePassword = useTextEditingController();
    final rePasswordKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    // mac address

    // Profile photo

    return Scaffold(
      appBar: const KAppBar(titleText: 'Registration'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              gap48,
              AppTextField(
                hintText: "Name",
                controller: nameController,
                formFieldKey: nameControllerKey,
                validator: (v) => TextInputValidator().name(v),
                onChanged: (v) => nameControllerKey.currentState!.validate(),
              ),
              gap4,
              AppTextField(
                hintText: "email",
                controller: emailController,
                formFieldKey: emailControllerKey,
                validator: (v) => TextInputValidator().email(v),
                onChanged: (v) => emailControllerKey.currentState!.validate(),
              ),
              gap4,
              AppTextField(
                hintText: "Phone Number",
                controller: phoneController,
                formFieldKey: phoneControllerKey,
                validator: (v) => TextInputValidator().phone(v),
                onChanged: (v) => phoneControllerKey.currentState!.validate(),
              ),
              gap4,
              AppTextField(
                hintText: "password",
                controller: passwordController,
                formFieldKey: passwordControllerKey,
                obSecureText: true,
                validator: (v) => TextInputValidator().password(v),
                onChanged: (v) =>
                    passwordControllerKey.currentState!.validate(),
              ),
              gap4,
              AppTextField(
                hintText: "Re - password",
                controller: rePassword,
                formFieldKey: rePasswordKey,
                obSecureText: true,
                validator: (v) => TextInputValidator().password(v),
                onChanged: (v) => rePasswordKey.currentState!.validate(),
              ),
              gap4,
              TextField(
                controller:
                    dobController, // Editing controller of this TextField
                decoration: InputDecoration(
                  hintText: "Date of birth",
                  suffix: Icon(Icons.date_range), // Icon of text field
                ),
                readOnly:
                    true, // Set it to true, so that the user will not be able to edit text

                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (selectedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(selectedDate);

                    dobController.text =
                        formattedDate; // Set the value of the text field.
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              gap8,
              SizedBox(
                child: Column(
                  children: genders
                      .map(
                        (e) => CustomCheckBox(
                          checkBoxTitle: e,
                          value: e,
                          isSelected: selectedGender.value == e,
                          onSelect: (v) => {
                            if (v == selectedGender.value)
                              {
                                selectedGender.value = "",
                              }
                            else
                              {selectedGender.value = v}
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              gap4,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
