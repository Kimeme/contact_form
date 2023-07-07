import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class FormScreen extends StatefulWidget {

  //const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final _formfield= GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle= true;

 // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/avatar2.png", height: 100, width: 100,),
               SizedBox( height: 30),
                TextField(
                  decoration: InputDecoration(
                      labelText: "FullName",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )
                  ) ,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  //controller:
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                    if(value.isEmpty){
                      return "Enter email";
                    }
                    else if(!emailValid){
                      return " Enter valid email";
                    }
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  //controller:
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                        },
                      child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter password";
                    }
                    else if(passController.text.length <= 6){
                      return " Password length should  be more than 6 characters";
                    }
                    return null;
                  },

                ),
                SizedBox( height: 10),
                // Phone field with contory code
                IntlPhoneField(
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )
                  ) ,
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: (){
                    if(_formfield.currentState!.validate()){
                      print("Data added successfuly");
                      emailController.clear();
                      passController.clear();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text("Log In", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Sign Up", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
