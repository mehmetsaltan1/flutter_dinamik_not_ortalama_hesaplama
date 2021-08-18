import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesapla/helper/data_helper.dart';
import 'package:not_ortalamasi_hesapla/model/ders.dart';
import 'package:not_ortalamasi_hesapla/sabitler/uygulama_sabitleri.dart';
import 'package:not_ortalamasi_hesapla/widgets/ders_listesi.dart';
import 'package:not_ortalamasi_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:not_ortalamasi_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:not_ortalamasi_hesapla/widgets/ortalama_goster.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  OrtalamaHesaplaApp({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaAppState createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  var formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi=" ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.ortalamaHesapla()),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Expanded(
            child: DersListesi(
              onDismiss: (index){
               DataHelper.tumEklenenDersler.removeAt(index);
               setState(() {
                 
               });
              },
            ),
            ),
          
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.padding,
            child: _buildTextFormField(),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.padding,
                  child: HarfDropDownWidget(
                    onHarfSecildi: (deger){
                      secilenDeger=deger;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.padding,
                  child: KredilerWidget(
                    onKrediSecildi: (deger){
                      secilenKrediDeger=deger;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(
                  
                  Icons.arrow_forward_ios,
                  color: Sabitler.anaRenk,
                  size: 30,
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved:(deger){
        setState(() {
          girilenDersAdi=deger!;
        });
      } ,
      validator: (s){
        if(s!.length<=0){
        return "Ders adını giriniz";
        }
        else {
          return null;
        }
      },
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }



  _dersEkleveOrtalamaHesapla() {
  if(formKey.currentState!.validate()){
    formKey.currentState!.save();
    var eklenecekDers= Ders(ad: girilenDersAdi,harfDegeri: secilenDeger,krediDegeri: secilenKrediDeger);
   DataHelper.dersEkle(eklenecekDers);
   setState(() {
     
   });
  }
  }
}
