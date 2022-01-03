import 'package:flutter/material.dart';
import 'package:mobile_book_reader/core/constants.dart';
import 'package:mobile_book_reader/core/widgets/content_wrapper.dart';
import 'package:mobile_book_reader/features/home/widgets/book_card.dart';
import 'package:mobile_book_reader/features/reader/domain/models/book_model.dart';
import 'package:mobile_book_reader/features/reader/screens/reader_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  void _onOpenPDFHandler(String pdfSrc, BuildContext context) {
    Navigator.of(context).pushNamed(
      ReaderScreen.routeName,
      arguments: pdfSrc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: StyleConstants.kGetDefaultTextStyle(),
        child: SafeArea(
          child: ContentWrapper(
            widget: Column(
              children: <Widget>[
                const Text(
                  'Book reader',
                  style: TextStyle(
                    fontSize: 26.0,
                  ),
                ),
                const SizedBox(
                  height: StyleConstants.kDefaultPadding * 3.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: books.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: StyleConstants.kDefaultPadding * 1.5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            _onOpenPDFHandler(books[index].pdfSrc, context),
                        child: BookCard(
                          book: books[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
