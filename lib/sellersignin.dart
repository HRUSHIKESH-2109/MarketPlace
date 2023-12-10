import 'package:flutter/material.dart';

class sellersignin extends StatefulWidget {
  const sellersignin({super.key});
  @override
  State<sellersignin> createState() => _sellersigninState();
}

class _sellersigninState extends State<sellersignin> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Market Place'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(
            icon:const Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).pushReplacementNamed('/home'),
          ),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(30),
                  //   child: Text(
                  //     'Seller SignIn page',
                  //     style: const TextStyle(
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 30),
                  //   )
                  //   ,),
                  Padding(
                    // alignment: Alignment.center,
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        'Seller SignIn',
                        style: const TextStyle(fontSize: 20),
                      )
                  ),
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
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Enter Email Address';
                      //   } else if (!value.contains('@')) {
                      //     return 'Please enter a valid email address!';
                      //   }
                      //   return null;
                      // },
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
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Enter Password';
                      //   } else if (value.length < 6) {
                      //     return 'Password must be atleast 6 characters!';
                      //   }
                      //   return null;
                      // },
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
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.black87)),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   setState(() {
                        //     isLoading = true;
                        //   });
                          // logInToFb();
                          Navigator.of(context).pushReplacementNamed('/home');
                        // }
                      },
                      child: Text('SignIn'),
                    ),
                  ),
                ])
            )
        ));
  }
}