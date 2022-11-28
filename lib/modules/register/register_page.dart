import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademaster/modules/register/register_controller.dart';
import 'package:trademaster/modules/widgets/widget_form_field.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.black45,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://www.trademaster.com.br/wp-content/uploads/2022/08/branco.png',
                        width: Get.width * 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              WidgetFormField(
                                label: 'E-mail',
                                controller: controller.emailEC,
                                validator: Validatorless.multiple([
                                  Validatorless.required('Email obrigatório'),
                                  Validatorless.email('E-mail inválido')
                                ]),
                              ),
                              const SizedBox(height: 20),
                              Obx(() {
                                return WidgetFormField(
                                  label: 'Senha',
                                  controller: controller.passwordEC,
                                  obscureText: controller.eyesValue.value,
                                  icon: IconButton(
                                    onPressed: () {
                                      controller.eyesValue.toggle();
                                    },
                                    icon: controller.eyesValue.value
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color:
                                                Color.fromRGBO(64, 185, 178, 1),
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color:
                                                Color.fromRGBO(64, 185, 178, 1),
                                          ),
                                  ),
                                );
                              }),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  final formValid =
                                      _formkey.currentState?.validate() ??
                                          false;
                                  if (formValid) {
                                    final email = controller.emailEC.text;
                                    final password = controller.passwordEC.text;
                                    controller.registerUser(email, password);
                                    Get.offAllNamed('/list');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(64, 185, 178, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Login'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
