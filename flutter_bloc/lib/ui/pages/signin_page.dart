part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlUser = TextEditingController();

  final ctrlPassword = TextEditingController();
  bool isLoading = false;

  SharedPreferences logindata;
  bool newuser;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('Users') ?? true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.all(18),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: 'Email',
                          hintText: "Write your email",
                          border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 40),
                    RaisedButton.icon(
                      icon: Icon(Icons.cloud_upload),
                      label: Text("Sign In"),
                      textColor: Colors.white30,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        if (ctrlEmail.text == "" || ctrlPassword.text == "") {
                          Fluttertoast.showToast(
                            msg: "Please fill all fields !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          String result = await AuthService.signIn(
                              ctrlUser.text, ctrlEmail.text, ctrlPassword.text);
                          if (result == "success") {
                            Fluttertoast.showToast(
                              msg: "Sign In Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            String username = ctrlEmail.text;
                            logindata.setBool('Users', false);
                            logindata.setString('nime', username);
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainMenu();
                            }));
                          } else {
                            Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    RichText(
                      text: TextSpan(
                          text: 'Not registered yet? Sign Up.',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUpPage();
                              }));
                            }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  ),
                )
              : Container()
        ]),
      ),
    );
  }
}
