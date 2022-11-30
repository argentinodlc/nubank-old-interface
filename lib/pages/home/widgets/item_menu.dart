import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;

  const ItemMenu({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.7, color: Colors.white38),
        top: BorderSide(width: 0.7, color: Colors.white38)),
      ),
      child: ElevatedButton (
        style: ButtonStyle( elevation: MaterialStateProperty.resolveWith((states) => 0),
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.purple.shade900),
        backgroundColor: MaterialStatePropertyAll(Colors.purple[800]))
        ,//ElevatedButton.styleFrom(backgroundColor: Colors.purple[800], elevation: 0,),
        onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(width: 10,),
                Text(text, style: TextStyle(fontSize: 12),)
              ],
            ),
            Icon(Icons.chevron_right,size: 16,)
          ],
        ),
      ),
    );
  }
}
