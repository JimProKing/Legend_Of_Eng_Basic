import '/components/banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'l2_model.dart';
export 'l2_model.dart';

class L2Widget extends StatefulWidget {
  const L2Widget({
    Key? key,
    String? dayNo,
  })  : this.dayNo = dayNo ?? 'Day1',
        super(key: key);

  final String dayNo;

  @override
  _L2WidgetState createState() => _L2WidgetState();
}

class _L2WidgetState extends State<L2Widget> {
  late L2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => L2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'L2'});
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
                                    'L2_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                          Text(
                            'Week2',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Roboto Mono',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontWeight: FontWeight.w600,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 5.0,
                        thickness: 50.0,
                        color: Color(0xFFE7CFCF),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 10.0),
                        child: Text(
                          '동사 변형 (시제)',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Nanum Gothic',
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      FlutterFlowVideoPlayer(
                        path: 'https://storage.googleapis.com/notbig/L2.mp4',
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: true,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                      Container(
                        width: 160.0,
                        decoration: BoxDecoration(
                          color: Color(0x00E5F4AC),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0x00090F13),
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              ' 완료 횟수 : ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFAppState().fL2.toString(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('L2_PAGE_FINISH_BTN_ON_TAP');
                    logFirebaseEvent('Button_update_app_state');
                    setState(() {
                      FFAppState().fL2 = FFAppState().fL2 + 1;
                      FFAppState().fL2B = 1;
                    });
                  },
                  text: 'finish',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFD38C44),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto Mono',
                          color: FlutterFlowTheme.of(context).rosewood,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).black600,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
