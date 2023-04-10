import '/backend/supabase/supabase.dart';
import '/components/payment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadingModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? dayNO;

  ///  State fields for stateful widgets in this page.

  // Model for payment component.
  late PaymentModel paymentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    paymentModel = createModel(context, () => PaymentModel());
  }

  void dispose() {
    paymentModel.dispose();
  }

  /// Additional helper methods are added here.

}
