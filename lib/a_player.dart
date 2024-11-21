import 'package:dart_application_1/game_field.dart';
import 'package:dart_application_1/Point.dart';

abstract class Player
{
  Map<int,int> gameRules = {
    4: 1,
    3: 2,
    2: 3,
    1: 4
  };

  late Gamefiled gameField;
  
  Player(this.gameField);

  List<List<String>> field  = [
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ];

  (bool valid, String error) validShip(List<Point> ships)
  {
    for(int i = 0; i < ships.length; i++) {
      Point ship = ships[i];

      if(ship.X > 9 || ship.Y > 9 || ship.X < 0 || ship.Y < 0) {
        return (false, "Не выходите за грань поля $ship");
      }

      if(field[ship.Y][ship.X] == "#") {
        return (false, "Поле $ship уже занято"); 
      }

      if(i == 0)
      {
        for(int di = -1; di <= 1; di++) {
          for(int dj = -1; dj <= 1; dj++) {
            if(di == 0 && dj == 0) continue;
            int newY = ship.Y + di;
            int newX = ship.X + dj;
            if (newY >= 0 && newY < field.length && newX >= 0 && newX < field[0].length) {
              if(field[ship.Y + di][ship.X + dj] == "#")
              {
                return (false, "Рядом с полем $ship есть корабли"); 
              }
            }
          }
        }
      }
      
      if(i != 0)
      {
        for(int di = -1; di <= 1; di++)
        {
          int newY = ship.Y + 1;
          int newX = ship.X + di;

          if (newY >= 0 && newY < field.length && newX >= 0 && newX < field[0].length) {
            return (false, "Рядом с полем $ship есть корабли"); 
          }

          if(ship.X != ships[i-1].X && ship.Y != ships[i-1].Y)
          {
            return (false, "Карабли нельзя распалагать по диагонали"); 
          }
        }
      }

    }
    return (true, "");
  }

  Point getShip();

  List<Point> getShips(int count, int type)
  {
    List<Point> ships = [];
    for(int i = 0; i < count; i ++)
    {
      bool isValid = true;
      do
      {
        List<Point> ships0 = [];
        for(int j = 0; j < type; j ++)
        {
          ships0.add(getShip()); 
        }
        dynamic result = validShip(ships0);
        isValid = result.$1;
        if(!isValid) {
          print(result.$2);
        }
        else
        {
          ships.addAll(ships0);
        }
      }
      while(!isValid);
    }

    return ships;
  }

  void drawShips()
  {
    gameRules.forEach((count ,type) {
      List<Point> ships = getShips(count, type);
      for(Point ship in ships)
      {
        field[ship.Y][ship.X] = "#";
      }
    });
  }

  void start();
}