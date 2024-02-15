import 'package:flutter/material.dart';

const String fontFamilyName = 'Material Design Icons';
const String fontFamilyPackageName = 'material_design_icons_flutter';

class IconDataCustom extends StatelessWidget {
  IconDataCustom({super.key});

  IconData getAccountIconData(int codePoint) {
    return IconData(
      codePoint,
      fontFamily: fontFamilyName,
      fontPackage: fontFamilyPackageName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      getAccountIconData(
          0xe801), // Substitua 0xe801 pelo codePoint do ícone desejado
      size: 24, // Tamanho do ícone
      color: Colors.blue, // Cor do ícone
    );
  }
}
