class Teams {
  List<String> allteams;
  Teams({required this.allteams});
}

class BestaTeams extends Teams {
  BestaTeams()
    : super(
        allteams: [
          'Afturelding',
          'Breidablik',
          'FH',
          'Fram',
          'IA',
          'IBV',
          'Ka',
          'KR',
          'Stjarnan',
          'Valur',
          'Vestri',
          'Vikingur',
        ],
      );
}
