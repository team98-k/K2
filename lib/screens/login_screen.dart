import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:k2/screens/pomodoros_screen.dart';
import 'package:k2/screens/register_screen.dart';
import 'package:k2/widgets/bottom_navi.dart';
import 'package:k2/widgets/top_bar.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late String tempPasswd = '';
  late String email = '';
  late String passwd = '';
  late bool secureTempPasswd = true;
  late bool securePasswd = true;
  void onSubmitPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Expanded(
                  child: Text(
                    "로그인",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("확인"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PomodorosScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          );
        });
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(
        title: '로그인',
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: '이메일',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 200, 200, 200),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 250, 250, 250),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 200, 200, 200),
                  ),
                ),
                floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.black;
                  return TextStyle(
                      color: color, letterSpacing: 1.3, fontSize: 20);
                }),
              ),
              onSaved: (val) {
                setState(() {
                  email = val!;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return '이메일은 필수사항입니다.';
                }

                if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(val)) {
                  return '잘못된 이메일 형식입니다.';
                }

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Container(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: '비밀번호',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 200, 200, 200),
                  ),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 250, 250, 250),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 200, 200, 200),
                  ),
                ),
                floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.black;
                  return TextStyle(
                      color: color, letterSpacing: 1.3, fontSize: 20);
                }),
                suffixIcon: IconButton(
                  icon: secureTempPasswd
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.lock_open),
                  onPressed: () {
                    setState(() {
                      secureTempPasswd = !secureTempPasswd;
                    });
                  },
                ),
              ),
              obscureText: secureTempPasswd,
              onSaved: (val) {
                setState(() {
                  passwd = val!;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return '비밀번호는 필수사항입니다.';
                }

                tempPasswd = val;
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Container(
              height: 16.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                onPressed: () async {
                  formKey.currentState!.save();
                  onSubmitPressed();
                  if (formKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email, password: passwd);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const Icon(Icons.login),
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person_add_alt_outlined),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavi(),
    );
  }
}
