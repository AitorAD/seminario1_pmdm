import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String passwordSecurity = '';
  String _fecha = '';
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        children: [
          _crearNombre(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () {
              if (_nombre.isNotEmpty &&
                  _email.isNotEmpty &&
                  _password.isNotEmpty &&
                  _fecha.isNotEmpty) {
                _mostrarAlert(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Por favor, completa todos los campos.'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _crearNombre() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Ej. Aitor Agulló Duque',
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Ej. aduqueagullo@gmail.com',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            counter: Text('Caracteres ${_password.length}'),
            hintText: 'Password',
            labelText: 'Password',
            helperText: 'Seguridad: $passwordSecurity',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        onChanged: (valor) => setState(() {
              _password = valor;
              if (valor.length >= 16) {
                passwordSecurity = "Segura";
              } else if (valor.length >= 10) {
                passwordSecurity = "Buena";
              } else if (valor.length >= 8) {
                passwordSecurity = "Mejorable";
              } else if (valor.length >= 6) {
                passwordSecurity = "Mala";
              } else {
                passwordSecurity = "Muy mala";
              }
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('¿Son correctos estos datos?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Nombre: $_nombre \nEmail: $_email \nFecha Nacimiento: $_fecha'),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Center(
                              child: Text('Datos almacenados correctamente')),
                        );
                      });
                },
                //onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
