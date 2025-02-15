import 'dart:io';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/helper/photo_helper.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/Profile/presentation/view/widgets/edit_text_field.dart';
import 'package:flower_app/features/Profile/presentation/view/widgets/password_edit_text_field.dart';
import 'package:flower_app/features/Profile/presentation/view/widgets/small_edit_text_field.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String? _avatarImagePath;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  void initState() {
    super.initState();
    _loadAvatarImage(); // تحميل الصورة المحفوظة عند بدء التطبيق
  }

  Future<void> _loadAvatarImage() async {
    final path = await AvatarHelper.getAvatarImagePath();
    setState(() {
      _avatarImagePath = path; // تعيين المسار
    });
  }

  Future<void> _saveAvatarImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatar_image_path', path); // حفظ المسار
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(S.of(context).editProfile),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: AppColors.primaryColor,
                        child: _avatarImagePath == null
                            ? const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              )
                            : ClipOval(
                                child: Image.file(
                                  File(_avatarImagePath!),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _showImagePicker(context);
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallEditTextField(
                      text: 'John',
                      label: S.of(context).firstname,
                    ),
                    SmallEditTextField(
                      text: 'Doe',
                      label: S.of(context).lastname,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                EditTextField(
                  text: 'R7r8D@example.com',
                  label: S.of(context).email,
                ),
                const SizedBox(height: 25),
                EditTextField(
                  text: '+1234567890',
                  label: S.of(context).phoneNumber,
                ),
                const SizedBox(height: 25),
                PasswordEditTextField(
                  text: '*********',
                  label: S.of(context).password,
                  onChangePressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.changePassword);
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      S.of(context).gender,
                      style: const TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          value: isMaleSelected,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isMaleSelected = newValue ?? false;
                              // When Male is selected, unselect Female
                              if (isMaleSelected) isFemaleSelected = false;
                            });
                          },
                        ),
                        Text(
                          S.of(context).male,
                          style: const TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          value: isFemaleSelected,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isFemaleSelected = newValue ?? false;
                              // When Female is selected, unselect Male
                              if (isFemaleSelected) isMaleSelected = false;
                            });
                          },
                        ),
                        Text(
                          S.of(context).female,
                          style: const TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                customButton(
                  title: S.of(context).update,
                  onTap: () {},
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// <----------------Methods for image picker and permission handling are added here---------------->
  Future<void> _showImagePicker(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColor,
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: AppColors.primaryColor,
                ),
                title: Text(S.of(context).chooseFromGallery),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromGallery(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: AppColors.primaryColor,
                ),
                title: Text(S.of(context).useCamera),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromCamera(context);
                },
              ),
              // إضافة زر لمسح الصورة
              ListTile(
                leading: const Icon(
                  Icons.delete,
                  color: AppColors.primaryColor,
                ),
                title: Text(S.of(context).deletePhoto),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _deleteAvatarImage(); // مسح الصورة
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _avatarImagePath = pickedFile.path;
        });
        await _saveAvatarImage(pickedFile.path); // حفظ المسار
      }
    } else {
      _showPermissionDeniedDialog(context, 'المعرض');
    }
  }

  Future<void> _pickImageFromCamera(BuildContext context) async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _avatarImagePath = pickedFile.path;
        });
        await _saveAvatarImage(pickedFile.path); // حفظ المسار
      }
    } else {
      _showPermissionDeniedDialog(context, 'الكاميرا');
    }
  }

  Future<void> _deleteAvatarImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('avatar_image_path'); // مسح المسار المحفوظ للصورة

    setState(() {
      _avatarImagePath = null; // تحديث الحالة لإزالة الصورة
    });
  }

  void _showPermissionDeniedDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).permissionDenied),
        content: Text(
            'يجب السماح بالوصول إلى $feature لتتمكن من استخدام هذه الميزة.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
            },
            child: Text(S.of(context).sitting),
          ),
        ],
      ),
    );
  }
}
