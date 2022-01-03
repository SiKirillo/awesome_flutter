class Book {
  final String title;
  final String description;
  final String imageSrc;
  final String pdfSrc;

  const Book({
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.pdfSrc,
  });
}

const List<Book> books = [
  Book(
    title: 'How to Win Every Argument',
    description: 'Random description',
    imageSrc: 'assets/images/how_to_win_every_argument.png',
    pdfSrc: 'assets/pdf/how_to_win_every_argument.pdf',
  ),
  Book(
    title: 'Give and Take: WHY HELPING OTHERS DRIVES OUR SUCCESS',
    description: 'Random description',
    imageSrc:
    'assets/images/give_and_take_why_helping_others_drives_our_success.png',
    pdfSrc:
    'assets/pdf/give_and_take_why_helping_others_drives_our_success.pdf',
  ),
  Book(
    title: 'I am Malala: The Story of the Girl Who Stood Up for Education',
    description: 'Random description',
    imageSrc:
    'assets/images/i_am_malala_the_story_of_the_girl_who_stood_up_for_education.png',
    pdfSrc:
    'assets/pdf/i_am_malala_the_story_of_the_girl_who_stood_up_for_education.pdf',
  ),
  Book(
    title: 'CRITICAL THINKING: Consider the Verdict Sixth Edition',
    description: 'Random description',
    imageSrc: 'assets/images/critical_thinking_consider_the_verdict.png',
    pdfSrc: 'assets/pdf/critical_thinking_consider_the_verdict.pdf',
  ),
  Book(
    title: 'Shepherding a Child\'s Heart by Tedd Trip',
    description: 'Random description',
    imageSrc: 'assets/images/shepherding_a_childs_heart_by_tedd_trip.png',
    pdfSrc: 'assets/pdf/shepherding_a_childs_heart_by_tedd_trip.pdf',
  ),
];