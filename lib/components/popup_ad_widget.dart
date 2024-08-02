import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'popup_ad_model.dart';
export 'popup_ad_model.dart';

class PopupAdWidget extends StatefulWidget {
  const PopupAdWidget({super.key});

  @override
  State<PopupAdWidget> createState() => _PopupAdWidgetState();
}

class _PopupAdWidgetState extends State<PopupAdWidget> {
  late PopupAdModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupAdModel());

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
        color: FlutterFlowTheme.of(context).info,
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 0.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              'https://picsum.photos/seed/818/600',
              fit: BoxFit.cover,
              alignment: const Alignment(0.0, 0.0),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('POPUP_AD_COMP_Icon_pbrxsxx9_ON_TAP');
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
