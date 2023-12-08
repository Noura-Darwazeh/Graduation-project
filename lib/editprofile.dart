import 'package:flutter/material.dart';
//import 'package:soft/setting.dart';

class editprofilepage extends StatefulWidget {
  @override
  _editprofilepagestate createState() => _editprofilepagestate();
}

class _editprofilepagestate extends State<editprofilepage> {
  bool showpassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              //Navigator.of(context).push(
              // MaterialPageRoute(builder: (context)=>settingpage(

              // )
              //)
              //);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2, blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              // offset: offset(0,10)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/prof.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              color: Colors.green),
                          child: Icon(Icons.edit, color: Colors.white),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField('Full Name', 'Nada Abushanab', false),
              buildTextField('Email', 'email@gmail.com', false),
              buildTextField('Phone number', '+970***', false),
              buildTextField('Location', 'Nabluse St', false),
              buildTextField('Password', '*****', true),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: Text("Cancel", style: TextStyle(fontSize: 30)),
                    onPressed: () {}, //function
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: Text("Save", style: TextStyle(fontSize: 30)),
                    onPressed: () {}, //function
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String Placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextField(
        obscureText: isPasswordTextField ? showpassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showpassword = !showpassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: Placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
