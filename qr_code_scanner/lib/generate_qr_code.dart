import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';



class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlController = TextEditingController(); // Controller for the URL input field
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlController.text.isNotEmpty)
                QrImageView(data: urlController.text,size:200,),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration( // Input decoration for the URL input field
                    hintText: "Enter URL",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: "Enter Your Data",
                  ),
                ),
              ),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Generate")),
            ],
          ),
        ),
      ),
    );
  }
}
