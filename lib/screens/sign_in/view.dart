import 'package:chat_app/screens/sign_in/index.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Card(
        margin: EdgeInsets.only(top: 76),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: AssetImage(
              'assets/images/chat.png',
            ),
            width: 76,
            height: 76,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _buildSignInWidget() {
      return Container(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  controller.handleSignIn();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Google Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome Back!",
              style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            // _buildLogo(),
            // Spacer(),
            // _buildTextField(
            //   controller: controller.emailController,
            //   label: 'Email',
            //   icon: Icons.email,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            const SizedBox(
              height: 200,
            ),
            // _buildTextField(
            //   controller: controller.passwordController,
            //   label: 'Password',
            //   icon: Icons.lock,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     controller.signInWithEmailAndPassword().then(
            //           (value) => Get.offAndToNamed(AppRoutes.Application),
            //     );
            //   },
            //   child: const Text('Continue with Email',),
            // ),
            _buildSignInWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required final TextEditingController controller,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}
