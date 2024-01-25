import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> checkConnection() async {
    try {
      final response = await http.get(Uri.parse("https://example.com")); // Gantilah dengan URL API yang sesuai
      if (response.statusCode == 200) {
        // Jika koneksi berhasil
        SweetAlert.show(
          context,
          title: "Connection Status",
          subtitle: "Connected to API",
          style: SweetAlertStyle.success,
          onPress: (bool isConfirm) {
            // Tindakan yang diambil setelah alert ditekan
          },
        );
      } else {
        // Jika koneksi gagal
        SweetAlert.show(
          context,
          title: "Connection Status",
          subtitle: "Failed to connect to API",
          style: SweetAlertStyle.error,
          onPress: (bool isConfirm) {
            // Tindakan yang diambil setelah alert ditekan
          },
        );
      }
    } catch (e) {
      // Penanganan kesalahan (misalnya, tidak ada koneksi internet)
      SweetAlert.show(
        context,
        title: "Connection Status",
        subtitle: "Failed to connect to API",
        style: SweetAlertStyle.error,
        onPress: (bool isConfirm) {
          // Tindakan yang diambil setelah alert ditekan
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweet Alert Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            checkConnection();
          },
          child: Text('Check Connection'),
        ),
      ),
    );
  }
}
