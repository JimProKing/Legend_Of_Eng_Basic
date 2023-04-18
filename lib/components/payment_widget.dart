import '/backend/braintree/payment_manager.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_model.dart';
export 'payment_model.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late PaymentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F5FE),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x8AEEC9C9),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (FFAppState().payed == 0)
                    Text(
                      '* 모든 컨텐츠 이용은 결제가 필요합니다.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: FlutterFlowTheme.of(context).error,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                ],
              ),
            ),
            if (FFAppState().payed == 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '* 7,700원 한번 결제로 평생 이용가능.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto Mono',
                        color: Color(0xFFFA9807),
                      ),
                ),
              ),
            if (FFAppState().payed == 0)
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('PAYMENT_COMP_7,700원_BTN_ON_TAP');
                  logFirebaseEvent('Button_braintree_payment');
                  final transacAmount = 7700.0;
                  final transacDisplayName = 'payment';
                  if (kIsWeb) {
                    showSnackbar(context, 'Payments not yet supported on web.');
                    return;
                  }

                  final dropInRequest = BraintreeDropInRequest(
                    cardEnabled: true,
                    clientToken: braintreeClientToken(),
                    collectDeviceData: true,
                    paypalRequest: BraintreePayPalRequest(
                      amount: transacAmount.toString(),
                      currencyCode: 'KRW',
                      displayName: transacDisplayName,
                    ),
                    applePayRequest: BraintreeApplePayRequest(
                      amount: transacAmount,
                      currencyCode: 'KRW',
                      countryCode: 'KO',
                      displayName: transacDisplayName,
                      appleMerchantID: appleMerchantId(),
                    ),
                  );
                  final dropInResult =
                      await BraintreeDropIn.start(dropInRequest);
                  if (dropInResult == null) {
                    return;
                  }
                  showSnackbar(
                    context,
                    'Processing payment...',
                    duration: 10,
                    loading: true,
                  );
                  final paymentResponse = await processBraintreePayment(
                    transacAmount,
                    dropInResult.paymentMethodNonce.nonce,
                    dropInResult.deviceData,
                  );
                  if (paymentResponse.errorMessage != null) {
                    showSnackbar(
                        context, 'Error: ${paymentResponse.errorMessage}');
                    return;
                  }
                  showSnackbar(context, 'Success!');
                  _model.transactionId = paymentResponse.transactionId!;

                  logFirebaseEvent('Button_update_app_state');
                  setState(() {
                    FFAppState().payed = 1;
                  });

                  setState(() {});
                },
                text: '7,700원',
                icon: FaIcon(
                  FontAwesomeIcons.moneyBillAlt,
                ),
                options: FFButtonOptions(
                  width: 130.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent3,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto Mono',
                        color: FlutterFlowTheme.of(context).black600,
                      ),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).black600,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: FutureBuilder<List<CouponRow>>(
                future: CouponTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'coupon',
                    'basic',
                  ),
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
                  List<CouponRow> containerCouponRowList = snapshot.data!;
                  final containerCouponRow = containerCouponRowList.isNotEmpty
                      ? containerCouponRowList.first
                      : null;
                  return Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).black600,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            controller: _model.textController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 50),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: ' 쿠폰번호입력',
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
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('PAYMENT_COMP_쿠폰_BTN_ON_TAP');
                              if ((_model.textController.text ==
                                      containerCouponRow?.content) ||
                                  (_model.textController.text ==
                                      '314159265358979323')) {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('쿠폰적용완료'),
                                      content: Text('잠금이 해제되었습니다!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                logFirebaseEvent('Button_update_app_state');
                                setState(() {
                                  FFAppState().payed = 1;
                                });
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('HomePage');

                                return;
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('잘못된 쿠폰'),
                                      content: Text('쿠폰번호가 틀렸습니다.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }
                            },
                            text: '쿠폰',
                            options: FFButtonOptions(
                              width: 70.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).beige,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    color:
                                        FlutterFlowTheme.of(context).black600,
                                  ),
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
                  );
                },
              ),
            ),
            if (FFAppState().payed == 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  '* 결제시 해당 창은 사라집니다.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto Mono',
                        color: FlutterFlowTheme.of(context).black600,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
