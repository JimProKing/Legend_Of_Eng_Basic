import '/backend/braintree/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F5FE),
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
                    FFLocalizations.of(context).getText(
                      'ss73sg4v' /* * 모든 컨텐츠를 사용하기 
위해서는 결제가 필요합니다... */
                      ,
                    ),
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
                FFLocalizations.of(context).getText(
                  'xs6c9jrm' /* * 10000원 한번 결제로 평생 이용가능. */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto Mono',
                      color: FlutterFlowTheme.of(context).orangeWeb,
                    ),
              ),
            ),
          if (FFAppState().payed == 0)
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PAYMENT_COMP_10000원_BTN_ON_TAP');
                logFirebaseEvent('Button_braintree_payment');
                final transacAmount = 10000.0;
                final transacDisplayName = '영어의전설_기본편';
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
                );
                final dropInResult = await BraintreeDropIn.start(dropInRequest);
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
              text: FFLocalizations.of(context).getText(
                'vxe591ny' /* 10000원 */,
              ),
              icon: FaIcon(
                FontAwesomeIcons.moneyBillAlt,
              ),
              options: FFButtonOptions(
                width: 130.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
        ],
      ),
    );
  }
}
