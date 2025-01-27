import 'dart:io';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/helper/photo_helper.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/Profile/presentation/view/widgets/notification_row.dart';
import 'package:flower_app/features/Profile/presentation/view/widgets/row_settings.dart';
import 'package:flower_app/features/Profile/presentation/view/widgets/show_logout_confirm.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/language_row.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _avatarImagePath;

  @override
  void initState() {
    super.initState();
    _loadAvatarImage(); // تحميل الصورة من SharedPreferences عند بدء الشاشة
  }

  // دالة لتحميل الصورة من SharedPreferences
  Future<void> _loadAvatarImage() async {
    final path = await AvatarHelper.getAvatarImagePath();
    setState(() {
      _avatarImagePath = path; // تعيين المسار
    });
  }

  // دالة لاختيار صورة من المعرض
  Future<void> _pickImageFromGallery() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // حفظ المسار في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('avatar_image_path', pickedFile.path);

        setState(() {
          _avatarImagePath = pickedFile.path; // تحديث الصورة في الواجهة
        });
      }
    }
  }

  // دالة لاختيار صورة باستخدام الكاميرا
  Future<void> _pickImageFromCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        // حفظ المسار في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('avatar_image_path', pickedFile.path);

        setState(() {
          _avatarImagePath = pickedFile.path; // تحديث الصورة في الواجهة
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Flower.svg',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            Text(
              'Flowery',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'IM FELL English',
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.notificationScreen);
            },
            icon: Badge.count(
              count: 3,
              child: const Icon(
                Icons.notifications_none_outlined,
                size: 26,
                color: AppColors.textColor1,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textColor1,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.profileEdit);
                    },
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'R7r8D@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              RowSettings(
                icon: Icons.receipt,
                title: S.of(context).myOrders,
                iconTwo: Icons.arrow_forward_ios,
                color: AppColors.greyColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.myOrderScreen);
                },
              ),
              const SizedBox(height: 25),
              RowSettings(
                icon: Icons.location_on,
                title: S.of(context).sacedAddresses,
                iconTwo: Icons.arrow_forward_ios,
                color: AppColors.greyColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.savedAddress);
                },
              ),
              const SizedBox(height: 25),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
                height: 1.5,
              ),
              const SizedBox(height: 15),
              NotificationRow(),
              const SizedBox(height: 15),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
                height: 1.5,
              ),
              const SizedBox(height: 15),
              LanguageRow(),
              const SizedBox(height: 15),
              RowSettings(
                title: S.of(context).aboutUs,
                icon: Icons.info,
                iconTwo: Icons.arrow_forward_ios,
                color: AppColors.greyColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.aboutScreen);
                },
              ),
              const SizedBox(height: 25),
              RowSettings(
                title: S.of(context).termsAndConditions,
                icon: Icons.policy,
                iconTwo: Icons.arrow_forward_ios,
                color: AppColors.greyColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.tremsAndConditionView);
                },
              ),
              const SizedBox(height: 25),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
                height: 1.5,
              ),
              const SizedBox(height: 25),
              RowSettings(
                title: S.of(context).logout,
                icon: Icons.logout,
                iconTwo: Icons.logout,
                color: AppColors.errorColor,
                onPressed: () {
                  showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
