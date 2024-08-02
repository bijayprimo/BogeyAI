import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'powerd_by_model.dart';
export 'powerd_by_model.dart';

class PowerdByWidget extends StatefulWidget {
  const PowerdByWidget({super.key});

  @override
  State<PowerdByWidget> createState() => _PowerdByWidgetState();
}

class _PowerdByWidgetState extends State<PowerdByWidget> {
  late PowerdByModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PowerdByModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PowerdBy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POWERD_BY_PAGE_PowerdBy_ON_INIT_STATE');
      await Future.delayed(const Duration(milliseconds: 3000));

      context.goNamed(
        'SignInPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.topToBottom,
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(
                color: Color(0xFF2B2B2B),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: GradientText(
                      'powered by',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).info,
                            fontSize: 15.0,
                            letterSpacing: 5.0,
                            fontWeight: FontWeight.bold,
                          ),
                      colors: const [Color(0xFFEE7BB3), Color(0xFF6DC4AD)],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/maslow_logo_dark_theme.png',
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Lottie.network(
                    'https://lottie.host/280eb040-d01a-436c-9965-938be1e7f844/f6Cky1k66N.json',
                    width: 200.0,
                    height: 180.0,
                    fit: BoxFit.fill,
                    reverse: true,
                    animate: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
