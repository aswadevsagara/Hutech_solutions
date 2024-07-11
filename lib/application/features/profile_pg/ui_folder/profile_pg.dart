import 'package:ec_app/application/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var idController = TextEditingController();
  var billingAddressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const gradientAppBarColorup = Color.fromARGB(255, 133, 212, 205);
    const gradientAppBarColordown = Color.fromARGB(255, 24, 152, 142);
    return Scaffold(
      appBar:AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 50,
        title: Text("PharmaConnect",
            style: GoogleFonts.lato(textStyle: const TextStyle(color: white))),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [gradientAppBarColorup, gradientAppBarColordown],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Badge(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 216, 214, 214),
                          spreadRadius: .5,
                          blurRadius: 1)
                    ],
                    color: const Color.fromARGB(255, 247, 255, 251),
                  ),
                  height: 100,
                  width: MediaQuery.sizeOf(context).width - 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.dgvaishnavcollege.edu.in/dgvaishnav-c/uploads/2021/01/dummy-profile-pic.jpg"),
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr. Rachel Green",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.2),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Center(
                                child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  //   edit fuction
                                }
                              },
                              child: const Text(
                                "Edit Details",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            )),
                          )
                        ],
                      )
                    ],
                  )),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    customTextField(
                        obscureText: false,
                        controller: nameController,
                        hint: "hint name",
                        title: "Name"),
                    customTextField(
                        obscureText: false,
                        controller: phoneController,
                        hint: "Phone Hint",
                        title: "Phone",
                        textInput: TextInputType.number),
                    customTextField(
                        obscureText: false,
                        controller: emailController,
                        hint: "Email Hint",
                        title: "Email"),
                    customTextField(
                        obscureText: false,
                        controller: idController,
                        hint: "Practioner ID Hint",
                        title: "Practioner ID"),
                    customTextField(
                        obscureText: false,
                        controller: billingAddressController,
                        hint: "Billing Address Hint",
                        title: "Billing Address"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(
      {String? title,
      String? hint,
      controller,
      focusNode,
      required obscureText,
      TextInputType? textInput}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.color(Colors.black).size(16).make(),
        5.heightBox,
        TextFormField(
          keyboardType: textInput,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is empty';
            } else {
              return null;
            }
          },
          obscureText: obscureText,
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              isDense: true,
              fillColor: white,
              filled: true,
              border: InputBorder.none,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        )
      ],
    );
  }
}
