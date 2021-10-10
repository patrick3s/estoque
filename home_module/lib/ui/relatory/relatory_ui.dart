


import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/bloc/bloc_products.dart';
import 'package:home_module/src/core/domain/entity/product_entity.dart';

import 'package:pdf/widgets.dart' as pdflib;
class RelatoryUI extends StatefulWidget {
  const RelatoryUI({ Key? key }) : super(key: key);

  @override
  _RelatoryUIState createState() => _RelatoryUIState();
}

class _RelatoryUIState extends State<RelatoryUI> {
  late final BlocProducts bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<BlocProducts>();
    bloc.getAll();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<ProductState>(
        stream: bloc.state,
        builder: (context, snapshot) {
          if(snapshot.data is LoadingProductState) return const Center(child: CircularProgressIndicator(),);
          if(snapshot.data is ErrorProductState) return Center(child:  Text((snapshot.data as ErrorProductState).failure.message,));

          return StreamBuilder<List<ProductEntity>>(
            stream: bloc.stream,
            initialData: const [],
            builder: (context, snaProducts) {
              
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: ElevatedButton(onPressed: snaProducts.data?.isEmpty == true ? null : (){
                    _createPdf(snaProducts.data!);
                  }, child: const Text('Gerar relatório em pdf')))
                ],
              );
            }
          );
        }
      ),
      );
  }

  _createPdf(List<ProductEntity> products)async{
    final pdflib.Document pdf = pdflib.Document(deflate: zlib.encode);
    pdf.addPage(
      pdflib.MultiPage(
        build: (context) => [pdflib.Table.fromTextArray(data: <List<String>>[
          <String>['Nome do produto','Descrição','Quantidade',"Preço"],
          ...products.map<List<String>>((product) => [
            product.productName,
            product.productDescription,
            product.productQuantity.toString(),
            product.productPrice.toString()
            ]).toList()
          
        ])])
    );
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/pdfRelatory.pdf';
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save());
    ShareExtend.share(path, 'file',sharePanelTitle: "Enviar pdf");
  }
}