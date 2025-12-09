import 'package:flutter/material.dart';

void main() => runApp( MaterialApp(home: LoginPage()));

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App Logo (Optional)
              // Image.asset('path/to/your/logo.png'),
              SizedBox(height: 20.0),
              // Username Field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              // Password Field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Login Button
              Container(
                width: double.infinity, // Match parent width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Login Button press
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 10.0),
              // Forgot Password Text (Optional)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Handle Forgot Password press
                    },
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}


