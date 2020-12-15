import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc1/main.dart';
import 'package:flutter_bloc1/models/models.dart';
import 'package:flutter_bloc1/services/services.dart';
import 'package:flutter_bloc1/ui/widget/productcard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signin_page.dart';
part 'signup_page.dart';
part 'mainMenu.dart';
part 'data_page.dart';
part 'add_page.dart';
part 'account_page.dart';
part 'detail_page.dart';
