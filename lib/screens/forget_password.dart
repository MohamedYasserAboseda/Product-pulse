import 'package:flutter/material.dart';
import 'package:software_system/widgets/animation_logo.dart';
import 'package:software_system/widgets/custom_text_filed.dart';

class ForgetPassword extends StatelessWidget {

   ForgetPassword({super.key});

  final   TextEditingController email = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1960fb), Color(0xFF3d37c1)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              width: double.infinity,
              height: 430,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_rounded),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "العودة لتسجيل الدخول",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  AnimatedLogo(imagePath: "assets/Images/smart_inventory.png"),
                  Text(
                    "إعادة تعيين كلمة المرور",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "أدخل بريدك الإلكتروني لتلقي رابط إعادة التعيين",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                    SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,

                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "البريد الالكتروني ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  CustomTextField(
                    controller: email,
                    hintText: "name@gmail.com",
                    prefixIcon: Icons.email_outlined,
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1960fb), Color(0xFF3d37c1)],
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      width: double.infinity,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "أرسل رابط إعادة الضبط",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 7),
                          Image.asset("assets/Images/send_icons.png" , width: 20 , height: 20,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
