import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_word_model.dart';
export 'input_word_model.dart';

class InputWordWidget extends StatefulWidget {
  const InputWordWidget({Key? key}) : super(key: key);

  @override
  _InputWordWidgetState createState() => _InputWordWidgetState();
}

class _InputWordWidgetState extends State<InputWordWidget> {
  late InputWordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputWordModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: TextFormField(
        controller: _model.textController,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          Duration(milliseconds: 50),
          () async {
            logFirebaseEvent('INPUT_WORD_TextField_y494r2o6_ON_TEXTFIE');
            logFirebaseEvent('TextField_update_app_state');
            setState(() {
              FFAppState().wordTemp = _model.textController.text;
            });
          },
        ),
        textCapitalization: TextCapitalization.none,
        obscureText: false,
        decoration: InputDecoration(
          hintText: FFLocalizations.of(context).getText(
            'imhfb3sj' /* [단어를 영어로 적으세요.] */,
          ),
          hintStyle: FlutterFlowTheme.of(context).bodySmall,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
