import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/in_chat_ad_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat_thread/chat_thread_widget.dart';
import '/walkthroughs/sharing_is_caring.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trash_me_model.dart';
export 'trash_me_model.dart';

class TrashMeWidget extends StatefulWidget {
  const TrashMeWidget({super.key});

  @override
  State<TrashMeWidget> createState() => _TrashMeWidgetState();
}

class _TrashMeWidgetState extends State<TrashMeWidget>
    with TickerProviderStateMixin {
  late TrashMeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrashMeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Trash_Me'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRASH_ME_PAGE_Trash_Me_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          _model.addToMessages(MessagesStruct(
            message: FFAppConstants.initialMessage,
            isUser: false,
            createdTime: getCurrentTimestamp,
            isLoading: false,
          ));
          setState(() {});
          if (!((FFAppState().isFromFilled == true) &&
              FFAppConstants.initialPopupStatus)) {
            // DelayPopUp
            await actions.customDelay(
              FFAppConstants.popupDelay,
            );
            if (MediaQuery.sizeOf(context).width <= 479.0) {}
          }
        }),
        Future(() async {
          // Query To Load Ads
          _model.inChatAdsFromQuery = await queryAdManagementRecordOnce(
            queryBuilder: (adManagementRecord) => adManagementRecord.where(
              'adType',
              isEqualTo: 'In Chat Message',
            ),
            limit: 5,
          );
          // Loading Query Result to Page State
          _model.inChatAds =
              _model.inChatAdsFromQuery!.toList().cast<AdManagementRecord>();
          setState(() {});
        }),
      ]);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeIn,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: -2.5,
            end: -3.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width > 991.0
                              ? (MediaQuery.sizeOf(context).width * 0.37)
                              : 0.0,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width > 991.0
                              ? (MediaQuery.sizeOf(context).width * 0.37)
                              : 0.0,
                          0.0,
                        ),
                        0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF073D82),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFA3C1E2),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEC1C41),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(),
                                    child: Visibility(
                                      visible: currentUserReference != null,
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'TRASH_ME_PAGE_Image_pvgdjtwd_ON_TAP');

                                            context.pushNamed('ProfilePage');
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            child: Image.asset(
                                              'assets/images/gray-photo-placeholder-icon-design-ui-vector-35850819_(1).jpg',
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'LET\'S TALK TRASH ',
                                        textAlign: TextAlign.center,
                                        minFontSize: 25.0,
                                        style: GoogleFonts.getFont(
                                          'Barlow Condensed',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 30.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'TRASH_ME_PAGE_Icon_x8y7hy5j_ON_TAP');
                                      _model.messages = [];
                                      setState(() {});
                                      _model.addToMessages(MessagesStruct(
                                        message: FFAppConstants.initialMessage,
                                        isUser: false,
                                        createdTime: getCurrentTimestamp,
                                        isLoading: false,
                                      ));
                                      setState(() {});
                                      _model.focusTextField = false;
                                      setState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 250));
                                      _model.focusTextField = true;
                                      setState(() {});
                                      logFirebaseEvent('Reset_Button_Click');
                                    },
                                    child: Icon(
                                      Icons.restart_alt_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 25.0,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation']!),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final chatMessages = functions
                                            .sortListDesending(
                                                _model.messages.toList())
                                            .toList();

                                        return ListView.builder(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            12.0,
                                            0,
                                            24.0,
                                          ),
                                          reverse: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: chatMessages.length,
                                          itemBuilder:
                                              (context, chatMessagesIndex) {
                                            final chatMessagesItem =
                                                chatMessages[chatMessagesIndex];
                                            return Builder(
                                              builder: (context) {
                                                if (!chatMessagesItem.isAd) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .chatThreadModels
                                                                .getModel(
                                                              chatMessagesIndex
                                                                  .toString(),
                                                              chatMessagesIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                ChatThreadWidget(
                                                              key: Key(
                                                                'Keyqj9_${chatMessagesIndex.toString()}',
                                                              ),
                                                              message:
                                                                  chatMessagesItem,
                                                              typeScriptAnimate:
                                                                  _model.messages
                                                                              .length <=
                                                                          1
                                                                      ? true
                                                                      : false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return InChatAdWidget(
                                                    key: Key(
                                                        'Keyxmh_${chatMessagesIndex}_of_${chatMessages.length}'),
                                                    adDetails: functions
                                                        .geRandomInChatBanner(
                                                            _model.inChatAds
                                                                .toList()),
                                                  );
                                                }
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    _model.showConfetti,
                                    false,
                                  ))
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        child: custom_widgets.ConfettiOverlay(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          loop: false,
                                          particleCount: 20,
                                          gravity: 0.2,
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation']!,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 70.0,
                              constraints: const BoxConstraints(
                                minHeight: 70.0,
                                maxHeight: 250.0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEC1C41),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    offset: const Offset(
                                      0.0,
                                      -2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 8.0, 10.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Image.asset(
                                          'assets/images/ic_placeholder_user.jpg',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (_model.focusTextField)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        key: const ValueKey(
                                                            'TextField_hkv0'),
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textController',
                                                          const Duration(
                                                              milliseconds: 0),
                                                          () => setState(() {}),
                                                        ),
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          logFirebaseEvent(
                                                              'TRASH_ME_TextField_80vmcqrw_ON_TEXTFIELD');
                                                          if (_model.textController
                                                                      .text !=
                                                                  '') {
                                                            _model.typedMessage =
                                                                _model
                                                                    .textController
                                                                    .text;
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Trash_Talk_Text_Enter');
                                                            _model.addToMessages(
                                                                MessagesStruct(
                                                              message: _model
                                                                  .typedMessage,
                                                              isUser: true,
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              isLoading: false,
                                                            ));
                                                            setState(() {});
                                                            setState(() {
                                                              _model
                                                                  .textController
                                                                  ?.clear();
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        500));
                                                            _model.addToMessages(
                                                                MessagesStruct(
                                                              message: 'dgfdgd',
                                                              isUser: false,
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              isLoading: true,
                                                            ));
                                                            setState(() {});
                                                            _model.responseCopy =
                                                                await ChatBotCall
                                                                    .call(
                                                              message: _model
                                                                  .typedMessage,
                                                            );

                                                            if ((_model.responseCopy
                                                                        ?.succeeded ??
                                                                    true) ==
                                                                true) {
                                                              _model.removeFromMessages(_model
                                                                  .messages
                                                                  .where((e) =>
                                                                      e.isLoading ==
                                                                      true)
                                                                  .toList()
                                                                  .first);
                                                              setState(() {});
                                                              _model.addToMessages(
                                                                  MessagesStruct(
                                                                message: ChatBotCall
                                                                    .botMessage(
                                                                  (_model.responseCopy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                isUser: false,
                                                                createdTime:
                                                                    getCurrentTimestamp,
                                                                isLoading:
                                                                    false,
                                                              ));
                                                              _model.adGap =
                                                                  _model.adGap! +
                                                                      1;
                                                              setState(() {});
                                                              if ((_model.adGap! >=
                                                                      FFAppConstants
                                                                          .adGapConst) &&
                                                                  FFAppConstants
                                                                      .inMessageAdStatus) {
                                                                _model.adGap =
                                                                    0;
                                                                _model.addToMessages(
                                                                    MessagesStruct(
                                                                  message:
                                                                      'Ad Test',
                                                                  isUser: false,
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  isLoading:
                                                                      false,
                                                                  isAd: true,
                                                                ));
                                                                setState(() {});
                                                              }
                                                            } else {
                                                              _model.removeFromMessages(_model
                                                                  .messages
                                                                  .where((e) =>
                                                                      e.isLoading ==
                                                                      true)
                                                                  .toList()
                                                                  .first);
                                                              setState(() {});
                                                            }

                                                            _model.typedMessage =
                                                                null;
                                                            _model.focusTextField =
                                                                false;
                                                            setState(() {});
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        250));
                                                            _model.focusTextField =
                                                                true;
                                                            setState(() {});
                                                          }

                                                          setState(() {});
                                                        },
                                                        autofocus: true,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        textInputAction:
                                                            TextInputAction
                                                                .send,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          hintText:
                                                              'Talk your trash here',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          errorStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Barlow Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      16.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        maxLines: null,
                                                        minLines: 1,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textFieldOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: _model.textController.text != ''
                                            ? 1.0
                                            : 0.5,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'TRASH_ME_PAGE_Container_683ziz0w_ON_TAP');
                                            if (_model.textController.text !=
                                                    '') {
                                              _model.typedMessage =
                                                  _model.textController.text;
                                              setState(() {});
                                              logFirebaseEvent(
                                                  'Trash_Talk_Button');
                                              _model
                                                  .addToMessages(MessagesStruct(
                                                message: _model.typedMessage,
                                                isUser: true,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                isLoading: false,
                                              ));
                                              setState(() {});
                                              setState(() {
                                                _model.textController?.clear();
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500));
                                              _model
                                                  .addToMessages(MessagesStruct(
                                                message: 'dgfdgd',
                                                isUser: false,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                isLoading: true,
                                              ));
                                              setState(() {});
                                              _model.responseCopy2 =
                                                  await ChatBotCall.call(
                                                message: _model.typedMessage,
                                              );

                                              if ((_model.responseCopy2
                                                          ?.succeeded ??
                                                      true) ==
                                                  true) {
                                                _model.removeFromMessages(_model
                                                    .messages
                                                    .where((e) =>
                                                        e.isLoading == true)
                                                    .toList()
                                                    .first);
                                                setState(() {});
                                                _model.addToMessages(
                                                    MessagesStruct(
                                                  message:
                                                      ChatBotCall.botMessage(
                                                    (_model.responseCopy2
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  isUser: false,
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  isLoading: false,
                                                ));
                                                _model.adGap =
                                                    _model.adGap! + 1;
                                                setState(() {});
                                                if ((_model.adGap! >=
                                                        FFAppConstants
                                                            .adGapConst) &&
                                                    FFAppConstants
                                                        .inMessageAdStatus) {
                                                  _model.adGap = 0;
                                                  _model.addToMessages(
                                                      MessagesStruct(
                                                    message: 'Ad Test',
                                                    isUser: false,
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                    isLoading: false,
                                                    isAd: true,
                                                  ));
                                                  setState(() {});
                                                }
                                              } else {
                                                _model.removeFromMessages(_model
                                                    .messages
                                                    .where((e) =>
                                                        e.isLoading == true)
                                                    .toList()
                                                    .first);
                                                setState(() {});
                                              }

                                              _model.typedMessage = null;
                                              _model.focusTextField = false;
                                              setState(() {});
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 250));
                                              _model.focusTextField = true;
                                              setState(() {});
                                            }

                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF8ABAE0),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child: Icon(
                                              Icons.send,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (!(isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible))
                                  Opacity(
                                    opacity:
                                        FFAppConstants.feedbackButtonsStatus
                                            ? 1.0
                                            : 0.3,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TRASH_ME_PAGE_Image_zc17up0x_ON_TAP');
                                          if (FFAppConstants
                                              .feedbackButtonsStatus) {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <=
                                                479.0) {}
                                            logFirebaseEvent(
                                                'Like_Button_Click');
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Group.png',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!(isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 25.0, 20.0, 25.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'TRASH_ME_PAGE_Container_qqkv40wa_ON_TAP');
                                        if (isWeb) {
                                          if (MediaQuery.sizeOf(context)
                                                  .width <=
                                              479.0) {
                                            await actions.shareAction();
                                          }
                                        } else {
                                          // MobileSharing
                                          await actions.shareAction();
                                        }

                                        logFirebaseEvent('Share_Button_Click');
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFA3C1E2),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            'SHARE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Barlow Condensed',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 16.0,
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ).addWalkthrough(
                                            text12thdx64,
                                            _model.sharingIsCaringController,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!(isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible))
                                  Opacity(
                                    opacity:
                                        FFAppConstants.feedbackButtonsStatus
                                            ? 1.0
                                            : 0.3,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TRASH_ME_PAGE_Image_e5aplv7d_ON_TAP');
                                          if (FFAppConstants
                                              .feedbackButtonsStatus) {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <=
                                                479.0) {}
                                            logFirebaseEvent(
                                                'Dislike_Button_Click');
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/Thumbs_Down_Red.svg',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
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
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.01, -0.97),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('TRASH_ME_PAGE_Image_zr1idt3p_ON_TAP');
                        await launchURL('https://www.rivalslam.com');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Screenshot_2024-07-23_at_4.48.48_PM.png',
                          height: 50.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.sharingIsCaringController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
