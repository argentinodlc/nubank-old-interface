import 'package:flutter/material.dart';
import 'package:nubank_old_interface/pages/home/widgets/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;
  const MenuApp({Key? key, required this.top, required this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: 0,
        right: 0,
        child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: showMenu ? 1 : 0,
            child: Container(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Column(children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/QR_Code_Example.svg/2048px-QR_Code_Example.svg.png',
                  height: 80,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Banco ',
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                            text: '260 - Nu Pagamentos S.A',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Agência ',
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                            text: '0001',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Conta ',
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                            text: '0000000-0',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        ItemMenu(
                          icon: Icons.info_outline,
                          text: 'Me ajuda',
                        ),
                        ItemMenu(
                          icon: Icons.person_outline,
                          text: 'Perfil',
                        ),
                        ItemMenu(
                          icon: Icons.settings,
                          text: 'Configurar conta',
                        ),
                        ItemMenu(
                          icon: Icons.credit_card,
                          text: 'Configurar Cartão',
                        ),
                        ItemMenu(
                          icon: Icons.store_mall_directory,
                          text: 'Pedir conta PJ',
                        ),
                        ItemMenu(
                          icon: Icons.phone_android,
                          text: 'Configurações do app',
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.7, color: Colors.white54)
                          ),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.resolveWith(
                                      (states) => 0),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.purple.shade900),
                                  backgroundColor: MaterialStatePropertyAll(Colors
                                          .purple[
                                      800])), //ElevatedButton.styleFrom(backgroundColor: Colors.purple[800], elevation: 0,),
                              onPressed: () {},
                              child: Text('SAIR DO APP',
                                  style: TextStyle(fontSize: 10))),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )));
  }
}
