import 'package:flutter/material.dart';

const kHeigth = SizedBox(
  height: 20,
);
const kWidth = SizedBox(
  width: 20,
);

 class KController{
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController name = TextEditingController();
  static final TextEditingController email = TextEditingController();
  static final TextEditingController stream = TextEditingController();
  static final TextEditingController parent = TextEditingController();
  static final TextEditingController image = TextEditingController();
}