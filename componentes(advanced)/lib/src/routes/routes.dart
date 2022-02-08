import 'package:flutter/material.dart';
import 'package:componentes/models/models.dart';
import 'rutas.dart';

class Routes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listView1',
        name: 'List View 1',
        screen: const ListViewScreen(),
        icon: Icons.list),
    MenuOption(
        route: 'list',
        name: 'List Image Scroll',
        screen: const ListViewPage(),
        icon: Icons.home_rounded),
    MenuOption(
        route: 'alert',
        name: 'Mostar Alerta',
        screen: const AlertPage(),
        icon: Icons.add_alert_outlined),
    MenuOption(
        route: 'avatar',
        name: 'Avatar Page',
        screen: const AvatarPage(),
        icon: Icons.contact_phone_rounded),
    MenuOption(
        route: 'card',
        name: 'Card Page',
        screen: const CardPage(),
        icon: Icons.credit_card),
    MenuOption(
        route: 'animatedContainer',
        name: 'Animaciones',
        screen: const AnimatedContainerPage(),
        icon: Icons.animation_outlined),
    MenuOption(
        route: 'inputs',
        name: 'Input Page',
        screen: const InputPage(),
        icon: Icons.input_outlined),
    MenuOption(
        route: 'slider',
        name: 'Slider Page',
        screen: const SliderPage(),
        icon: Icons.slideshow)
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) => const HomePage());
  }
}
