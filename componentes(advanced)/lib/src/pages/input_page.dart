import 'package:componentes/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'firts_Name': 'Ruben',
      'email': 'ferenandez@coreeo.com',
      'password': '123456',
      'role': 'admin'
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text("inputs de Texto"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: Form(
                  key: myFormKey,
                  child: Column(children: [
                    //*****Nombre***** */
                    CustomInputField(
                      labelText: 'Nombre',
                      helperText: 'Nombre del usuario',
                      hintText: 'Escriba el usuario',
                      formProperty: 'first_name',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 30),
                    //*******Email***** */
                    CustomInputField(
                      labelText: 'Email',
                      helperText: 'Email del usuario',
                      hintText: 'Email del usuario',
                      type: TextInputType.emailAddress,
                      formProperty: 'email',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 30),
                    /*******PASWORD***** */
                    CustomInputField(
                      labelText: 'Password',
                      helperText: 'Password del usuario',
                      hintText: 'Escriba el Password',
                      isPassword: true,
                      formProperty: 'password',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 30),
                    DropdownButtonFormField<String>(
                        items: const [
                          DropdownMenuItem(
                              value: 'Admin', child: Text('Admin')),
                          DropdownMenuItem(
                              value: 'SuperUser', child: Text('SuperUser')),
                          DropdownMenuItem(value: 'Dev', child: Text('Dev')),
                          DropdownMenuItem(
                              value: 'Jr.Dev', child: Text('Jr.Dev'))
                        ],
                        onChanged: (value) {
                          formValues['role'] = value ?? 'Admin';
                        }),

                    const SizedBox(height: 30),
                    /******BOTON** */
                    ElevatedButton(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text('Guardar'),
                      ),
                      onPressed: () {
                        FocusScope.of(context)
                            .requestFocus(FocusNode()); //quita el teclado
                        if (!myFormKey.currentState!.validate()) {
                          print('Formulario no valido');
                        }
                        print(formValues);
                      },
                    )
                  ]),
                ))));
  }
}
