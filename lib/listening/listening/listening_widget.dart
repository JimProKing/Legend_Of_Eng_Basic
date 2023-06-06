import '/components/banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listening_model.dart';
export 'listening_model.dart';

class ListeningWidget extends StatefulWidget {
  const ListeningWidget({Key? key}) : super(key: key);

  @override
  _ListeningWidgetState createState() => _ListeningWidgetState();
}

class _ListeningWidgetState extends State<ListeningWidget> {
  late ListeningModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListeningModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Listening'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LISTENING_PAGE_Listening_ON_INIT_STATE');
      logFirebaseEvent('Listening_ad_mob');

      _model.interstitialAdSuccessL = await admob.showInterstitialAd();
    });
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
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
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
                    Expanded(
                      child: wrapWithModel(
                        model: _model.bannerModel,
                        updateCallback: () => setState(() {}),
                        child: BannerWidget(),
                      ),
                    ),
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
                                    'LISTENING_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 0.0, 4.0),
                            child: Text(
                              'Listening',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 5.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('LISTENING_PAGE_오리엔테이션_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('LOT');
                    },
                    text: '오리엔테이션',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).papayaWhip,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto Mono',
                                color: Color(0xFF57636C),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).black600,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 5.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LISTENING_PAGE_WEEK1_기본_문장구조_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'L1',
                              queryParams: {
                                'dayNo': serializeParam(
                                  '1',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'week1. 기본 문장구조',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 60.0,
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
                                  fontSize: 20.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Color(0x8ACD8A8A),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 5.0),
                        child: FFButtonWidget(
                          onPressed: FFAppState().payed == 0
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'LISTENING_PAGE_WEEK2_동사변형_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('L2');
                                },
                          text: 'Week2. 동사변형    ',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 60.0,
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
                                  fontSize: 20.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Color(0x8ACD8A8A),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: Color(0xFFDBE2E7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 5.0),
                        child: FFButtonWidget(
                          onPressed: FFAppState().payed == 0
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'LISTENING_PAGE_WEEK3_관계사_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('L3');
                                },
                          text: 'Week3. 관계사      ',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 60.0,
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
                                  fontSize: 20.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Color(0x8ACD8A8A),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: Color(0xFFDBE2E7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 5.0),
                        child: FFButtonWidget(
                          onPressed: FFAppState().payed == 0
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'LISTENING_PAGE_WEEK4_접속사_활용_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('L4');
                                },
                          text: 'Week4. 접속사 활용. ',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 60.0,
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
                                  fontSize: 20.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Color(0x8ACD8A8A),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: Color(0xFFDBE2E7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
