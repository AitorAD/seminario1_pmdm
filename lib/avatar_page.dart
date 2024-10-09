import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(6.5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1760656311660744704/XYPsxMPU_400x400.jpg'),
              radius: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('AA'),
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://static.wikia.nocookie.net/dragon-ball-star/images/4/4f/Goku_dbz_fin.png/revision/latest/scale-to-width-down/3000?cb=20131118182753&path-prefix=es'),
          fadeInDuration: Duration(milliseconds: 2),
        ),
      ),
    );
  }
}
