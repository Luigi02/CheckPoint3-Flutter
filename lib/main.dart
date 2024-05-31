import 'package:flutter/material.dart';

import 'banda.dart';
import 'detalhe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Banda> bandas = [
    Banda('Djavu', '@djavuoficial',
        'https://bandadjavuofc.com/wp-content/uploads/2023/11/banner-novo-djavu-otm.png', false),
    Banda('Calypso', '@Calypsooficial',
        'https://upload.wikimedia.org/wikipedia/pt/1/17/Banda_Calypso_-_Volume_4.png', false),
    Banda('Vomito podrasso', '@vpoficial',
        'https://imageproxyb.ifunny.co/crop:square,resize:320x,quality:90x75/images/b870d57a3c3aac403397fade3ffac2f49fcadfdcd8f2b84e03da6bb0925ec553_3.jpg', false),
    Banda('Cine', '@cineoficial',
        'https://s2-gshow.glbimg.com/27rCx30wFnq8LeWUHGBFgZUW02Y=/0x0:480x360/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2023/7/L/xIqYqRRVSY3jO4oFzifQ/banda-cine.jpg', false),
    Banda('Nx0', '@nx0ficial',
        'https://s2-g1.glbimg.com/XKPciXlP4-ANcWjrz6BxYUp0U00=/0x0:5942x3961/1008x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/D/E/kjGBAXQGeVpsEWRm1hGQ/nxzero.jpg', false),
  ];

  int contador = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bandas Favoritas ${contador}'),
        ),
        body: ListView.builder(
          itemCount: bandas.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(bandas[index].foto),
              ),
              title: Text(bandas[index].nome),
              subtitle: Text(bandas[index].insta),
              trailing: IconButton(
                icon: Icon(
                  bandas[index].favorito
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: bandas[index].favorito ? Colors.red : null,
                ),
                onPressed: () {
                  setState (() {
                    bandas[index].favorito = !bandas[index].favorito;

                    if (bandas[index].favorito) {
                      contador++;
                    } else {
                      contador--;
                    }
                  });
                },
              ),


              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detalhes(banda: bandas[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


