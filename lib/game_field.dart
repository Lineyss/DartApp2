class Gamefiled {
  int cellWidth = 5;

  List<List<String>> field = [
    [" ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
    ["1", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["2", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["3", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["4", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["5", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["6", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["7", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["8", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["9", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    ["10"," ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
  ];

  void setShips(List<List<String>> ships)
  {
    for(int i = 0; i < 10; i++)
    {
      for(int j = 0; j < 10; j++)
      {
        field[i+1][j+1] = ships[i][j];
      }
    }
  }

  String formatCell(String cell)
  {
    return cell.padLeft((cellWidth - cell.length) ~/ 2 + cell.length).padRight(cellWidth);
  }

  String draw() {
      String result = "";
      for (int j = 0; j < field.length; j++) {
        for (int i = 0; i < field[0].length; i++) {
          String cell = formatCell(field[j][i]);
          result += "${cell}|";
        }
        result += "\n";
      }
      return result;
  }
}