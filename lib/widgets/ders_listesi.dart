import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesapla/helper/data_helper.dart';
import 'package:not_ortalamasi_hesapla/model/ders.dart';
import 'package:not_ortalamasi_hesapla/sabitler/uygulama_sabitleri.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler=DataHelper.tumEklenenDersler;
    return tumDersler.length >0 ?  ListView.builder(itemCount: tumDersler.length,itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          onDismiss(index);
           
        },
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
             title: Text(tumDersler[index].ad),
             leading: CircleAvatar(
               backgroundColor: Sabitler.anaRenk,
               child: Text((tumDersler[index].harfDegeri*tumDersler[index].krediDegeri).toStringAsFixed(0)),
             ),
             subtitle: Text("${tumDersler[index].krediDegeri} Kredi , Not Değeri ${tumDersler[index].harfDegeri}"),
            ),
          ),
        ),
      );
    }): Container(child: Center(child: Text("Lütfen Ders Ekleyin",style: Sabitler.baslikStyle,)),);
  }
}