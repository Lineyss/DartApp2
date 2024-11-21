  import 'dart:math';

  import 'package:dart_application_1/Point.dart';
  import 'package:dart_application_1/a_player.dart';

  class PlayerBot extends Player
  {
    PlayerBot(super.gameField);
    int _currentX = 0;
    int _currentY = 0;

    @override
    Point getShip() {
      if (_currentX >= 10) {
        _currentX = 0;
        _currentY = 0;
      }

      Point currentPoint = Point(_currentX, _currentY);

      _currentY++;

      if (_currentY >= 10) {
        _currentY = 0;
        _currentX++;
      }

      return currentPoint;
    }

    @override
    void start() {
      drawShips();
      gameField.setShips(field);
      print(gameField.draw());
    }
  }