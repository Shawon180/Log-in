import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation <double> _animation;
  late TextEditingController _emailController=TextEditingController(text: '');
  late TextEditingController _passwordController=TextEditingController(text: '');
  get animationStatus => null;
  bool _obsecureText=true;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 20));


    var linear;
    _animation=CurvedAnimation(parent: _animationController,curve:Curves.linear)..addListener(() {
      setState(() {

      });
    })..addStatusListener((status) {
      if(animationStatus==AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();

      }
    });
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://cdn.pixabay.com/photo/2018/03/22/14/20/container-3250542_960_720.jpg",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value,0),
          ),
          Padding(padding:EdgeInsets.symmetric(horizontal: 16),

            child: ListView(
              children: [
                SizedBox(height: 10,),
                RichText(text: TextSpan(
                  text: 'Enter your email',style: TextStyle(
                  fontSize: 36,fontWeight: FontWeight.bold,color: Colors.white,
                ),
                ),),
                SizedBox(height: 40,),
                TextFormField(
                  obscureText: _obsecureText,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style:TextStyle(
                    color:Colors.white,

                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),



                TextFormField(
                  obscureText: _obsecureText,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  style:TextStyle(
                    color:Colors.white,

                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),

              ],
            ),




          ),

         Positioned(
           bottom: 400,
           left: 180,

           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

             Row(
               children: [
                 ElevatedButton(
                   onPressed: () {},
                   child: const Text('Log In',style: TextStyle(
                     fontSize: 20,fontWeight: FontWeight.bold
                   ),),
                 ),
               ],
             ),
SizedBox(
  height: 20,
),


               Row(
                 children: [
                   Text('Forget Password ?',style: TextStyle(
                     color: Colors.white,
                   ),)
                 ],
               ),



             ],
           ),
         ),
        ],
      ),
    );
  }
}
