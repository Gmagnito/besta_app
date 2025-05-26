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
          'Fh',
          'Fram',
          'iA',
          'iBV',
          'Ka',
          'Kr',
          'Stjarnan',
          'Valur',
          'Vestri',
          'Vikingur',
        ],
      );
}
