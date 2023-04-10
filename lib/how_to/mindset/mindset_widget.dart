import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mindset_model.dart';
export 'mindset_model.dart';

class MindsetWidget extends StatefulWidget {
  const MindsetWidget({Key? key}) : super(key: key);

  @override
  _MindsetWidgetState createState() => _MindsetWidgetState();
}

class _MindsetWidgetState extends State<MindsetWidget> {
  late MindsetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindsetModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mindset'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                    'MINDSET_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'd42i2evx' /* 앱 소개 */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Nanum Gothic',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.w600,
                                ),
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 5.0,
                  thickness: 50.0,
                  color: Color(0xFFE7CFCF),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'r5ucdhan' /* 기본 마음가짐 */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Roboto Mono',
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F5FE),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'v3kw0l2i' /* 다음의 마음가짐을  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nanum Gothic',
                                            color: FlutterFlowTheme.of(context)
                                                .buff,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'zhf7ay7e' /* 꼭 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nanum Gothic',
                                            color: FlutterFlowTheme.of(context)
                                                .pennRed,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '9nlaujtq' /*  명심하세요 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nanum Gothic',
                                            color: Color(0xFFE2C2A2),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 5.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'nbsmlpc5' /* 1. 지치더라도 매일매일 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFEFEEC),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xA9D1A7A7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '0ijkthtd' /*  공부가 지치더라도 조금씩이라도  매일 해야합니다.
정... */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nanum Gothic',
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 5.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'h7on6xe3' /* 2. 영어권 나라와 한국의 사고방식 차이 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFEFEEC),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xA9D1A7A7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'te3sl2yy' /*  한글은 본론을 나중에 말하는 경향이 있습니다. 영어권... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nanum Gothic',
                                                color: Color(0xFF57636C),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'lav5b9sk' /* * 그렇기에, 영어를 한글로 번역하려는 습관을 버리세요... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nanum Gothic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .rosewood,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFEFEEC),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 5.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'e0gxz0my' /* 3. 조바심을 버리기 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFEFEEC),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xA9D1A7A7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '03wad4zx' /*  새 친구를 사귀면, 처음엔 이름을 계속 까먹다가 시간... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nanum Gothic',
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 5.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tmmr8q2i' /* 4. 타인의 의견 맹신 금지 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFEFEEC),
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xA9D1A7A7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'xudj7rd6' /*  "유학을 가지 않으면 결국 영어는 한계가 있어!"라고... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nanum Gothic',
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ds5no9z9' /* 







 */
                                    ,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nanum Gothic',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
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
