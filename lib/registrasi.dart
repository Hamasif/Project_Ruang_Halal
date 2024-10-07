import 'package:flutter/material.dart';
import 'package:ruanghalal/login.dart'; // Import halaman login untuk navigasi kembali

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _isPasswordVisible = false;

  void _register() {
    // Aksi pendaftaran
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      // Tampilkan pesan sukses (contoh)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi berhasil!')),
      );
    } else {
      // Tampilkan pesan error jika ada field kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua field harus diisi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF24CE76), Color(0xFF24CE76)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Posisi elemen di atas halaman
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40), // Memberi jarak dari bagian atas

                  // Judul Registrasi
                  Center(
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 50), // Jarak antara judul dan form

                  // Username Field
                  Text(
                    'No Telp*',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Nomer Telpon',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email Field
                  Text(
                    'Username*',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Password Field
                  Text(
                    'Password*',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Tombol Daftar
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF32F48F),
                        padding:
                            EdgeInsets.symmetric(vertical: 18), // Tinggi tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Teks untuk kembali ke halaman login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()), // Navigasi ke halaman login
                          );
                        },
                        child: Text(
                          "Masuk sekarang",
                          style: TextStyle(
                            color: Color(0xFF0062FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
