import 'package:equatable/equatable.dart';

class RandomActivity extends Equatable {
  final String activity;
  final String type;
  final String link;
  final String? key;
  final int participants;
  final double price;
  final double accessibility;
  RandomActivity({
    required this.activity,
    required this.type,
    required this.link,
    this.key,
    required this.participants,
    required this.price,
    required this.accessibility,
  });
  @override
  List<Object?> get props => [
        activity,
        type,
        link,
        key,
        participants,
        price,
        accessibility,
      ];
}
/** API DATA SAMPLE
 {
  "activity": "Make a simple musical instrument",
  "type": "music",
  "participants": 1,
  "price": 0.4,
  "link": "",
  "key": "7091374",
  "accessibility": 0.25
}
 */