import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practice12/theme/modelTheme.dart';
import 'package:practice12/helpers/size_config.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  int numScreen = 1;
  getPage() {
    switch (numScreen) {
      case 1:
        return phoneForm();
        break;
      case 2:
        return emailForm();
        break;
      default:
    }
  }

  SetPage(value) {
    setState(() {
      numScreen = value;
    });
  }

  Widget emailForm() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Вход по Email',
              style: TextStyle(fontSize: 14),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  numScreen = 3;
                });
              },
              child: Row(
                children: [
                  Text(
                    'Регистрация',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Электронная почта',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (input) {
                  //_email =input;
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFC5CEE0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFC5CEE0)),
                  ),
                  hintText: 'Example@mail.com',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Пароль',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFC5CEE0)),
                  ),
                  hintText: 'Введите пароль',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Color(0xFFE7EBF2),
              ),
              SizedBox(
                height: 20,
              ),
              socialLink()
            ]),
          ),
        )
      ],
    );
  }

  Widget phoneForm() {
    return Column(
      children: [
        Text('Добро пожаловать', style: TextStyle(fontSize: 14)),
        SizedBox(
          height: 9,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Номер телефона',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC5CEE0))),
                    hintText: '+7 XXX XXX XX XX',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Color(0xFFE7EBF2),
              ),
              SizedBox(
                height: 20,
              ),
              socialLink()
            ],
          ),
        )
      ],
    );
  }

  Widget _authButton(context,
      {required IconData iconName, required Function func}) {
    return Container(
      height: 25,
      width: 25,
      child: TextButton(
          onPressed: () {
            func();
          },
          child: Icon(iconName)),
    );
  }

  Widget socialLink() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Войти с помощью',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(),
            if (Platform.isAndroid)
              numScreen == 1
                  ? _authButton(context,
                      iconName: Icons.email, func: () => SetPage(2))
                  : _authButton(context,
                      iconName: Icons.phone, func: () => SetPage(1)),
            Container()
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.height - 110;
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Авторизация'),
            actions: [
              IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
              )
            ],
          ),
          body: numScreen != 4
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Вход в систему',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      getPage(),
                    ]))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Вход в систему',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.only(
                            left: mediaQuery / 27.62,
                            right: mediaQuery / 27.62),
                        child: Column(
                          children: [
                            Container(
                              height: 50.0.toAdaptive(context),
                              child: Center(
                                child: Image.asset("assets/icon.png"),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Введите полученный код',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 10,
                                    right:
                                        MediaQuery.of(context).size.width / 10,
                                  ),
                                  child: PinPut(
                                      onSubmit: (value) async {},
                                      fieldsCount: 6,
                                      fieldsAlignment:
                                          MainAxisAlignment.spaceAround,
                                      animationDuration: Duration(seconds: 0),
                                      textStyle: TextStyle(
                                          fontSize: 28,
                                          color: Color(0xFF323232)),
                                      preFilledWidget: Container(
                                        width: 12,
                                        height: 2,
                                        color: Color.fromRGBO(197, 206, 224, 1),
                                      )),
                                )
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
    });
  }
}
