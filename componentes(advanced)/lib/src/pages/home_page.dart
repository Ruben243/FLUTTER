import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menuOptions = Routes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: menuOptions.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(menuOptions[i].name),
          trailing: Icon(
            menuOptions[i].icon,
            color: AppTheme.lightTheme.primaryColor,
          ),
          onTap: () {
            Navigator.pushNamed(context, menuOptions[i].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
