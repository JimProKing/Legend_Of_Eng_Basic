import '/backend/supabase/supabase.dart';
import '/components/banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadingMainModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? onlyeng = true;

  ///  State fields for stateful widgets in this page.

  // Model for banner component.
  late BannerModel bannerModel;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bannerModel = createModel(context, () => BannerModel());
  }

  void dispose() {
    bannerModel.dispose();
  }

  /// Additional helper methods are added here.

}
