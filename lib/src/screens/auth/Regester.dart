import 'package:flutter/material.dart';
import 'package:my_app/src/screens/auth/login_list.dart';
import 'package:my_app/src/screens/auth/signup_list.dart';

class RegesterScreen extends StatefulWidget {
  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  bool choose = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1623407125356-49386c0fdf00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.color,
                        color: Theme.of(context).primaryColor),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            fixedSize: Size(150, 50),
                            primary: Colors.white,
                            shadowColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              choose = true;
                            });
                          },
                          label: Text('login'),
                          icon: Icon(Icons.login),
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            fixedSize: Size(150, 50),
                            primary: Colors.white,
                            shadowColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            print('sign up');
                            setState(() {
                              choose = false;
                            });
                          },
                          label: Text('Sign up'),
                          icon: Icon(Icons.add),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        Expanded(
          flex: 5,
          child: choose ? const LoginInput() : const Singup(),
        ),
      ]),
    );
  }
}
