import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reading_main_model.dart';
export 'reading_main_model.dart';

class ReadingMainWidget extends StatefulWidget {
  const ReadingMainWidget({
    Key? key,
    int? level,
  })  : this.level = level ?? 1,
        super(key: key);

  final int level;

  @override
  _ReadingMainWidgetState createState() => _ReadingMainWidgetState();
}

class _ReadingMainWidgetState extends State<ReadingMainWidget> {
  late ReadingMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadingMainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ReadingMain'});
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
                                    'READING_MAIN_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 0.0, 4.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'jnu3xc39' /* Level */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Nanum Gothic',
                                  color: Color(0xFF57636C),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: Text(
                            widget.level.toString(),
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Divider(
                      height: 5.0,
                      thickness: 50.0,
                      color: Color(0xFFE7CFCF),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 20.0, 10.0, 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 0.65,
                              decoration: BoxDecoration(
                                color: Color(0xFFFEFCED),
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: Color(0xA9D1A7A7),
                                  width: 3.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FutureBuilder<List<ReadingTableRow>>(
                                  future: ReadingTableTable().queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'day',
                                          widget.level,
                                        )
                                        .neq(
                                          'ENG',
                                          'n',
                                        )
                                        .order('pkno', ascending: true),
                                    limit: 50,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: SpinKitFoldingCube(
                                            color: Color(0xC1D1A7A7),
                                            size: 35.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ReadingTableRow>
                                        listViewReadingTableRowList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewReadingTableRowList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewReadingTableRow =
                                            listViewReadingTableRowList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  listViewReadingTableRow.eng!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              if (!_model.onlyeng!)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewReadingTableRow
                                                        .kor!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Mono',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 60.0),
                        child: FFButtonWidget(
                          onPressed: FFAppState().fR.contains(widget.level)
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'READING_MAIN_PAGE_FINISH_BTN_ON_TAP');
                                  logFirebaseEvent('Button_update_app_state');
                                  setState(() {
                                    FFAppState().addToFR(widget.level);
                                  });
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('Reading');
                                },
                          text: FFLocalizations.of(context).getText(
                            'atc7z9f4' /* finish */,
                          ),
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xC1D1A7A7),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto Mono',
                                  color: FlutterFlowTheme.of(context)
                                      .chocolateCosmos,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).lineColor,
                            disabledTextColor: Color(0xFF57636C),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 60.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('READING_MAIN_PAGE_영어_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_widget_state');
                            setState(() {
                              _model.onlyeng = true;
                            });
                          },
                          text: FFLocalizations.of(context).getText(
                            'lsxbshmv' /* 영어 */,
                          ),
                          options: FFButtonOptions(
                            width: 70.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFF3FCEB),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto Mono',
                                  color: Color(0xFF61686E),
                                ),
                            borderSide: BorderSide(
                              color: Color(0xFF61686E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 60.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('READING_MAIN_PAGE_영한_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_widget_state');
                            setState(() {
                              _model.onlyeng = false;
                            });
                          },
                          text: FFLocalizations.of(context).getText(
                            'cghxm1xi' /* 영한 */,
                          ),
                          options: FFButtonOptions(
                            width: 70.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFF3FCEB),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto Mono',
                                  color: Color(0xFF61686E),
                                ),
                            borderSide: BorderSide(
                              color: Color(0xFF61686E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
