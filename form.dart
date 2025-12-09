import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyFormApp());
}

class MyFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserFormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserFormScreen extends StatefulWidget {
  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  // Controllers
  final TextEditingController nameController = TextEditingController();

  // Gender
  String gender = "";

  // Country Dropdown
  String selectedCountry = "Pakistan";
  List<String> countries = ["Pakistan", "India", "USA", "China", "UK"];

  // Interests (Checkboxes)
  bool cplusplus = false;
  bool java = false;
  bool csharp = false;

  // Save Data to Firestore
  Future<void> submitData() async {
    List<String> selectedInterests = [];

    if (cplusplus) selectedInterests.add("C++");
    if (java) selectedInterests.add("Java");
    if (csharp) selectedInterests.add("C#");

    FirebaseFirestore db = FirebaseFirestore.instance;

    await db.collection("form").add({
      "name": nameController.text,
      "gender": gender,
      "country": selectedCountry,
      "interests": selectedInterests,
    });

    print("Data Saved!");

    // Optional — Clear fields
    nameController.clear();
    setState(() {
      gender = "";
      cplusplus = false;
      java = false;
      csharp = false;
      selectedCountry = "Pakistan";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text("Name"),
            TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            // Gender
            Text("Gender"),
            Row(
              children: [
                Radio(
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text("Male"),
                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text("Female"),
              ],
            ),

            SizedBox(height: 20),

            // Country Dropdown
            Text("Country"),
            DropdownButton(
              value: selectedCountry,
              items: countries
                  .map((country) =>
                      DropdownMenuItem(value: country, child: Text(country)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value.toString();
                });
              },
            ),
            SizedBox(height: 20),

            // Interests Checkboxes
            Text("Interests"),
            Row(
              children: [
                Checkbox(
                  value: cplusplus,
                  onChanged: (value) {
                    setState(() {
                      cplusplus = value!;
                    });
                  },
                ),
                Text("C++"),
                Checkbox(
                  value: java,
                  onChanged: (value) {
                    setState(() {
                      java = value!;
                    });
                  },
                ),
                Text("Java"),
                Checkbox(
                  value: csharp,
                  onChanged: (value) {
                    setState(() {
                      csharp = value!;
                    });
                  },
                ),
                Text("C#"),
              ],
            ),
            SizedBox(height: 20),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: submitData,
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
