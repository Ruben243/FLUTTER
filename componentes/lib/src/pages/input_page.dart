import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  // ignore: prefer_final_fields
  List<String> _poderes = ['Congelacion', 'Convocar armas', 'curacion'];

  String _opcionSeleccionada = "Armas";
  // ignore: prefer_final_fields
  TextEditingController _inputFielddateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("inputs de Texto"),
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            children: <Widget>[
              _crearInput(),
              const Divider(),
              _crearEmail(),
              const Divider(),
              _crearPassword(),
              const Divider(),
              _crearFecha(context),
              const Divider(),
              _crearDropDown(),
              const Divider(),
              _crearPersona(),
            ]));
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        //decoracion del input
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Caracteres ${_nombre.length}'), //Cuenta las palabras
        hintText: 'Escribe tu nombre', //place holder
        labelText: 'Nombre', //label
        helperText: 'Escribe tu nombre', //texto de ayuda
        suffixIcon: const Icon(Icons.accessibility), //icono dentro del input
        icon: const Icon(Icons.account_circle), //icono izq fuera del input
      ),
      onChanged: (valor) {
        setState(() =>
            _nombre = valor); //cambia el valor del numero de palabras en vivo
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es : $_nombre"),
      subtitle: Text('Email: $_email \nFecha: $_fecha '),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Escribe tu email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() => _email = valor);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Escribe tu contraseña',
        labelText: 'Contraseña',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFielddateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: const Icon(Icons.perm_contact_cal),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018, 1, 1),
      lastDate: DateTime(2030, 1, 1),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fecha = DateFormat.yMMMd("es").format(picked);

        _inputFielddateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];
    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder));
    }
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        DropdownButton<dynamic>(
            value: _opcionSeleccionada,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
              setState(() => _opcionSeleccionada = opt);
            })
      ],
    );
  }
}
