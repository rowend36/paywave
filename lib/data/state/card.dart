import 'package:flutter/material.dart';
import '../models/card_details.dart';

class CardProvider extends ChangeNotifier {
  CardModel? _cardModel;

  CardModel? get cardModel => _cardModel;

  void setCardModel(CardModel model) {
    _cardModel = model;
    notifyListeners();
  }
}
