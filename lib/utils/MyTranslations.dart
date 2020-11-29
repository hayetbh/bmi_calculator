import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'BMI Calculator %s',
          'male': 'NEXT',
          'female': 'BACK',
          'height': 'Validate Email',
          'weight': 'Email Correct',
          'age': 'Good Email Format',
          'result': 'Email incorrect',
          'button': 'calcul'
        },
        'fr': {
          'title': 'BMI Calculatrice %s',
          'next': 'SUIVANT',
          'back': 'RETOUR',
          'valide': 'valider Email ',
          'correct': 'Email Correct',
          'formatgood': 'Bon Email Format',
          'incorrect': 'Email incorrect',
          'formatbad': 'Mauvais Email Format'
        },
      };
}
