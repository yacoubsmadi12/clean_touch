import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'language_selection_model.dart';
export 'language_selection_model.dart';

/// Create a Language Selection Screen:
/// - White background (#FFFFFF).
///
/// - Top: animated CleanTouch logo (orange #FF9800) with fade animation.
/// - Text: "Choose your language" (black #212121).
/// - Two buttons horizontally:
///   1. Arabic button (#FF9800 background, white text).
///   2. English button (#00BFA6 background, black text).
/// - On button tap: save language selection and navigate to Welcome Screen.
class LanguageSelectionWidget extends StatefulWidget {
  const LanguageSelectionWidget({super.key});

  static String routeName = 'LanguageSelection';
  static String routePath = '/languageSelection';

  @override
  State<LanguageSelectionWidget> createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  late LanguageSelectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageSelectionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/jsons/Language_Translator.json',
                    width: 250.0,
                    height: 250.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'o41o0456' /* Choose your language */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF212121),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onDoubleTap: () async {
                          context.pushNamed(WelcomeWidget.routeName);
                        },
                        child: FFButtonWidget(
                          onPressed: () async {
                            setAppLanguage(context, 'ar');
                          },
                          text: FFLocalizations.of(context).getText(
                            'qkd9yuzn' /* العربية */,
                          ),
                          options: FFButtonOptions(
                            width: 140.0,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 16.0, 32.0, 16.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.orange,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onDoubleTap: () async {
                          context.pushNamed(WelcomeWidget.routeName);
                        },
                        child: FFButtonWidget(
                          onPressed: () async {
                            setAppLanguage(context, 'en');
                          },
                          text: FFLocalizations.of(context).getText(
                            'qcsy43dx' /* English */,
                          ),
                          options: FFButtonOptions(
                            width: 140.0,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 16.0, 32.0, 16.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF212121),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 24.0)),
                  ),
                ].divide(SizedBox(height: 48.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
