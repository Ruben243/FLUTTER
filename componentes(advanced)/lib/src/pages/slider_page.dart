import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Column(
        children: [
          _crearSlider(),
          _crearCheckBox(),
          _crearSwitch(),
          _crearImagen(),
          _sizeBox(),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider.adaptive(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño deLa imagen',
        // divisions: 20,
        value: _valorSlider,
        min: 50.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: const Text("Bloquear Slider"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() => _bloquearCheck = (valor) as bool);
        });
  }

  Widget _crearImagen() {
    return Expanded(
      child: SingleChildScrollView(
        child: Image(
          image: const NetworkImage(
              'https://static.wikia.nocookie.net/horizonzerodawn/images/7/74/IMG_0240.JPG/revision/latest?'),
          width: _valorSlider,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile.adaptive(
        title: const Text("Bloquear Slider"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() => _bloquearCheck = valor);
        });
  }

  Widget _sizeBox() {
    return const SizedBox(height: 30);
  }
}
