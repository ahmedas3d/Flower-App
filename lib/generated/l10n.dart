// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Flowers`
  String get flowers {
    return Intl.message(
      'Flowers',
      name: 'flowers',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enteryourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enteryourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enteryourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enteryourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberpassword {
    return Intl.message(
      'Remember me',
      name: 'rememberpassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotpassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotpassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue as guest`
  String get continuewithguest {
    return Intl.message(
      'Continue as guest',
      name: 'continuewithguest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get donthaveanaccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Up`
  String get signup {
    return Intl.message(
      ' Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get enteryourfirstname {
    return Intl.message(
      'Enter your first name',
      name: 'enteryourfirstname',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get enteryourlastname {
    return Intl.message(
      'Enter your last name',
      name: 'enteryourlastname',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your confirmation password`
  String get enteryourConfirmPassword {
    return Intl.message(
      'Enter your confirmation password',
      name: 'enteryourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enteryourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enteryourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get pleaseFillAllFields {
    return Intl.message(
      'Please fill all fields',
      name: 'pleaseFillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Creating an account, you agree to our`
  String get creatingAnAccountYouAgreeToOur {
    return Intl.message(
      'Creating an account, you agree to our',
      name: 'creatingAnAccountYouAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login here`
  String get loginHere {
    return Intl.message(
      'Login here',
      name: 'loginHere',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Saved Addresses`
  String get sacedAddresses {
    return Intl.message(
      'Saved Addresses',
      name: 'sacedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get deliverTo {
    return Intl.message(
      'Deliver to',
      name: 'deliverTo',
      desc: '',
      args: [],
    );
  }

  /// `Discover something now`
  String get descoverSomethingNow {
    return Intl.message(
      'Discover something now',
      name: 'descoverSomethingNow',
      desc: '',
      args: [],
    );
  }

  /// `Gift Now`
  String get giftNow {
    return Intl.message(
      'Gift Now',
      name: 'giftNow',
      desc: '',
      args: [],
    );
  }

  /// `It's time to celebrate all grads with happiness`
  String get happyGraduation {
    return Intl.message(
      'It\'s time to celebrate all grads with happiness',
      name: 'happyGraduation',
      desc: '',
      args: [],
    );
  }

  /// `Discover the perfect\nbirthday gift`
  String get birthdayGift {
    return Intl.message(
      'Discover the perfect\nbirthday gift',
      name: 'birthdayGift',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Gifts`
  String get gifts {
    return Intl.message(
      'Gifts',
      name: 'gifts',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get cards {
    return Intl.message(
      'Cards',
      name: 'cards',
      desc: '',
      args: [],
    );
  }

  /// `Jewellery`
  String get jewellery {
    return Intl.message(
      'Jewellery',
      name: 'jewellery',
      desc: '',
      args: [],
    );
  }

  /// `Best Sellers`
  String get bestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'bestSellers',
      desc: '',
      args: [],
    );
  }

  /// `Occasion`
  String get occasion {
    return Intl.message(
      'Occasion',
      name: 'occasion',
      desc: '',
      args: [],
    );
  }

  /// `Wedding`
  String get wedding {
    return Intl.message(
      'Wedding',
      name: 'wedding',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Graduation`
  String get graduation {
    return Intl.message(
      'Graduation',
      name: 'graduation',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Categorys`
  String get categorys {
    return Intl.message(
      'Categorys',
      name: 'categorys',
      desc: '',
      args: [],
    );
  }

  /// `Bloom with our exquisite best sellers`
  String get bloom {
    return Intl.message(
      'Bloom with our exquisite best sellers',
      name: 'bloom',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Katb Ketab`
  String get katbKetab {
    return Intl.message(
      'Katb Ketab',
      name: 'katbKetab',
      desc: '',
      args: [],
    );
  }

  /// `Engagement`
  String get engagement {
    return Intl.message(
      'Engagement',
      name: 'engagement',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thankYou {
    return Intl.message(
      'Thank you',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `Get well`
  String get getWell {
    return Intl.message(
      'Get well',
      name: 'getWell',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status {
    return Intl.message(
      'Status:',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `In Stock`
  String get inStock {
    return Intl.message(
      'In Stock',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `All prices include tax:`
  String get allPricesIncludeTax {
    return Intl.message(
      'All prices include tax:',
      name: 'allPricesIncludeTax',
      desc: '',
      args: [],
    );
  }

  /// `15 Pink Rose Bouquet`
  String get bouquet {
    return Intl.message(
      '15 Pink Rose Bouquet',
      name: 'bouquet',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, in semper ante commodo. Etiam in lectus vitae libero convallis vestibulum. `
  String get descriptionText {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, in semper ante commodo. Etiam in lectus vitae libero convallis vestibulum. ',
      name: 'descriptionText',
      desc: '',
      args: [],
    );
  }

  /// `Bouquet include`
  String get bouquetInclude {
    return Intl.message(
      'Bouquet include',
      name: 'bouquetInclude',
      desc: '',
      args: [],
    );
  }

  /// `Pink roses:15`
  String get pinkRoses {
    return Intl.message(
      'Pink roses:15',
      name: 'pinkRoses',
      desc: '',
      args: [],
    );
  }

  /// `White wrap`
  String get whiteWrap {
    return Intl.message(
      'White wrap',
      name: 'whiteWrap',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Logout`
  String get confirmLogout {
    return Intl.message(
      'Confirm Logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get areYouSureYouWantToLogout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'areYouSureYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Logout Successfully`
  String get logoutSuccessfully {
    return Intl.message(
      'Logout Successfully',
      name: 'logoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get useCamera {
    return Intl.message(
      'Camera',
      name: 'useCamera',
      desc: '',
      args: [],
    );
  }

  /// `Delete Photo`
  String get deletePhoto {
    return Intl.message(
      'Delete Photo',
      name: 'deletePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Permission Denied`
  String get permissionDenied {
    return Intl.message(
      'Permission Denied',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Sitting`
  String get sitting {
    return Intl.message(
      'Sitting',
      name: 'sitting',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstname {
    return Intl.message(
      'First Name',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastname {
    return Intl.message(
      'Last Name',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get enteryourNewPassword {
    return Intl.message(
      'Enter your new password',
      name: 'enteryourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentpassword {
    return Intl.message(
      'Current password',
      name: 'currentpassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your current password`
  String get enteryourCurrentPassword {
    return Intl.message(
      'Enter your current password',
      name: 'enteryourCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter`
  String get pleaseEnter {
    return Intl.message(
      'Please Enter',
      name: 'pleaseEnter',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `New Offer 😍`
  String get newOffer {
    return Intl.message(
      'New Offer 😍',
      name: 'newOffer',
      desc: '',
      args: [],
    );
  }

  /// `Remember ⏰`
  String get rememberOrder {
    return Intl.message(
      'Remember ⏰',
      name: 'rememberOrder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
