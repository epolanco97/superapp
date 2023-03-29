import 'package:flutter/material.dart';
import 'package:super_heroes/config/theme/app_theme.dart';

class WarningMessage extends StatelessWidget {
  const WarningMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Icon(
            Icons.warning_amber_rounded,
            color: AppTheme.redColor,
            size: 140,
          )),
          SizedBox(height: 30),
          Text(
            'Hola dev, para ejecutar el código de la aplicación es necesario seguir los siguientes pasos:',
          ),
          SizedBox(height: 20),
          Text(
            """1. Tener el PRIVATE_KEY del API.
2. Tener el PUBLIC_KEY del API.
3. Renombrar el archivo '.env.template' por '.env'.
4. En '.env' asignar valor a las variables.
5. Realizar un HOT RESTART.
""",
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
