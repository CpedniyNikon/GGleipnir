import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';

List<Widget> unAuthorizedActions(BuildContext context, Callback callback) {
  return <Widget>[
    InkWell(
      onTap: () {
        _showLoginDialog(context, callback);
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Вход"),
      ),
    ),
    InkWell(
      onTap: () {
        _showRegistrationDialog(context, callback);
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Регистрация"),
      ),
    ),

  ];
}

void _showLoginDialog(BuildContext context, Callback callback) {
  final Controller controller = Get.find();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black38.withOpacity(0.8),
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      titlePadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: FractionalOffset.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear),
            ),
          ),
          Text(
            'Войти в GGleipnir',
            style: GGTypography.header1.apply(),
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Логин'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: loginController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Пароль'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final result = await controller.login(loginController.text, passwordController.text);
                if(result) {
                  Navigator.of(context).pop();
                } else {
                  loginController.clear();
                  passwordController.clear();
                  callback();
                }
              },
              child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: const Center(child: Text('Войти'))),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showRegistrationDialog(BuildContext context, Callback callback) {
  final Controller controller = Get.find();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black38.withOpacity(0.8),
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      titlePadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: FractionalOffset.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear),
            ),
          ),
          Text(
            'Присоединяйтесь к GGleipnir',
            style: GGTypography.header1.apply(),
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Имя пользователя'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Логин'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: loginController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Пароль'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                controller.register(loginController.text,
                    passwordController.text, nameController.text, 'metainfa');
                Navigator.of(context).pop();
              },
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text('Зарегистрироваться'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
