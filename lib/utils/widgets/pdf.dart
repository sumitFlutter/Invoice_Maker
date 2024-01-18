import 'dart:io';
import 'package:flutter/material.dart';
import 'package:invoice_maker/utils/global.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
Future<void> createPDF() async {
  var pdf =pw.Document();
  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
      build: (context) {return pw. Column(
        children: [
          pw.Container(
            height: 250,
            color: PdfColors.black,
            padding:  const pw.EdgeInsets.all(25),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(personaldetails["name"],style:  pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold,color:PdfColors.white),),
                pw.Text(personaldetails["email"],style: const pw.TextStyle(color:PdfColors.white,fontSize: 15),),
                pw.Text(personaldetails["mobile"],style: const pw.TextStyle(color:PdfColors.white,fontSize: 15),),
                pw.Text(personaldetails["address"],style: const pw.TextStyle(color:PdfColors.white,fontSize: 15),),
                pw.Text("Total price is \$$total",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 18),),
                pw.Text("+ GST 18%",style: pw.TextStyle(color:PdfColors.white,fontWeight: pw.FontWeight.bold,fontSize: 18),),
                pw.Text("Net price is \$$with_GST",style:  pw.TextStyle(color:PdfColors.white,fontWeight: pw.FontWeight.bold,fontSize: 18),),


              ],
            ),
          ),
          pw.Column(
            children: List.generate(productList.length, (index) => pw.Container(margin: const pw.EdgeInsets.all(25),child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  children: [
                    pw.Text("Name=${productList[index]["name"]}\n",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 15),),
                    pw.Text("Price=\$${productList[index]["price"]}\n",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 12),),
                    pw.Text("Net Quantity=${productList[index]["net_q"]}\n",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 12),),
                    pw.Text("Date=${productList[index]["date"]}",style:  pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 12),),
                    pw.Text("Brand=${productList[index]["brand"]}",style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 12),)
                  ],
                ),
              ],
            ),
            ),
            ),
          )
        ],
      );}

  ));
  await Printing.layoutPdf(onLayout: (format)=>pdf.save(),);
}