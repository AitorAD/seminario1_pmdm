import 'package:flutter/material.dart';

class DestinationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Destinos')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _getCard(
            'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
            'Escapada romántica a París por 1200 EUR.',
            'Viaja a la ciudad del amor y disfruta de sus monumentos históricos.',
          ),
          Divider(),
          _getCard(
            'https://img2.rtve.es/i/?w=1600&i=1695120582959.jpg',
            'Aventura urbana en Nueva York por 2000 EUR.',
            'Descubre la ciudad que nunca duerme con esta oferta exclusiva.',
          ),
          Divider(),
          _getCard(
            'https://www.universal-assistance.com/uablog/wp-content/uploads/2022/12/big-ben.png',
            'Turismo en Londres por 1300 EUR.',
            'Explora los lugares más emblemáticos de Londres en un viaje inolvidable.',
          ),
          Divider(),
          _getCard(
            'https://historia.nationalgeographic.com.es/medio/2019/12/11/coliseo-roma_2924b6ae_1280x720.jpg',
            'Historia en Roma por 1000 EUR.',
            'Visita el Coliseo, el Vaticano y otros lugares emblemáticos de la capital italiana.',
          ),
          Divider(),
          _getCard(
            'https://fotografias.lasexta.com/clipping/cmsimages01/2021/07/13/AAAC5987-6C8D-48D1-9D24-F601EF1B89FA/98.jpg?crop=1920,1080,x0,y102&width=1900&height=1069&optimize=high&format=webply',
            'Vacaciones de verano en Sídney por 1800 EUR.',
            'Disfruta de las playas de Bondi y del icónico edificio de la Ópera de Sídney.',
          ),
          Divider(),
          _getCard(
            'https://plus.unsplash.com/premium_photo-1661914240950-b0124f20a5c1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dG9reW8lMjB0b3dlcnxlbnwwfHwwfHx8MA%3D%3D',
            'Exploración urbana en Tokio por 2200 EUR.',
            'Sumérgete en la cultura japonesa moderna y tradicional en la vibrante capital de Japón.',
          ),
          Divider(),
          _getCard(
            'https://www.visitdubai.com/-/media/gathercontent/poi/b/burj-khalifa/fallback-image/poi-burj-khalifa-3-dtcm-jun-2023.jpg',
            'Lujo en Dubái por 2500 EUR.',
            'Vive una experiencia de lujo con vistas al Burj Khalifa y paseos por el desierto.',
          ),
          Divider(),
          _getCard(
            'https://www.civitatis.com/blog/wp-content/uploads/2022/10/panoramica-rio-janeiro-brasil.jpg',
            'Carnaval en Río de Janeiro por 1700 EUR.',
            'Únete a la mayor fiesta del mundo y disfruta de las playas de Copacabana e Ipanema.',
          ),
          Divider(),
          _getCard(
            'https://static.rutasdeescape.com/wp-content/uploads/2018/06/pnldest.jpg',
            'Aventura en los parques nacionales de Canadá por 1400 EUR.',
            'Explora la belleza natural de Banff y Jasper en un viaje inolvidable.',
          ),
        ],
      ),
    );
  }

  Widget _getCard(String urlImage, String title, String description) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(2, 10))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: _createCard(urlImage, title, description),
        ));
  }

  Widget _createCard(String urlImage, String title, String description) {
    return Container(
      child: Column(
        children: <Widget>[
          _getImage(urlImage),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('$title'),
            subtitle: Text('$description'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[TextButton(child: Text('Ir'), onPressed: () {})],
          )
        ],
      ),
    );
  }

  Widget _getImage(String url) {
    return FadeInImage(
      image: NetworkImage(url),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 10),
      height: 260,
      fit: BoxFit.cover,
    );
  }
}
