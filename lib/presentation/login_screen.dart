import 'package:apiexample/core/api_requests.dart';
import 'package:apiexample/core/api_service.dart';
import 'package:apiexample/model/login_model.dart';
import 'package:apiexample/presentation/dashboard_screen.dart';
import 'package:apiexample/utils/custom_snackbar.dart';
import 'package:apiexample/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> _login({
    required String username,
    required String password,
  }) async {
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
    });

    final loginModel = LoginModel(
      username: username,
      password: password,
    );

    final response = await ApiService.post(
      url: ApiRequests.login,
      body: loginModel.toJson(),
    );

    final userToken = response['token'];
    Map<String, dynamic> decodedToken = JwtDecoder.decode(userToken);
    final userId = decodedToken['sub'];
    await SharedPrefs.setIntValue(key: SharedPrefs.userIdKey, value: userId);

    if (!mounted) return;

    CustomSnackbar.successSnackBar(
      context: context,
      message: "Login successful",
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
      (val) => false,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  enabled: !isLoading,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  enabled: !isLoading,
                  obscuringCharacter: '*',
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final password = passwordController.text.trim();
                    final username = usernameController.text.trim();
                    if (password.isNotEmpty && username.isNotEmpty) {
                      await _login(username: username, password: password);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please fill username and password",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
