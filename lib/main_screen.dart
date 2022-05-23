import 'package:bmfp_submission/detail_screen.dart';
import 'package:bmfp_submission/model/the_hero.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int countHeroes = theHeroes.length;

    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(2),
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          children: List.generate(countHeroes, (index) {
            final TheHero theHero = theHeroes[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(theHero: theHero);
                }));
              },
              child: Stack(children: [
                Container(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Image.asset(theHero.image),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    theHero.name,
                    style: const TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black45,
                    ),
                  ),
                )
              ]),
            );
          }),
        ),
      ),
    );
  }
}
