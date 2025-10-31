import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:software_system/screens/all_prodect.dart';
import 'package:software_system/screens/forget_password.dart';
import 'package:software_system/widgets/animation_logo.dart';
import 'package:software_system/widgets/custom_text_filed.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool rememberMe = false;
  bool isloaded = false;

 
  Future<void> _handleLogin() async {
    final supabase = Supabase.instance.client;

    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('من فضلك أدخل البريد الإلكتروني وكلمة السر')),
          backgroundColor: Colors.blueGrey,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      isloaded = true;
    });

    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم تسجيل الدخول بنجاح ✅'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );

      
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AllProdect()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل تسجيل الدخول ❌'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ: $error'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      setState(() {
        isloaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1960fb), Color(0xFF3d37c1)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              width: double.infinity,
              height: 550,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const AnimatedLogo(imagePath: "assets/Images/smart_inventory.png"),
                    const Text(
                      "نبض المنتج",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "تسجيل الدخول لإدارة عملك",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 30),

                    // ---------------------- البريد الإلكتروني ----------------------
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "البريد الإلكتروني",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: email,
                      hintText: "name@gmail.com",
                      prefixIcon: Icons.email_outlined,
                    ),

                    const SizedBox(height: 10),

                    // ---------------------- كلمة السر ----------------------
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "كلمة السر",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: password,
                      hintText: "........",
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                    ),

                    // ---------------------- تذكرني ونسيت كلمة السر ----------------------
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.9,
                          child: Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                        ),
                        const Text(
                          "تذكرنى",
                          style: TextStyle( 
                            fontSize: 16,
                            color: Color(0xff97989f),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ForgetPassword()),
                            );
                          },
                          child: const Text(
                            "هل نسيت كلمة السر؟",
                            style: TextStyle(
                              color: Color(0xff155dfc),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ---------------------- زر تسجيل الدخول ----------------------
                    GestureDetector(
                      onTap: _handleLogin,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF1960fb), Color(0xFF3d37c1)],
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: double.infinity,
                          height: 40,
                          child: Center(
                            child: isloaded
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "تسجيل الدخول ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(Icons.arrow_forward, color: Colors.white),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
