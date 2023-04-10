import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WordDayModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? wd;

  List<String> fwd = [];
  void addToFwd(String item) => fwd.add(item);
  void removeFromFwd(String item) => fwd.remove(item);
  void removeAtIndexFromFwd(int index) => fwd.removeAt(index);

  int? pkmemo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
