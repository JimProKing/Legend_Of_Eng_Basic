import '/components/banner_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'introduce_model.dart';
export 'introduce_model.dart';

class IntroduceWidget extends StatefulWidget {
  const IntroduceWidget({Key? key}) : super(key: key);

  @override
  _IntroduceWidgetState createState() => _IntroduceWidgetState();
}

class _IntroduceWidgetState extends State<IntroduceWidget> {
  late IntroduceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroduceModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'introduce'});
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
              Size.fromHeight(MediaQuery.of(context).size.height * 0.22),
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
                                    'INTRODUCE_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 0.0, 4.0),
                            child: Text(
                              '앱 소개',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Nanum Gothic',
                                    color: Color(0xFF57636C),
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
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                    child: Text(
                      '영어의전설_기본편',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Roboto Mono',
                                color: FlutterFlowTheme.of(context).black600,
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F5FE),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
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
                                  '영어공부를 시작하려고 해도, 대부분의 사람들은 기본기가 부족해 시행착오를 겪게 되며 공부방법을 바꿔가는 비효율적인 과정을 겪게 됩니다.\n\n영어의 4가지 영역(Reading, Listening, Writing, Speaking)이 모두 \'다른 과목\' 이라는 것을 인지하고, 내가 원하는 것이 무엇인지를 분명하게 한 후 영어공부를 하는 것이 가장 효율적입니다.\n\nLA에서 10년을 살고도 영어로 말을 못하는 사람이 있는 반면, 한국에서 독학했음에도 외국인과 유창하게 대화하는 사람도 있습니다. 필자도 또한 한국에서 나고 자랐지만 연습만으로 프리토킹이 가능하게 되었습니다.\n\n수능, 토익, 오픽 등의 고난이도의 영어시험을 준비하기에 앞서, 기본기가 부족하신 분들을 위해 기본편을 먼저 제작하였습니다. 기본편의 단어수준은 한국 교육과정 기준 초-중등 수준이며, 수능과 같은 더 높은 수준의 시험을 위해서는 그에 걸맞는 수준의 단어를 추가적으로 학습해야 합니다.\n(수능편, 토익편, 오픽편에서 필요한 단어들을 추가로 구성해 두었습니다.)\n\n영어 기본기 체화에 있어서는 어떤 목적으로 공부를 하더라도 충분히 이 어플리케이션 만으로도 학습이 충분할 것임을 자신드립니다.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Text(
                              '* 기본문법 및 문장패턴만 빠르게 정리하고 싶으신 분들은 기본편의 Word 및 Listening을 스킵하시는 것을 권장드립니다.\n(수능영어 2등급 이상 경험자)\n\n기본편의 Word 및 Listening은 영어에 기초가 전혀 없는 사람들을 기준으로 구성되어 있습니다.\n\n\n\n\n\n\n\n\n\n\n\n',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nanum Gothic',
                                    color:
                                        FlutterFlowTheme.of(context).black600,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'Hello World',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
