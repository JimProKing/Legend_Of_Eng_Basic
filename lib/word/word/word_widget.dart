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
import 'word_model.dart';
export 'word_model.dart';

class WordWidget extends StatefulWidget {
  const WordWidget({Key? key}) : super(key: key);

  @override
  _WordWidgetState createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  late WordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WordModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Word'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF2F5FE),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
          child: AppBar(
            backgroundColor: Color(0xFFE2C2A2),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0xFFE2C2A2),
                              borderRadius: 0.0,
                              buttonSize: 50.0,
                              fillColor: Color(0xFFE2C2A2),
                              icon: Icon(
                                Icons.backspace,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 30.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                logFirebaseEvent(
                                    'WORD_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 0.0, 4.0),
                            child: Text(
                              'word',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Nanum Gothic',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 10.0,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 5.0,
                  thickness: 50.0,
                  color: Color(0xFFE7CFCF),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!FFAppState().fwns.contains('1'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'WORD_PAGE_DAY1_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'wordDay',
                                      queryParams: {
                                        'wordDay': serializeParam(
                                          '1',
                                          ParamType.String,
                                        ),
                                        'wd': serializeParam(
                                          1,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Day1',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).papayaWhip,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Color(0xFF57636C),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (FFAppState().fwns.contains('1'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'WORD_PAGE_DAY1_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'wordDay',
                                      queryParams: {
                                        'wordDay': serializeParam(
                                          '1',
                                          ParamType.String,
                                        ),
                                        'wd': serializeParam(
                                          1,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Day1',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x20D1A7A7),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: FlutterFlowTheme.of(context)
                                              .gray200,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    hoverColor:
                                        FlutterFlowTheme.of(context).black600,
                                    hoverTextColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!FFAppState().fwns.contains('2'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'WORD_PAGE_DAY2_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'wordDay',
                                      queryParams: {
                                        'wordDay': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'wd': serializeParam(
                                          2,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Day2',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).papayaWhip,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Color(0xFF57636C),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (FFAppState().fwns.contains('2'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'WORD_PAGE_DAY2_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'wordDay',
                                      queryParams: {
                                        'wordDay': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'wd': serializeParam(
                                          2,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Day2',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x20D1A7A7),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Color(0xFFDBE2E7),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!FFAppState().fwns.contains('3'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'WORD_PAGE_DAY3_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'wordDay',
                                      queryParams: {
                                        'wordDay': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Day3',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).papayaWhip,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Color(0xFF57636C),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (FFAppState().fwns.contains('3'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'WORD_PAGE_DAY3_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'wordDay',
                                      queryParams: {
                                        'wordDay': serializeParam(
                                          '',
                                          ParamType.String,
                                        ),
                                        'wd': serializeParam(
                                          3,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Day3',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x20D1A7A7),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Color(0xFFDBE2E7),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    if (FFAppState().payed == 0)
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Visibility(
                          visible: FFAppState().payed == 0,
                          child: wrapWithModel(
                            model: _model.paymentModel,
                            updateCallback: () => setState(() {}),
                            child: PaymentWidget(),
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('4'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY4_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '4',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            4,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day4',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('4'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY4_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '4',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      4,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day4',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('5'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY5_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '5',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            5,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day5',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('5'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY5_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '5',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      5,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day5',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('6'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY6_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '6',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            6,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day6',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('6'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY6_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '6',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      6,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day6',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('7'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY7_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '7',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            7,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day7',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('7'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY7_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '7',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      7,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day7',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('8'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY8_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '8',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            8,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day8',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('8'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY8_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '8',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      8,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day8',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('9'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY9_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '9',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            9,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day9',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('9'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY9_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '9',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      9,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day9',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('10'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY10_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '10',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            10,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day10',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('10'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY10_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '10',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      10,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day10',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('11'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY11_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '11',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            11,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day11',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('11'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY11_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '11',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      11,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day11',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('12'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY12_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '12',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            12,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day12',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('12'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY12_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '12',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      12,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day12',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!valueOrDefault<bool>(
                          FFAppState().fwns.contains('13'),
                          true,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY13_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '13',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            13,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day13',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('13'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY13_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '13',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      13,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day13',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('14'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY14_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '14',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            14,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day14',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          FFAppState().fwns.contains('14'),
                          true,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY14_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '14',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      14,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: ' Day14',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('15'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY15_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '15',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            15,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day15',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('15'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY15_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '15',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      15,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day15',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('16'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY16_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '16',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            16,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day16',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('16'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY16_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '16',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      16,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day16',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('17'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY17_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '17',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            17,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day17',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('17'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY17_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '17',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      17,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day17',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('18'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY18_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '18',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            18,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day18',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('18'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY18_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '18',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      18,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day18',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('19'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY19_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '19',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            19,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day19',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('19'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY19_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '19',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      19,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day19',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('20'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY20_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '20',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            20,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day20',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('20'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY20_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '20',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      20,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day20',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('21'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY21_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '21',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            21,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day21',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('21'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY21_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '21',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      21,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day21',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('22'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY22_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '22',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            22,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day22',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('22'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY22_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '22',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      22,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day22',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('23'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY23_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '23',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            23,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day23',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('23'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY23_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '23',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      23,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day23',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('24'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY24_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '24',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            24,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day24',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('24'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY24_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '24',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      24,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day24',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('25'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY25_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '25',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            25,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day25',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('25'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY25_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '25',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      25,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day25',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('26'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY26_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '26',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            26,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day26',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('26'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY26_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '26',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      26,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day26',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('27'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY27_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '27',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            27,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day27',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('27'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY27_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '27',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      27,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day27',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('28'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY28_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '28',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            28,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day28',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('28'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY28_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '28',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      28,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day28',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('29'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY29_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '29',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            29,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day29',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('29'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY29_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '29',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      29,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day29',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!FFAppState().fwns.contains('30'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState().payed == 0
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'WORD_PAGE_DAY30_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'wordDay',
                                        queryParams: {
                                          'wordDay': serializeParam(
                                            '30',
                                            ParamType.String,
                                          ),
                                          'wd': serializeParam(
                                            30,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                              text: 'Day30',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).papayaWhip,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xFFDBE2E7),
                              ),
                            ),
                          ),
                        if (FFAppState().fwns.contains('30'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('WORD_PAGE_DAY30_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'wordDay',
                                  queryParams: {
                                    'wordDay': serializeParam(
                                      '30',
                                      ParamType.String,
                                    ),
                                    'wd': serializeParam(
                                      30,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Day30',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x20D1A7A7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFFDBE2E7),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (functions
                            .newCustomFunction(FFAppState().fwns.toList()) ??
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('WORD_PAGE_인사_메시지_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('WordGreet');
                          },
                          text: '인사 메시지',
                          options: FFButtonOptions(
                            width: 340.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF3C3027),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto Mono',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
