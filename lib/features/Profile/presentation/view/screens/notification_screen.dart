import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
        title: Text(
          S.of(context).notifications,
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              NewOrder(),
              RememberOrder(),
            ],
          );
        },
      ),
    );
  }
}

// <-----------------------------NewOrder widget----------------------------->
class NewOrder extends StatelessWidget {
  const NewOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.backgroundColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  S.of(context).newOffer,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Tristique et mauris sem congue in felis id nec. Amet sed morbi bibendum vestibulum.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// <-----------------------------RememberOrder widget----------------------------->
class RememberOrder extends StatelessWidget {
  const RememberOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.backgroundColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  S.of(context).rememberOrder,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Tristique et mauris sem congue in felis id nec. Amet sed morbi bibendum vestibulum.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
