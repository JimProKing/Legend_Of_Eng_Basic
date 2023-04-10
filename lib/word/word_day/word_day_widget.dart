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
import 'word_day_model.dart';
export 'word_day_model.dart';

class WordDayWidget extends StatefulWidget {
  const WordDayWidget({
    Key? key,
    String? wordDay,
    int? wd,
  })  : this.wordDay = wordDay ?? '1',
        this.wd = wd ?? 1,
        super(key: key);

  final String wordDay;
  final int wd;

  @override
  _WordDayWidgetState createState() => _WordDayWidgetState();
}

class _WordDayWidgetState extends State<WordDayWidget> {
  late WordDayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WordDayModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'wordDay'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WORD_DAY_PAGE_wordDay_ON_INIT_STATE');
      logFirebaseEvent('wordDay_update_app_state');
      setState(() {
        FFAppState().fwn = FFAppState().fwn + 1;
      });
    });

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
                                    'WORD_DAY_PAGE_backspace_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 0.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'fxf7v0gc' /* Day */,
                              ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Text(
                              widget.wordDay,
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                height: 5.0,
                thickness: 50.0,
                color: Color(0xFFE7CFCF),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FutureBuilder<List<WordTableRow>>(
                      future: WordTableTable().queryRows(
                        queryFn: (q) => q
                            .eq(
                              'day',
                              widget.wordDay,
                            )
                            .order('pkno', ascending: true),
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
                        List<WordTableRow> listViewWordTableRowList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewWordTableRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewWordTableRow =
                                listViewWordTableRowList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.65,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE6D8D8),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Color(0x3416202A),
                                      offset: Offset(0.0, 3.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0xA9D1A7A7),
                                    width: 3.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFEEC),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black600,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 2.0,
                                                                2.0, 2.0),
                                                    child: Text(
                                                      listViewWordTableRow.pkno
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray600,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 6.0, 8.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewWordTableRow.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewWordTableRow
                                                        .meaning!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
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
                                                    listViewWordTableRow
                                                        .example!,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 0.0, 5.0),
                                                  child: Text(
                                                    listViewWordTableRow
                                                        .exmeaning!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 8.0,
                                            thickness: 1.0,
                                            indent: 4.0,
                                            endIndent: 4.0,
                                            color: Color(0xFFF1F4F8),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.09,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0x20D1A7A7),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 3.0, 3.0, 3.0),
                                                  child: FlutterFlowAudioPlayer(
                                                    audio: Audio.network(
                                                      listViewWordTableRow
                                                          .soundURL!,
                                                      metas: Metas(
                                                        id: 'sample3.mp3-4v7apzif',
                                                        title:
                                                            listViewWordTableRow
                                                                .name,
                                                      ),
                                                    ),
                                                    titleTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              lineHeight: 0.0,
                                                            ),
                                                    playbackDurationTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFF9D9D9D),
                                                              fontSize: 10.0,
                                                            ),
                                                    fillColor:
                                                        Color(0xFFEEEEEE),
                                                    playbackButtonColor:
                                                        Color(0xFFB2CA6D),
                                                    activeTrackColor:
                                                        Color(0xFF57636C),
                                                    elevation: 5.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 60.0),
                      child: FFButtonWidget(
                        onPressed: FFAppState().fwns.contains(widget.wordDay)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'WORD_DAY_PAGE_GO_EXAM_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'Wexam',
                                  queryParams: {
                                    'no': serializeParam(
                                      widget.wd,
                                      ParamType.int,
                                    ),
                                    'wordDay': serializeParam(
                                      widget.wordDay,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                        text: FFLocalizations.of(context).getText(
                          'dbttsgjv' /* Go exam */,
                        ),
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xC1D1A7A7),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                          disabledColor: FlutterFlowTheme.of(context).lineColor,
                          disabledTextColor: Color(0xFF57636C),
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
    );
  }
}
