import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ya9in/screens/home_screen.dart';
import 'package:ya9in/screens/user_info_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  // final String verificationId;
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  // verify otp
  // void verifyOtp(BuildContext context, String userOtp) {
  //   final ap = Provider.of<PhoneVerification>(context, listen: false);
  //   ap.verifyOtp(
  //       context: context,
  //       verificationId: widget.verificationId,
  //       userOtp: userOtp,
  //       onSuccess: () {
  //         // Navigate to the checkout screen
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => HomeScreen(),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    final isLoading = false;
    // Provider.of<PhoneVerification>(context, listen: true).isLoading;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: isLoading == true
              ? Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        // back button
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/phone.png'),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Enter the code",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Enter the OTP code that's been sent to your number to verify your account.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Pinput(
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onCompleted: (value) {
                            setState(() {
                              otpCode = value;
                            });
                          },
                        ),
                        const SizedBox(height: 25),
                        CustomButtonBox(
                          onTap: () {
                            if (otpCode != null && otpCode!.length == 6) {
                              // verifyOtp(context, otpCode!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserInfoScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Enter 6-digit code'),
                              ));
                            }
                          },
                          title: 'Verify',
                          isDisabled: false,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Didn't receive any code?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Resend new code",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: appPrimary,
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
