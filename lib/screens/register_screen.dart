import 'package:flutter/material.dart';
import 'package:k2/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late String tempPasswd;
  late String email = '';
  late String passwd = '';

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
                    "가입 완료",
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
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                "회원가입",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: formKey,
              // height: 200,
              child: Column(
                children: [
                  Container(height: 32.0),
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
                    ),
                    obscureText: true,
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
                  ),
                  Container(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '비밀번호 확인',
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
                    obscureText: true,
                    onSaved: (val) {},
                    validator: (val) {
                      if (val!.isEmpty) {
                        return '비밀번호는 필수사항입니다.';
                      }

                      if (val != tempPasswd) {
                        return '비밀번호가 다릅니다.';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            Container(height: 32.0),
            SizedBox(
                width: double.infinity,
                height: 80,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      onSubmitPressed();
                    }
                  },
                  child: const Text('가입 완료',
                      style: TextStyle(
                        fontSize: 24,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
