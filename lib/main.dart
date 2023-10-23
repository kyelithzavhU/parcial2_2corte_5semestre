import 'package:flutter/material.dart';
import 'package:hola/Hola.dart';
import 'page.dart'; // Importa la pantalla 'Page'

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('¡Bienvenidos!'),
        ),
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isImageAnimated = false;
  bool isTextAnimated = false;

  void toggleAnimation() {
    setState(() {
      isImageAnimated = !isImageAnimated;
    });
  }

  void toggleTextAnimation() {
    setState(() {
      isTextAnimated = !isTextAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo de imagen
        Image.asset(
          'assets/griffy.jpg', // Ruta de la imagen de fondo
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Contenedor de formulario
        Container(
          color: Colors.transparent,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:
                    toggleTextAnimation, // Toggle de la animación del texto
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: isTextAnimated ? 200.0 : 100.0,
                      height: isTextAnimated ? 200.0 : 100.0,
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Color de fondo rosa claro
                        borderRadius:
                        BorderRadius.circular(8.0), // Borde redondeado
                      ),
                      child: Center(
                        child: Text(
                          'WLCM!', // Texto "¡WLCM!" con fondo rosa claro
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),


                  TextField(
                    decoration: InputDecoration(
                      labelText: 'user',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.redAccent,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),

// ... (otras partes de tu código)
                  SizedBox(height: 12.0),

    TextField(
    obscureText: true,
    decoration: InputDecoration(
    labelText: 'Contraseña',
    icon: Icon(Icons.lock),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    ),
    filled: true,
    fillColor: Colors.redAccent,
    contentPadding: EdgeInsets.all(16.0),
    ),
    ),

// ... (resto de tu código)






    SizedBox(height: 24.0),
                  CustomButton(
                    onPressed: () {
                      // Navega a la pantalla 'Page' cuando se presiona el botón
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HolaScreen(),
                        ),
                      );
                    },
                    label: 'Iniciar Sesión',
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      // Aquí puedes implementar la lógica para recuperar la contraseña
                    },
                    child: Text(':3'),
                  ),
                  SizedBox(height: 32.0),
                  GestureDetector(
                    onTap: toggleAnimation,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: isImageAnimated ? 200.0 : 100.0,
                      height: isImageAnimated ? 200.0 : 100.0,
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        'assets/LION.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Widget personalizado para el botón
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  CustomButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
      ),
      child: Text(label),
    );
  }
}
