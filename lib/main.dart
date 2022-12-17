import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Internet Dialog Box",style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              onPressed: (){
                networkDilog(context);
              }, 
              child: const Text("Internet Check")
            )
          ],
        ),
      ),
    );
  }
  networkDilog(context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body:  Center(
            child: Container(
              height: 280,
              width: 250,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lottie/internet.json',
                    repeat: true,
                    animate: true,
                    width: 150,
                  ),
                  const SizedBox(height: 10,),
                  const Text("Internet Connection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,height: 1),),
                  const SizedBox(height: 10,),
                  const Text("Please Check Your internet Connection!",textAlign: TextAlign.center,style: TextStyle(height: 1,fontSize: 14),),
                  const SizedBox(height: 20,),
                  Row(
                    children: [ 
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop(false);
                        },
                        child: Container(
                          alignment: Alignment.center,
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.deepPurple
                            ),
                            child: const Text(
                              'Retry',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: (){
                          SystemNavigator.pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.deepPurple
                          ),
                          child: const Text(
                            'Close App',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
      );
    },
  );
 }
}