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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Sign In`
  String get login {
    return Intl.message('Sign In', name: 'login', desc: '', args: []);
  }

  /// `Flowers`
  String get flowers {
    return Intl.message('Flowers', name: 'flowers', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
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
    return Intl.message('Password', name: 'password', desc: '', args: []);
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
    return Intl.message(' Sign Up', name: 'signup', desc: '', args: []);
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
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
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
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
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
    return Intl.message('Login here', name: 'loginHere', desc: '', args: []);
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
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Deliver to`
  String get deliverTo {
    return Intl.message('Deliver to', name: 'deliverTo', desc: '', args: []);
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
    return Intl.message('Gift Now', name: 'giftNow', desc: '', args: []);
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
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Gifts`
  String get gifts {
    return Intl.message('Gifts', name: 'gifts', desc: '', args: []);
  }

  /// `Cards`
  String get cards {
    return Intl.message('Cards', name: 'cards', desc: '', args: []);
  }

  /// `Jewellery`
  String get jewellery {
    return Intl.message('Jewellery', name: 'jewellery', desc: '', args: []);
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
    return Intl.message('Occasion', name: 'occasion', desc: '', args: []);
  }

  /// `Wedding`
  String get wedding {
    return Intl.message('Wedding', name: 'wedding', desc: '', args: []);
  }

  /// `Birthday`
  String get birthday {
    return Intl.message('Birthday', name: 'birthday', desc: '', args: []);
  }

  /// `Graduation`
  String get graduation {
    return Intl.message('Graduation', name: 'graduation', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Categorys`
  String get categorys {
    return Intl.message('Categorys', name: 'categorys', desc: '', args: []);
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
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Katb Ketab`
  String get katbKetab {
    return Intl.message('Katb Ketab', name: 'katbKetab', desc: '', args: []);
  }

  /// `Engagement`
  String get engagement {
    return Intl.message('Engagement', name: 'engagement', desc: '', args: []);
  }

  /// `Thank you`
  String get thankYou {
    return Intl.message('Thank you', name: 'thankYou', desc: '', args: []);
  }

  /// `Get well`
  String get getWell {
    return Intl.message('Get well', name: 'getWell', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Status:`
  String get status {
    return Intl.message('Status:', name: 'status', desc: '', args: []);
  }

  /// `In Stock`
  String get inStock {
    return Intl.message('In Stock', name: 'inStock', desc: '', args: []);
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
    return Intl.message('Pink roses:15', name: 'pinkRoses', desc: '', args: []);
  }

  /// `White wrap`
  String get whiteWrap {
    return Intl.message('White wrap', name: 'whiteWrap', desc: '', args: []);
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
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Log Out Successfully`
  String get logoutSuccessfully {
    return Intl.message(
      'Log Out Successfully',
      name: 'logoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `See you soon`
  String get seeYouSoon {
    return Intl.message('See you soon', name: 'seeYouSoon', desc: '', args: []);
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
    return Intl.message('Camera', name: 'useCamera', desc: '', args: []);
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
    return Intl.message('Sitting', name: 'sitting', desc: '', args: []);
  }

  /// `First Name`
  String get firstname {
    return Intl.message('First Name', name: 'firstname', desc: '', args: []);
  }

  /// `Last Name`
  String get lastname {
    return Intl.message('Last Name', name: 'lastname', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
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
    return Intl.message('Change', name: 'change', desc: '', args: []);
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
    return Intl.message('New Offer 😍', name: 'newOffer', desc: '', args: []);
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

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
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

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Enter your Address`
  String get enterYourAddress {
    return Intl.message(
      'Enter your Address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Recipient Name`
  String get recipientName {
    return Intl.message(
      'Recipient Name',
      name: 'recipientName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Recipient Name`
  String get enteryourRecipientName {
    return Intl.message(
      'Enter your Recipient Name',
      name: 'enteryourRecipientName',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message('Area', name: 'area', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message('Track Order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message('Sort by', name: 'sortBy', desc: '', args: []);
  }

  /// `Lowes Price`
  String get lowesPrice {
    return Intl.message('Lowes Price', name: 'lowesPrice', desc: '', args: []);
  }

  /// `Highes Price`
  String get highesPrice {
    return Intl.message(
      'Highes Price',
      name: 'highesPrice',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newe {
    return Intl.message('New', name: 'newe', desc: '', args: []);
  }

  /// `Old`
  String get old {
    return Intl.message('Old', name: 'old', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message('Sub Total', name: 'subTotal', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Login Required`
  String get loginRequired {
    return Intl.message(
      'Login Required',
      name: 'loginRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please log in to access your profile.`
  String get pleaseLogIn {
    return Intl.message(
      'Please log in to access your profile.',
      name: 'pleaseLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty! Start shopping now.`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty! Start shopping now.',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `No Product In Cart`
  String get noProductInCart {
    return Intl.message(
      'No Product In Cart',
      name: 'noProductInCart',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message('Facebook', name: 'facebook', desc: '', args: []);
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `About Us?`
  String get aboutUsQuestion {
    return Intl.message(
      'About Us?',
      name: 'aboutUsQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Flower App, your go-to destination for beautiful and fresh flowers at your fingertips. We believe every moment—big or small—deserves to be celebrated with the natural beauty of flowers. With a passion for quality and creativity, our app offers a seamless shopping experience where you can explore a wide range of floral arrangements, bouquets, and gifts tailored to every occasion. Whether it’s a birthday, anniversary, or just a gesture to show you care, we’ve got you covered. We source flowers directly from trusted growers to ensure freshness, offer fast same-day or scheduled delivery, and provide customizable designs to make every moment unique. At Flowe App, we are committed to spreading joy and love through the timeless elegance of flowers. Let us help you create memories that bloom forever.`
  String get aboutDescription {
    return Intl.message(
      'Welcome to Flower App, your go-to destination for beautiful and fresh flowers at your fingertips. We believe every moment—big or small—deserves to be celebrated with the natural beauty of flowers. With a passion for quality and creativity, our app offers a seamless shopping experience where you can explore a wide range of floral arrangements, bouquets, and gifts tailored to every occasion. Whether it’s a birthday, anniversary, or just a gesture to show you care, we’ve got you covered. We source flowers directly from trusted growers to ensure freshness, offer fast same-day or scheduled delivery, and provide customizable designs to make every moment unique. At Flowe App, we are committed to spreading joy and love through the timeless elegance of flowers. Let us help you create memories that bloom forever.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `By using Flowe App, you agree to our Terms and Privacy Policy. The app is designed for personal use only, and any misuse or activities that harm the platform or other users are prohibited. You are responsible for safeguarding your account credentials and notifying us immediately of any unauthorized access. Prices are subject to change without prior notice, and delivery times are estimates that may vary due to external factors. Orders can be canceled within [specific time frame], provided they have not been processed, and refunds will be issued according to our policy. All content, including text, images, and designs, is owned by Flowe App and protected by copyright laws. Unauthorized reproduction or distribution is strictly prohibited. We are not responsible for any indirect damages, delays, or errors resulting from the use of the app. Your privacy is important to us; please review our Privacy Policy to understand how your data is handled. By continuing to use the app, you confirm your acceptance of these Terms. For any questions or concerns, contact us at `
  String get termsAndSOnditionsDescription {
    return Intl.message(
      'By using Flowe App, you agree to our Terms and Privacy Policy. The app is designed for personal use only, and any misuse or activities that harm the platform or other users are prohibited. You are responsible for safeguarding your account credentials and notifying us immediately of any unauthorized access. Prices are subject to change without prior notice, and delivery times are estimates that may vary due to external factors. Orders can be canceled within [specific time frame], provided they have not been processed, and refunds will be issued according to our policy. All content, including text, images, and designs, is owned by Flowe App and protected by copyright laws. Unauthorized reproduction or distribution is strictly prohibited. We are not responsible for any indirect damages, delays, or errors resulting from the use of the app. Your privacy is important to us; please review our Privacy Policy to understand how your data is handled. By continuing to use the app, you confirm your acceptance of these Terms. For any questions or concerns, contact us at ',
      name: 'termsAndSOnditionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `ahmedxasaad@gmail.com`
  String get myEmail {
    return Intl.message(
      'ahmedxasaad@gmail.com',
      name: 'myEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Verify`
  String get emailVerify {
    return Intl.message(
      'Email Verify',
      name: 'emailVerify',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get emailVerification {
    return Intl.message(
      'Email Verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your code that send to your\n email address.`
  String get sendCodeIntoYourEmail {
    return Intl.message(
      'Please enter your code that send to your\n email address.',
      name: 'sendCodeIntoYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Check your email url`
  String get checkYourEmail {
    return Intl.message(
      'Check your email url',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code? `
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive code? ',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Delivery Time`
  String get deliveryTime {
    return Intl.message(
      'Delivery Time',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Pay with cash when receiving order`
  String get cashOnDeliveryDescription {
    return Intl.message(
      'Pay with cash when receiving order',
      name: 'cashOnDeliveryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message('Credit Card', name: 'creditCard', desc: '', args: []);
  }

  /// `Pay using credit/debit card`
  String get creditCardDescription {
    return Intl.message(
      'Pay using credit/debit card',
      name: 'creditCardDescription',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `It is a gift`
  String get itIsAGift {
    return Intl.message('It is a gift', name: 'itIsAGift', desc: '', args: []);
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `Location Required`
  String get locationRequired {
    return Intl.message(
      'Location Required',
      name: 'locationRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location services to use this feature.`
  String get enableLocationMessage {
    return Intl.message(
      'Please enable location services to use this feature.',
      name: 'enableLocationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Permission Required`
  String get permissionRequired {
    return Intl.message(
      'Permission Required',
      name: 'permissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Location permission is required to get your current location.`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission is required to get your current location.',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied. Please enable them in app settings.`
  String get locationPermissionPermanentlyDenied {
    return Intl.message(
      'Location permissions are permanently denied. Please enable them in app settings.',
      name: 'locationPermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Your order placed successfully!`
  String get orderSuccess {
    return Intl.message(
      'Your order placed successfully!',
      name: 'orderSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Preparing your order`
  String get preparingYourOrder {
    return Intl.message(
      'Preparing your order',
      name: 'preparingYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Out for delivery`
  String get outForDelivery {
    return Intl.message(
      'Out for delivery',
      name: 'outForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Show Map`
  String get showMap {
    return Intl.message('Show Map', name: 'showMap', desc: '', args: []);
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email associated to\n your account`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email associated to\n your account',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least`
  String get passwordDescription {
    return Intl.message(
      'Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least',
      name: 'passwordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered enjoy your order`
  String get orderdelivered {
    return Intl.message(
      'Order delivered enjoy your order',
      name: 'orderdelivered',
      desc: '',
      args: [],
    );
  }

  /// `Reorder`
  String get reorder {
    return Intl.message('Reorder', name: 'reorder', desc: '', args: []);
  }

  /// `Rate`
  String get rate {
    return Intl.message('Rate', name: 'rate', desc: '', args: []);
  }

  /// `Add to cart successfully`
  String get addToCartSuccessfully {
    return Intl.message(
      'Add to cart successfully',
      name: 'addToCartSuccessfully',
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
