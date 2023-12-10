class ImageAssets {
  const ImageAssets._();
}

class AnimationsAssets {
  const AnimationsAssets._();
}

class IconsAssets {
  const IconsAssets._();
  // A
  // B
  // C
  // D
  // E
  // F
  // G
  // H
  // I
  // J
  // K
  // L
  // M
  // N
  // O
  // P
  // Q
  // R
  // S
  // T
  // U
  // V
  // W
  // X
  // Y
  // Z
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get svg => 'assets/icons/$this.svg';
  String get jpg => 'assets/images/$this.jpg';
  String get json => 'assets/animation/$this.json';
}
