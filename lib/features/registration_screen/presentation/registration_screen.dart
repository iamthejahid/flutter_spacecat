import 'dart:developer';
import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mac_address/mac_address.dart';
import 'package:riverpod_ddd/features/registration_screen/presentation/registration_state_notifier.dart';
import 'dart:convert';

class RegistrationScreen extends HookConsumerWidget {
  RegistrationScreen({super.key});
  static String get path => '/registrationScreen';
  static String get name => '/registrationScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(registrationProvider.notifier);
    final sTate = ref.watch(registrationProvider);

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

    final addressController = useTextEditingController();
    final addressKey = useMemoized(() => GlobalKey<FormFieldState<String>>());

    final rePassword = useTextEditingController();
    final rePasswordKey =
        useMemoized(() => GlobalKey<FormFieldState<String>>());

    final selectedDist = useState("44");
    final selectedDiv = useState("6");

    // Country

    // Division id

    // district Id

    // mac address

    final imageFile = useState<File?>(null);

    return Scaffold(
      appBar: const KAppBar(titleText: 'Registration'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              gap16,
              ImagePickerAvatar(
                onSave: (v) => imageFile.value = v,
              ),
              gap8,
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
                validator: (v) => TextInputValidator()
                    .confirmPassword(v, passwordController.text),
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
              AppTextField(
                hintText: "Address",
                controller: addressController,
                formFieldKey: addressKey,
                validator: (v) => TextInputValidator().name(v),
                onChanged: (v) => addressKey.currentState!.validate(),
              ),
              gap4,
              DropdownButton<String>(
                value: selectedDiv.value,
                onChanged: (String? newValue) => selectedDiv.value = newValue!,
                items: [
                  {"value": "6", "label": "Dhaka"}
                ].map((value) {
                  return DropdownMenuItem<String>(
                    value: value["value"],
                    child: Text(value["label"]!),
                  );
                }).toList(),
                underline: Container(
                  height: 2,
                  color: AppColors.darkAqua,
                ),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                isExpanded: true,
                hint: Text("Select an option"),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 32,
                iconEnabledColor: AppColors.darkAqua,
                selectedItemBuilder: (BuildContext context) {
                  return [
                    Text("Dhaka", style: TextStyle(color: AppColors.darkAqua)),
                  ];
                },
              ),
              gap4,
              DropdownButton<String>(
                value: "44",
                onChanged: (String? newValue) => selectedDist.value = newValue!,
                items: [
                  {"value": "44", "label": "Tangail"},
                ].map((value) {
                  return DropdownMenuItem<String>(
                    value: value["value"],
                    child: Text(value["label"]!),
                  );
                }).toList(),
                underline: Container(
                  // Customize the underline
                  height: 2,
                  color: AppColors.darkAqua, // Match the text field color
                ),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      // Match the text style
                      fontWeight: FontWeight.w500,
                    ),
                isExpanded:
                    true, // To make the dropdown the same width as the text field
                hint: Text("Select an option"), // Add a hint text
                icon: Icon(Icons.arrow_drop_down), // Add an icon
                iconSize: 32, // Customize the icon size
                iconEnabledColor:
                    AppColors.darkAqua, // Customize the icon color
                selectedItemBuilder: (BuildContext context) {
                  // Customize the selected item appearance
                  return [
                    Text("Tangail",
                        style: TextStyle(color: AppColors.darkAqua)),
                  ];
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
              gap12,
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  elevation: MaterialStateProperty.all(8.r),
                ),
                onPressed: !sTate.isLoading
                    ? () async {
                        phoneControllerKey.currentState!.validate();
                        passwordControllerKey.currentState!.validate();

                        String image64 = base64Encode(
                            File(imageFile.value!.path).readAsBytesSync());

                        if ((phoneControllerKey.currentState?.isValid ??
                                false) &&
                            (passwordControllerKey.currentState?.isValid ??
                                false)) {
                          String macAddress = await await GetMac.macAddress;
                          if (macAddress.isEmpty) {
                            macAddress = "dummy_mac";
                          }
                          Map<String, dynamic> body = {
                            "name": nameController.text,
                            "email": emailController.text,
                            "country_code": "+880",
                            "phone": phoneController.text,
                            "gender": selectedGender.value,
                            "dob": dobController.text,
                            "division_id": 6,
                            "district_id": 44,
                            "address": addressController.text,
                            "password": phoneController.text,
                            "profile_photo": image64,
                            "mac_address": macAddress,
                          };
                          log(body.toString());
                          await controller.registration(body: body);
                        }
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('registration'),
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
              gap10,
            ],
          ),
        ),
      ),
    );
  }
}
