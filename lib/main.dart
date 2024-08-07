import 'package:flutter/material.dart';
import 'User.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awake',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage() 
        );
  }
}


bool m = true;
Map<String, User> users = {


  "adrisi": User(scientist: "adrisi", password: "1234"),
  "Adrisi": User(scientist: "Adrisi", password: "5678")
};

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController scientistController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext cotext) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          centerTitle: true,
          title: const Text("Answer and open your eyes!!",
              style:
                  TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0))),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Image.asset(
                'assets/mapadrisi.jpeg',
                width: 300,
                height: 300,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  TextFormField(
                    controller: scientistController,
                    decoration: const InputDecoration(

                      label: Text('who is the scientist?'),
                      prefixIcon:
                          Icon(Icons.addchart_outlined, color: Colors.black12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: m,
                    decoration: InputDecoration(
                      label: Text('write your password'),
                      prefixIcon: Icon(Icons.lock, color: Colors.black12),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              m = !m;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        // التوضيح لما جرى فوق
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      User user = users[scientistController.text]!;
                      if (user.scientist == scientistController.text &&
                          user.password == passwordController.text) {
                        print('logged');
                      } else {
                        print("Try again!");
                      }
                    },

                    child: Container(
                      padding: const EdgeInsets.all(20),
                      //توضيح بصري
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.brown),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('click here',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 18)),
                          SizedBox(width: 20),
                          Icon(Icons.ac_unit_rounded, color: Colors.white60),
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
