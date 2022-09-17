class Question {
  final String text;
  final List<Option> options;
  bool islocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.islocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;
  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final languageQuestions = [
  Question(text: 'I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: true),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: false),
  ]),
  Question(text: '2 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: false),
    const Option(text: 'are', isCorrect: true),
    const Option(text: 'is', isCorrect: false),
  ]),
  Question(text: '3 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: true),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: false),
  ]),
  Question(text: '4 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: false),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: true),
  ]),
  Question(text: '5 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: true),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: false),
  ]),
];

final mathQuestions = [
  Question(text: 'Math Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: true),
    const Option(text: '4', isCorrect: false),
  ]),
  Question(text: 'Math Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: true),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
  Question(text: 'Math Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: true),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
];

final chemistryQuestions = [
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: true),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: true),
  ]),
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: true),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
];

final pyhsicsQuestions = [
  Question(text: 'Pyhsics Question', options: [
    const Option(text: '1', isCorrect: true),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: true),
  ]),
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: true),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
];
final historyQuestions = [
  Question(text: 'History Question', options: [
    const Option(text: '1', isCorrect: true),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: false),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: true),
  ]),
  Question(text: 'Chemistry Question', options: [
    const Option(text: '1', isCorrect: false),
    const Option(text: '2', isCorrect: true),
    const Option(text: '3', isCorrect: false),
    const Option(text: '4', isCorrect: false),
  ]),
];
