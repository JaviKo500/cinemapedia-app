import 'package:flutter/material.dart';


class FullScreenLoader extends StatelessWidget {

  FullScreenLoader ({super.key});

  final List< String  > messages = [
    'Loading movies...',
    'Comprando palomitas de maiz',
    'Cargando populares',
    'Llamando a mi novia',
    'Ya mero',
    'Esto esta tardando mas de lo esperado :(',
    '',
  ];
  
  Stream<String> getLoadingMessages () {
    return Stream.periodic( const Duration( milliseconds: 1200 ), ( steps ) {
      return messages[steps];
    }).take( messages.length );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('await please...'),
          const SizedBox(height: 10,),
          const CircularProgressIndicator( strokeWidth: 2 ,),
          const SizedBox(height: 10,),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if ( !snapshot.hasData ) {
                return const Text(
                  'Loading...',
                  style: TextStyle()
                );
              }
              return Text(
                snapshot.data!,
                style: const TextStyle()
              );
            },
          )
        ],
      ),
    );
  }
}