import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String pageName = 'Home';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [_TopHome(), _LoginForm()],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          width: double.infinity,
          height: 200,
          child: _LoginFields(),
        ),
      ),
    );
  }
}

class _LoginFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Form(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.blue,
                  hintText: 'Ingrese usuario',
                  labelText: 'Usuario',
                  labelStyle: TextStyle(),
                  prefixIcon: Icon(Icons.perm_identity_outlined),
                  fillColor: Colors.blue,
                ),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.blue,
                  hintText: 'Ingrese usuario',
                  labelText: 'Usuario',
                  labelStyle: TextStyle(),
                  prefixIcon: Icon(Icons.perm_identity_outlined),
                  fillColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      );
  }
}

class _TopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: Stack(
              children: [
                Image(image: AssetImage('assets/menu-img.jpg')),
                Center(
                    child: Icon(Icons.verified_user_sharp,
                        color: Colors.white, size: 250)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
