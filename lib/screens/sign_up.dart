import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: Sizes.size20,
//           ),
//           child: Column(
//             children: [
//               Gaps.v48,
//               Text(
//                 'Sign up for TicTok',
//                 style: TextStyle(
//                   fontSize: Sizes.size20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Gaps.v10,
//               Text(
//                 'Create a profile, follow other accounts, make your won videos, and more.',
//                 style: TextStyle(
//                   fontSize: Sizes.size14,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.red,
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: Sizes.size2,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Already have an account?',
//                 style: TextStyle(
//                   fontSize: Sizes.size16,
//                 ),
//               ),
//               Gaps.h5,
//               GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   'Log in',
//                   style: TextStyle(
//                     fontSize: Sizes.size16,
//                     fontWeight: FontWeight.w600,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const LoginScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: const [
              Gaps.v80,
              Text(
                "Sign up for TikTok",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => onLoginTap(context),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
