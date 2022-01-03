import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_book_reader/core/constants.dart';
import 'package:mobile_book_reader/features/reader/domain/models/description_model.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class ReaderScreen extends StatefulWidget {
  static const routeName = '/reader';
  final String pdfSrc;

  const ReaderScreen({
    Key? key,
    required this.pdfSrc,
  }) : super(key: key);

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  late final PdfController _controller;
  bool _isLandscapeMode = false;
  bool _isInit = false;
  Description _description = descriptions[0];

  @override
  void initState() {
    super.initState();
    _onRotateScreenHandler();
    _controller = PdfController(document: PdfDocument.openAsset(widget.pdfSrc).whenComplete(() {
      setState(() {
        _isInit = true;
      });
    }));
  }

  @override
  void deactivate() {
    _onRotateScreenHandler(isDisposing: true);
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGoBackHandler() {
    _onRotateScreenHandler(isDisposing: true);
    Navigator.of(context).pop();
  }

  void _onRotateScreenHandler({bool isDisposing = false}) {
    if (_isLandscapeMode || isDisposing) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    _isLandscapeMode = !_isLandscapeMode;
  }

  void _onPageChangedHandler() {
    var nextIndex = math.Random().nextInt(descriptions.length - 1);
    setState(() {
      _description = descriptions[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final double verticalPadding = mq.size.height * 0.05;
    final double horizontalPadding = mq.size.width * 0.25;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultTextStyle(
        style: StyleConstants.kGetDefaultTextStyle(),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                left: _isLandscapeMode ? 0.0 : 20.0,
                right: _isLandscapeMode ? horizontalPadding : 20.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    PdfView(
                      controller: _controller,
                      documentLoader: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      pageLoader: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onPageChanged: (index) => _onPageChangedHandler(),
                    ),
                    if (_isInit)
                      Positioned(
                        bottom: 10.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              '${_controller.page} / ${_controller.pagesCount}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                left: _isLandscapeMode
                    ? mq.size.width - horizontalPadding
                    : mq.size.width,
                right: 0.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: _DescriptionBuilder(
                          key: ValueKey(
                              '${_description.text} + ${_description.imageSrc}'),
                          description: _description,
                          size: horizontalPadding,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: StyleConstants.kDefaultPadding,
                right: StyleConstants.kDefaultPadding,
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: const ValueKey('_onGoBackHandler'),
                      child: const Icon(Icons.arrow_back),
                      onPressed: _onGoBackHandler,
                    ),
                    const SizedBox(
                      height: StyleConstants.kDefaultPadding,
                    ),
                    FloatingActionButton(
                      heroTag: const ValueKey('_onRotateScreenHandler'),
                      child: const Icon(Icons.autorenew),
                      onPressed: _onRotateScreenHandler,
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

class _DescriptionBuilder extends StatelessWidget {
  final Description description;
  final double size;

  const _DescriptionBuilder({
    Key? key,
    required this.description,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return description.text != null
        ? AutoSizeText(
            description.text!,
            textAlign: TextAlign.center,
            minFontSize: 20.0,
            style: const TextStyle(color: Colors.black),
          )
        : CachedNetworkImage(
            imageUrl: description.imageSrc!,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return SizedBox(
                height: size * 0.4,
                width: size * 0.4,
                child: const CircularProgressIndicator(),
              );
            },
          );
  }
}
