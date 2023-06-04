import 'dart:async';
import 'package:cg/models/discussion.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cg/views/widgets/widgets.dart';

import '../../auth/auth.dart';
import '../../controller/controller.dart';
import '../../models/models.dart';
import '../../shared/shared.dart';

part 'splashscreenpage.dart';
part 'mainmenupage.dart';
part 'main/discussion/discussionpage.dart';
part 'main/discussion/discussionformpage.dart';
part 'main/home/homepage.dart';
part 'main/materials/materialspage.dart';
part 'main/leaderpanel/leaderpanelpage.dart';
part 'loginregister/loginpage.dart';
part 'loginregister/registerpage.dart';
part 'main/materials/materialsformpage.dart';
