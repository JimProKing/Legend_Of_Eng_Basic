import '/backend/supabase/supabase.dart';
import '/components/banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/storage/input_word/input_word_widget.dart';
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WexamModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<int> idxs = [];
  void addToIdxs(int item) => idxs.add(item);
  void removeFromIdxs(int item) => idxs.remove(item);
  void removeAtIndexFromIdxs(int index) => idxs.removeAt(index);

  int? cC = 0;

  List<String> cW = [];
  void addToCW(String item) => cW.add(item);
  void removeFromCW(String item) => cW.remove(item);
  void removeAtIndexFromCW(int index) => cW.removeAt(index);

  String? temp = 'a';

  ///  State fields for stateful widgets in this page.

  // Model for banner component.
  late BannerModel bannerModel;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? exAdSuccess;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bannerModel = createModel(context, () => BannerModel());
  }

  void dispose() {
    bannerModel.dispose();
  }

  /// Additional helper methods are added here.

}
