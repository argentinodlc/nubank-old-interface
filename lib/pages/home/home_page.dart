import 'package:flutter/material.dart';
import 'package:nubank_old_interface/pages/home/widgets/card_app.dart';
import 'package:nubank_old_interface/pages/home/widgets/item_menu_bottom.dart';
import 'package:nubank_old_interface/pages/home/widgets/menu_app.dart';
import 'package:nubank_old_interface/pages/home/widgets/my_app_bar.dart';
import 'package:nubank_old_interface/pages/home/widgets/my_dots_app.dart';
import 'package:nubank_old_interface/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu = false;
  late int _currentIndex = 0;
  double _yPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = screenHeight * .24;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(_showMenu, () {
            setState(() {
              _showMenu = !_showMenu;
              _yPosition = _showMenu ? screenHeight * .75 : screenHeight * .24;
            });
          }),
          MenuApp(
            top: screenHeight * .18,
            showMenu: _showMenu,
          ),
          PageViewApp(
            top: _yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              setState(() {
                double positionBottomLimit = screenHeight * .75;
                double positionTopLimit = screenHeight * .24;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition = positionBottomLimit;
                  _showMenu = true;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = positionTopLimit;
                  _showMenu = false;
                }
              });
            },
            showMenu: _showMenu,
          ),
          MyDotsApp(
            top: screenHeight * .70,
            currentIndex: _currentIndex,
            showMenu: _showMenu,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            bottom:
                !_showMenu ? 0 + MediaQuery.of(context).padding.bottom : -10,
            left: 0,
            right: 0,
            height: screenHeight * .14,
            child: IgnorePointer(
              ignoring: _showMenu,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: !_showMenu ? 1 : 0,
                child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ItemMenuBottom(
                        icon: Icons.person_add,
                        text: 'Indicar amigos',
                      ),
                      ItemMenuBottom(
                        icon: Icons.phone_android,
                        text: 'Recarga de celular',
                      ),
                      ItemMenuBottom(
                        icon: Icons.chat,
                        text: 'Cobrar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.monetization_on,
                        text: 'Empréstimos',
                      ),
                      ItemMenuBottom(
                        icon: Icons.move_to_inbox,
                        text: 'Depositar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.mobile_screen_share,
                        text: 'Transferir',
                      ),
                      ItemMenuBottom(
                        icon: Icons.format_align_center,
                        text: 'Ajustar limite',
                      ),
                      ItemMenuBottom(
                        icon: Icons.chrome_reader_mode,
                        text: 'Pagar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.lock_open,
                        text: 'Bloquear cartão',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
