import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class buyersignin extends StatefulWidget {
  const buyersignin({super.key});
  @override
  State<buyersignin> createState() => _buyersigninState();
}

class _buyersigninState extends State<buyersignin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  // bool _visible = false;
//   Future buyerlogin(BuildContext cont) async {
//   try {
//     var url = "http://192.168.1.3/localconnect/buyerlogin.php";
//     var response = await http.post(Uri.parse(url), body: {
//       "username": emailController.text, // Ensure these controllers are defined and populated
//       "password": passwordController.text,
//     });

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       if (data == "success") {
//         Navigator.of(cont).pushReplacementNamed('/home');
//       } else {
//         Fluttertoast.showToast(
//           msg: "The email, password combination does not exist!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           fontSize: 16,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.grey,
//           textColor: Colors.white,
//         );
//       }
//     } else {
//       // Handle non-200 responses
//     }
//   } catch (e) {
//     // Handle exceptions
//     print('Error: $e');
//   }
// }

  Future buyerlogin(BuildContext cont) async {
    var url = "http://192.168.1.3/localconnect/buyerlogin.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": emailController.text,
      "password": passwordController.text,
    });
    var data = json.decode(response.body);
    if (data == "success") {
      Navigator.of(cont).pushReplacementNamed('/home');
    } else {
      Fluttertoast.showToast(
        msg: "The email, password combination does not exist!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      
    }
    // setState(() {
    //   _visible = true;
    // });

    // // Getting username and password from Controller
    // var data = {
    //   'email': emailController.text,
    //   'password': passwordController.text,
    // };

    // Starting Web API Call.
    // var response = await http.post(Uri.parse(url), body: json.encode(data));
    // if (response.statusCode == 200) {
    //   //Server response into variable
    //   print(response.body);
    //   var msg = jsonDecode(response.body);

    //   //Check Login Status
    //   if (msg['loginStatus'] == true) {
    //     setState(() {
    //       //hide progress indicator
    //       _visible = false;
    //     });

    //     // Navigate to Home Screen
    //         Navigator.of(cont).pushReplacementNamed('/home');
    //   } else {
    //     setState(() {
    //       //hide progress indicator
    //       _visible = false;

    //       //Show Error Message Dialog
    //       // showMessage(msg["message"]);
    //     });
    //   }
    // } else {
    //   setState(() {
    //     //hide progress indicator
    //     _visible = false;
    //      //Show Error Message Dialog
    //     // showMessage("Error during connecting to Server.");
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Market Place'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('/home'),
          ),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'Buyer SignIn',
                    style: const TextStyle(fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Enter Email Address",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email Address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    } else if (value.length < 4) {
                      return 'Password must be atleast 4 characters!';
                    }
                    return null;
                  },
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     //forgot password screen
              //   },
              //   child: const Text(
              //     'Forgot Password',
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black87)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // setState(() {
                              // isLoading = true;
                            // });
                            buyerlogin(context);
                            // Navigator.of(context).pushReplacementNamed('/home');
                          }
                        },
                        child: Text('SignIn'),
                      ),
              ),
            ]))));
  }
}
