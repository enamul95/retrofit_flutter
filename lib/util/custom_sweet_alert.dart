import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';

class Custom_SweetAlert {
  static void showProgressDialog(BuildContext context) {
    // SweetAlertDialog pDialog = new SweetAlertDialog(activity, SweetAlertDialog.PROGRESS_TYPE);
    //pDialog.getProgressHelper().setBarColor(Color.parseColor("#A5DC86"));
    //pDialog.setTitleText("Please wait...");
    // pDialog.setCanceledOnTouchOutside(false);
    // return pDialog;
    //  SweetAlert alert = new
    //SweetAlertDialog buffer = new SweetAlertDialog(context,SweetAlertStyle.loading);
    // var a = SweetAlertDialog(co)
    //SweetAlertDialog alert = new SweetAlertDialog(SweetAlertStyle.loading);

    var alert = SweetAlert.show(context,
        subtitle: "Deleting...", style: SweetAlertStyle.loading);
  }
}
