import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesapla/helper/data_helper.dart';
import 'package:not_ortalamasi_hesapla/sabitler/uygulama_sabitleri.dart';

class HarfDropDownWidget extends StatefulWidget {
 final Function onHarfSecildi;
  HarfDropDownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);
 
  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenDeger = 4;
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
        value: secilenDeger,
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
            widget.onHarfSecildi(secilenDeger);

          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}