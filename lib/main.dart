import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async'; // Untuk Timer dan simulasi data

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Kid App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

// ================== API SERVICE ====================
class ApiService {
  final String baseUrl = "http://localhost/safekid_backend";

  // Fungsi Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login.php");
    try {
      final response = await http.post(
        url,
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"status": "error", "message": "Gagal terhubung ke server"};
      }
    } catch (e) {
      return {"status": "error", "message": e.toString()};
    }
  }
}

// ================== LOGIN SCREEN ====================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi Login User
  void loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      var response = await apiService.login(email, password);
      if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Berhasil!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Gagal: ${response['message']}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua kolom!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginUser,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================== HOME SCREEN ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String latitude = "0.0";
  String longitude = "0.0";
  String status = "INSIDE_ZONE";
  String timestamp = "2024-06-16 14:35:21";

  // Fungsi untuk mensimulasikan data GPS dan status geofencing setiap 5 detik
  void simulateData() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        // Simulasi data latitude dan longitude secara acak
        latitude = (latitude == "0.0" ? "6.9175" : (double.parse(latitude) + 0.001).toString());
        longitude = (longitude == "0.0" ? "107.6191" : (double.parse(longitude) + 0.001).toString());

        // Simulasi status geofencing (bisa INSIDE_ZONE atau OUTSIDE_ZONE)
        status = (status == "INSIDE_ZONE") ? "OUTSIDE_ZONE" : "INSIDE_ZONE";

        // Timestamp simulasi
        timestamp = DateTime.now().toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    simulateData(); // Mulai simulasi data GPS dan geofencing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SafeKid Tracking")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Latitude: $latitude"),
            Text("Longitude: $longitude"),
            Text("Status Geofencing: $status"),
            Text("Timestamp: $timestamp"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action lainnya jika diperlukan
              },
              child: const Text("Perbarui Data"),
            ),
          ],
        ),
      ),
    );
  }
}
