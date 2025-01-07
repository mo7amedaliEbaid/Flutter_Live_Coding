import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Encryption',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EncryptionPage(),
    );
  }
}

class EncryptionPage extends StatefulWidget {
  @override
  _EncryptionPageState createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  final TextEditingController _textController = TextEditingController();
  String _encryptedString = '';
  void _encryptString(String plainText) {
    // Define a 256-bit key (32 characters)
    final keyString = 'my32charlongsecretkey12345678900'; // Ensure it's exactly 32 chars
    if (keyString.length != 32) {
      throw ArgumentError('Key must be exactly 32 characters long.');
    }

    final key = encrypt.Key.fromUtf8(keyString);

    // Define a 16-byte IV
    final iv = encrypt.IV.fromLength(16);

    // Initialize the encrypter
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Encrypt the input text
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    setState(() {
      _encryptedString = encrypted.base64; // Save the encrypted string
    });
  }

/*  void _encryptString(String plainText) {
    // Define a 256-bit key (32 characters)
    final keyString = 'my32charlongsecretkey1234567890';
    final key = encrypt.Key.fromUtf8(keyString.substring(0, 32)); // Ensure valid length

    // Define a 16-byte IV
    final iv = encrypt.IV.fromLength(16);

    // Initialize the encrypter
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Encrypt the input text
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    setState(() {
      _encryptedString = encrypted.base64; // Save the encrypted string
    });
  }*/
/*  void _encryptString(String plainText) {
    // Define a key and an IV (Initialization Vector)
    final key = encrypt.Key.fromUtf8('my32charlongsecretkey1234567890');
    final iv = encrypt.IV.fromLength(16);

    // Initialize the encrypter
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Encrypt the input text
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    setState(() {
      _encryptedString = encrypted.base64; // Save the encrypted string
    });
  }*/
  @override
  void initState() {
  // _textController.text="aasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf558faasddf55";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Encrypt String Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text to encrypt',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _encryptString(_textController.text);
                }
              },
              child: Text('Encrypt'),
            ),
            SizedBox(height: 20),
            Text(
              'Encrypted String:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _encryptedString,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
