import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'w_t_share_model.dart';
export 'w_t_share_model.dart';

class WTShareWidget extends StatefulWidget {
  const WTShareWidget({super.key});

  @override
  State<WTShareWidget> createState() => _WTShareWidgetState();
}

class _WTShareWidgetState extends State<WTShareWidget> {
  late WTShareModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WTShareModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 10.0),
            child: Text(
              'SHARE',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Barlow Condensed',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 35.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          Text(
            'Tap here to Share Slammie with your Friends, Family and Frenimies ',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Barlow Condensed',
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
