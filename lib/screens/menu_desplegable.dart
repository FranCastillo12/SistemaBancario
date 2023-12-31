import 'package:flutter/material.dart';
import 'package:flutter_proyecto3prograv/providers/login_provider.dart';
import 'package:flutter_proyecto3prograv/screens/login_screen.dart';
import 'package:provider/provider.dart';

class MenuDesplegable extends StatefulWidget {
  const MenuDesplegable();
  @override
  State<MenuDesplegable> createState() => _MenuDesplegableState();
}

class _MenuDesplegableState extends State<MenuDesplegable> {
  String nombreCliente = "";

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    nombreCliente =
        Provider.of<loginProvider>(context, listen: false).nombreCliente;
    int num = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            _createHeader(),
            _createOption("autorización", 'autorización', Icons.abc_sharp),

            ///_createOption("Clientes", 'clientes', Icons.person_pin_rounded),
            _createOption(
                "Transferencias", 'transferencia', Icons.monetization_on),
            Expanded(child: Container()),
            _createLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _createIcon() {
    return Icon(
      Icons.person,
      size: 70,
      color: Colors.black,
    );
  }

  Widget _createHeader() {
  return Column(
    children: [
      // Coloca aquí el widget de la imagen que deseas mostrar arriba del encabezado
      Image.asset(
        'assets/images/logobanco1.png', // Ruta de la imagen
        width: 300, // O ajusta el ancho según tus necesidades
        height: 90, // Ajusta la altura de la imagen según tus necesidades
        fit: BoxFit.contain, // Ajusta el modo de ajuste de la imagen
      ),
      UserAccountsDrawerHeader(
        accountName: nombreCliente != null
            ? Text(
                nombreCliente,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text('Sin nombre'), // Manejo si nombreCliente es null
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: _createIcon(),
        ),
        accountEmail: null,
        decoration: BoxDecoration(
          color: Colors.blue, // Puedes cambiar el color de fondo según tus necesidades
        ),
      ),
    ],
  );
}

  Widget _createOption(String titulo, String ruta, icono) {
    return Builder(
      builder: (context) => ListTile(
        title: Text(titulo),
        leading: Icon(icono),
        onTap: () {
          Navigator.pushNamed(context, ruta);
        },
      ),
    );
  }

  Widget _createLogoutButton() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start, // Alinea los elementos en la parte superior
    crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos en el centro horizontal
    children: [
      // Botón de Cerrar sesión
      ListTile(
        title: Text(
          "Cerrar sesión",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.logout),
        onTap: () => _cerrarSesion(context),
        tileColor: Colors.red,
        iconColor: Colors.white,
      ),
    ],
  );
}

  void _cerrarSesion(BuildContext context) {
    context.read<loginProvider>().setdatosCliente("", "");
    // Cerrar sesión
    // Redireccionar a la pantalla de inicio de sesión (PantallaInicioSesion)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PantallaInicioSesion()),
    );
  }
}
