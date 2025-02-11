import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoLogin extends StatelessWidget {
  const NoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // يمكنك تغيير اللون حسب التصميم
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // عرض رسوم Lottie المتحركة
              Lottie.network(
                'https://lottie.host/93449b36-aaa4-4b9a-90a9-169c362b4085/5mxR5Qp97o.json',
              ),
              Text(
                S.of(context).loginRequired,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // يمكنك تغيير اللون حسب التصميم
                ),
              ),
              const SizedBox(height: 10), // تباعد بين العناصر
              // نص توضيحي إضافي
              Text(
                S.of(context).pleaseLogIn,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // يمكنك تغيير اللون حسب التصميم
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30), // تباعد بين العناصر
              // زر "Log In"
              ElevatedButton(
                onPressed: () {
                  // إعادة توجيه المستخدم إلى صفحة تسجيل الدخول
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor, // لون الزر
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  S.of(context).login,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white, // لون النص على الزر
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
