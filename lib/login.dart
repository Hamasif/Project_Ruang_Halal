import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ruanghalal/home.dart';
import 'package:ruanghalal/registrasi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false; // Untuk toggle visibilitas password

  Future<void> _login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    // Validasi login (contoh sederhana)
    if (username == 'admin' && password == 'admin') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username atau password salah')),
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
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Buat posisi form di tengah
                children: [
                  SizedBox(
                      height:
                          50), // Beri jarak di atas untuk memposisikan form lebih ke atas

                  Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username*',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  // Username Field
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password*',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  // Password Field
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible, // Hide/show password
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
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
                  SizedBox(height: 5),

                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Aksi lupa password, bisa ditambahkan halaman khusus
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Color(0xFF0062FF),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Login Button
                  Container(
                    width:
                        double.infinity, // Samakan width dengan container field
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF32F48F), // Text color hijau
                        padding: EdgeInsets.symmetric(
                            vertical: 18), // Sesuaikan tinggi
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Sesuaikan border radius
                        ),
                      ),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Teks untuk buat akun baru
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrasiPage()),
                          );
                        },
                        child: Text(
                          "Daftar Sekarang",
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
