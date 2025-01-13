
enum Position {
  none,
  up,
  down
}

class Coordinates {
  final int row;
  final int col;

  const Coordinates({
    required this.row,
    required this.col,
  });

  Map<String, dynamic> toJson() => {
    'row': row,
    'col': col,
  };

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    row: json['row'] as int,
    col: json['col'] as int,
  );
}

class Piece {
  final String player;
  final Coordinates coordinates;
  final Position position;
  final bool isKing;
  final bool isAlive;

  const Piece({
    required this.player,
    required this.coordinates,
    required this.position,
    required this.isKing,
    required this.isAlive,
  });

  Map<String, dynamic> toJson() => {
    'player': player,
    'coordinates': coordinates.toJson(),
    'position': position.index,
    'is_king': isKing,
    'is_alive': isAlive,
  };

  factory Piece.fromJson(Map<String, dynamic> json) => Piece(
    player: json['player'] as String,
    coordinates: Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    position: Position.values[json['position'] as int],
    isKing: json['is_king'] as bool,
    isAlive: json['is_alive'] as bool,
  );
} 