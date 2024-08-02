import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'in_chat_ad_model.dart';
export 'in_chat_ad_model.dart';

class InChatAdWidget extends StatefulWidget {
  const InChatAdWidget({
    super.key,
    this.adDetails,
  });

  final AdManagementRecord? adDetails;

  @override
  State<InChatAdWidget> createState() => _InChatAdWidgetState();
}

class _InChatAdWidgetState extends State<InChatAdWidget> {
  late InChatAdModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InChatAdModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: FFAppConstants.inMessageAdStatus,
      child: Container(
        width: 100.0,
        height: widget.adDetails!.adBanner.isNotEmpty ? 100.0 : 0.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Builder(
          builder: (context) {
            if (((widget.adDetails?.adBanner != null &&
                        (widget.adDetails?.adBanner)!.isNotEmpty) ==
                    true) &&
                !widget.adDetails!.isHtml) {
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('IN_CHAT_AD_COMP_Image_bpiz8idy_ON_TAP');
                    await launchURL(widget.adDetails!.adOnClickLink);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 200),
                      fadeOutDuration: const Duration(milliseconds: 200),
                      imageUrl: widget.adDetails!.adBanner.first.downloadURL,
                      fit: BoxFit.contain,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 0.0,
                decoration: const BoxDecoration(),
                child: Html(
                  data: widget.adDetails!.htmlContent,
                  onLinkTap: (url, _, __) => launchURL(url!),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
