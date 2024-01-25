import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNFCPage(),
    );
  }
}

class MyNFCPage extends StatefulWidget {
  @override
  _MyNFCPageState createState() => _MyNFCPageState();
}

class _MyNFCPageState extends State<MyNFCPage> {
  String _nfcData = 'No data';

  @override
  void initState() {
    super.initState();
    _initNFC();
  }

  Future<void> _initNFC() async {
    try {
      await NfcManager.start();
      print('NFC Manager started');
    } catch (e) {
      print('Error starting NFC Manager: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC Manager Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NFC Data: $_nfcData'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    NfcManager.stop();
    print('NFC Manager stopped');
    super.dispose();
  }
}
