import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesapla/helper/data_helper.dart';
import 'package:not_ortalamasi_hesapla/sabitler/uygulama_sabitleri.dart';

class KredilerWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KredilerWidget({required this.onKrediSecildi ,Key? key}) : super(key: key);

  @override
  _KredilerWidgetState createState() => _KredilerWidgetState();
}

class _KredilerWidgetState extends State<KredilerWidget> {
  double secilenKrediDeger = 1;
  @override
  Widget build(BuildContext context) {
   return Container(
       alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenKrediDeger,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            widget.onKrediSecildi(secilenKrediDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumKrediler(),
      ),
    );
  }
}