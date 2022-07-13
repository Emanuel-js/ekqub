import 'package:flutter/cupertino.dart';

class CircleTabIndicator extends Decoration {
  Color color;
  double radius;

  CircleTabIndicator(
    this.color,
    this.radius,
  );

  //override createBoxPainter

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
//override paint
  Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint = Paint();
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset _center =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height / 2 + 15);
    canvas.drawCircle(_center, radius, _paint);
  }
}
