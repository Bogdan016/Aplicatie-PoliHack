import 'package:aplicatie_polihack_v15/Tutorials/tutorial.dart';
import 'package:aplicatie_polihack_v15/search_spec.dart';
import 'package:aplicatie_polihack_v15/subcategorii.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPageCar extends StatefulWidget {
  final VoidCallback? onMenuPageButtonPressed;

  const MenuPageCar({Key? key, this.onMenuPageButtonPressed}) : super(key: key);

  @override
  State<MenuPageCar> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPageCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillBoost'),
        centerTitle: true,
        titleTextStyle: GoogleFonts.comicNeue(
          textStyle: const TextStyle(
              color: Color.fromRGBO(69, 146, 197, 1), fontSize: 30.0),
        ),
        backgroundColor: const Color.fromRGBO(240, 241, 246, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black45,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 241, 246, 1),
              ),
            ),
            ListTile(
              title: const Text('Home',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
              textColor: Colors.black54,
              titleTextStyle: GoogleFonts.openSans(),
              leading: const Icon(Icons.house_outlined, color: Colors.black45),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            ListTile(
              title: const Text('Hnadyman list',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
              textColor: Colors.black54,
              titleTextStyle: GoogleFonts.openSans(),
              leading: const Icon(Icons.settings, color: Colors.black45),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchSpec(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Settings',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
              textColor: Colors.black54,
              titleTextStyle: GoogleFonts.openSans(),
              leading: const Icon(Icons.settings, color: Colors.black45),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Log out',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
              textColor: Colors.black54,
              titleTextStyle: GoogleFonts.openSans(),
              leading: const Icon(Icons.logout, color: Colors.black45),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ScrollPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.white.withOpacity(0.6),
      ),
    );
  }
}

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 241, 246, 1),
      body: Scrollbar(
        thumbVisibility: true,
        child: ListView.separated(
          padding: const EdgeInsets.all(20.0),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 24);
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return Language(index: index);
          },
        ),
      ),
    );
  }
}

class Language extends StatelessWidget {
  final int index;
  const Language({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String cardText = 'card';
    IconData? category_icon;

    switch (index) {
      case 0:
        cardText = 'Maintenance';
        category_icon = Icons.check;
        break;
      case 1:
        cardText = 'Repairs';
        category_icon = FontAwesomeIcons.wrench;
        break;
      case 2:
        cardText = 'Safety';
        category_icon = Icons.health_and_safety;
        break;
      case 3:
        cardText = 'Cleaning';
        category_icon = FontAwesomeIcons.broom;
        break;
      case 4:
        cardText = 'Navigation';
        category_icon = Icons.map;
        break;
    }
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            List<String> title = [
              'Oil change',
              'Tire pressure check',
              'Replacement of air filters'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 1:
            List<String> title = ['Tire change', 'Battery replacement'];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 2:
            List<String> title = [
              'Use of safety belts',
              'Child seat installation',
              'Driving in winter conditions'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 3:
            List<String> title = [
              'Car interior cleaning',
              'Car wash',
              'Headlight cleaning'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 4:
            List<String> title = [
              'GPS usage',
              'Reading the road map',
              'Route planning'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(69, 146, 197, 1),
              Color.fromRGBO(101, 194, 226, 1),
            ],
          ),
        ),
        width: double.infinity,
        height: 0.172 * screenSize.height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category_icon,
                color: Colors.white,
                size: 25.0,
              ),
              const SizedBox(width: 8),
              Text(
                cardText,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
