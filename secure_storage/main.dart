import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Storage Demo',
      home: SecureStorageScreen(),
    );
  }
}

class SecureStorageScreen extends StatefulWidget {
  @override
  _SecureStorageScreenState createState() => _SecureStorageScreenState();
}

class _SecureStorageScreenState extends State<SecureStorageScreen> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final TextEditingController _tokenController = TextEditingController();
  String? _retrievedToken;

  // Save the token to secure storage
  Future<void> _saveToken() async {
    final token = _tokenController.text;
    if (token.isNotEmpty) {
      await _secureStorage.write(key: 'api_token', value: token);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token saved securely!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token cannot be empty')),
      );
    }
  }

  // Retrieve the token from secure storage
  Future<void> _retrieveToken() async {
    final token = await _secureStorage.read(key: 'api_token');
    setState(() {
      _retrievedToken = token ?? 'No token found';
    });
  }

  // Delete the token from secure storage
  Future<void> _deleteToken() async {
    await _secureStorage.delete(key: 'api_token');
    setState(() {
      _retrievedToken = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Token deleted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Data Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _tokenController,
              decoration: const InputDecoration(
                labelText: 'Enter API Token',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveToken,
              child: const Text('Save Token'),
            ),
            ElevatedButton(
              onPressed: _retrieveToken,
              child: const Text('Retrieve Token'),
            ),
            ElevatedButton(
              onPressed: _deleteToken,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete Token'),
            ),
            const SizedBox(height: 16),
            if (_retrievedToken != null)
              Text(
                'Retrieved Token: $_retrievedToken',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
