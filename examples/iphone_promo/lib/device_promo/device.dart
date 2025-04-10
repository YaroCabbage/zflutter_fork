import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class Device extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double border;
  final double zoom;

  const Device(
      {Key? key,
      this.child,
      this.color = Colors.black,
      this.border = 8,
      this.zoom = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = 138.6;
    final double height = 300;
    final double screenRadius = 18;
    final double logo = 30;

    return ZGroup(
      children: [
        ZPositioned(
          translate:
              ZVector(width / 2 + border + 0.25, -height / 2 + 80, -border / 2),
          child: ZRoundedRect(
            width: 0.5,
            height: 20,
            borderRadius: 20,
            fill: true,
            stroke: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        ZPositioned(
          translate: ZVector(
              -width / 2 - border - 0.25, -height / 2 + 35, -border / 2),
          child: ZRoundedRect(
            width: 0.5,
            height: 10,
            borderRadius: 20,
            fill: true,
            stroke: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        ZPositioned(
          translate: ZVector(
              -width / 2 - border - 0.25, -height / 2 + 60, -border / 2),
          child: ZRoundedRect(
            width: 0.5,
            height: 20,
            borderRadius: 20,
            fill: true,
            stroke: 0.5,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        ZGroup(
          sortMode: SortMode.update,
          children: [
            ZPositioned(
                translate: ZVector(
                    width / 2 - 20, -height / 2 + 35, -border - border / 4),
                child: ZGroup(
                  sortMode: SortMode.stack,
                  children: [
                    ZRoundedRect(
                      width: 18,
                      height: 48,
                      borderRadius: 20,
                      fill: true,
                      stroke: border / 2,
                      color: Colors.grey,
                    ),
                    ZPositioned(
                      translate: ZVector(0, 0, -border / 4),
                      child: ZRoundedRect(
                        width: 18,
                        height: 48,
                        borderRadius: 20,
                        fill: true,
                        stroke: 1,
                        color: Colors.black,
                      ),
                    ),
                    ZPositioned(
                      translate: ZVector(0, -12, -border / 4),
                      child: ZCircle(
                        diameter: 10,
                        fill: true,
                        stroke: 1,
                        color: Colors.white10,
                      ),
                    ),
                    ZPositioned(
                      translate: ZVector(0, 12, -border / 4),
                      child: ZCircle(
                        diameter: 10,
                        fill: true,
                        stroke: 1,
                        color: Colors.white10,
                      ),
                    ),
                    ZPositioned(
                      translate: ZVector(0, 0, -border / 4),
                      child: ZCircle(
                        diameter: 3,
                        fill: true,
                        stroke: 1,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                )),
            ZPositioned(
              translate: ZVector(
                  -width / 2 + 20, height / 2 - 35, -border - border / 4),
              child: ZShape(
                visible: false,
              ),
            ),
          ],
        ),
        ZGroup(
          sortMode: SortMode.stack,
          children: [
            ZPositioned(
              translate: ZVector(0, 0, -border / 2),
              child: ZRoundedRect(
                width: width + border,
                height: height + border,
                borderRadius: screenRadius + border / 2,
                fill: true,
                stroke: border,
                color: color == Color(0xffD8DCDB) ? Color(0xffced1d0) : color,
              ),
            ),
            ZPositioned(
              translate: ZVector(0, 0, -border),
              child: ZRoundedRect(
                width: width + border,
                height: height + border,
                borderRadius: screenRadius + border / 2,
                fill: true,
                stroke: 0,
                color: color == Color(0xffD8DCDB)
                    ? color
                    : Colors.white.withOpacity(0.02),
              ),
            ),
            ZPositioned(
                rotate: ZVector(0, -tau / 2, 0),
                translate: ZVector(0, 0, -border / 2 * zoom),
                child: ZToBoxAdapter(
                  height: logo,
                  width: logo,
                  child: Image.asset('assets/brand_logo.png')
                )),
          ],
        ),
        ZGroup(
          sortMode: SortMode.stack,
          children: [
            /* ZPositioned(
              scale: ZVector.all(1),
              child: ZRoundedRect(
                width: 200,
                height: 320,
                borderRadius: 33.7,
                fill: true,
                color: Colors.black,

              ),),*/
            ZRoundedRect(
              width: width,
              height: height,
              borderRadius: screenRadius,
              fill: true,
              color: color,
            ),
            ZToBoxAdapter(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenRadius),
                child: SizedBox.fromSize(
                    size: Size(width, height), child: Frame(app: child)),
              ),
            ),
            ZGroup(
              sortMode: SortMode.update,
              children: [
                ZPositioned(
                    translate: ZVector.only(y: -height / 2),
                    child: ZShape(
                      path: [
                        ZMove.vector(ZVector.zero),
                        ZLine.vector(ZVector.only(x: -30)),
                        ZArc.list([ZVector(-30, 10, 0), ZVector(-20, 10, 0)]),
                        ZLine.vector(ZVector(20, 10, 0)),
                        ZArc.list([ZVector(30, 10, 0), ZVector(30, 0, 0)]),
                      ],
                      fill: true,
                      color: color,
                    )),
                ZPositioned(
                    translate: ZVector.only(y: height / 2),
                    rotate: ZVector(0, 0, tau / 2),
                    child: ZShape(
                      visible: false,
                      path: [
                        ZMove.vector(ZVector.zero),
                        ZLine.only(x: -30),
                        ZArc.list([ZVector(-30, 10, 0), ZVector(-20, 10, 0)]),
                        ZLine.vector(ZVector(20, 10, 0)),
                        ZArc.list([ZVector(30, 10, 0), ZVector(30, 0, 0)]),
                      ],
                      fill: true,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class Frame extends StatelessWidget {
  final Widget? app;

  const Frame({Key? key, this.app}) : super(key: key);

  static TransitionBuilder get builder => (context, app) => Frame(app: app);

  @override
  Widget build(BuildContext context) {
    final theme = FrameThemeData();
    final MediaQueryData mediaQuery = MediaQueryData(
      size: Size(414, 896),
      padding: EdgeInsets.only(
        top: 44,
        bottom: 34,
      ),
      devicePixelRatio: 2,
    );
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: Builder(builder: (context) {
          final device = MediaQuery(
            data: mediaQuery,
            child: SizedBox.fromSize(
                size: mediaQuery.size,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    if (app != null) app!,
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 44,
                      child: _StatusBar(theme: theme),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        height: 4,
                        width: 140,
                        decoration: BoxDecoration(
                            color: theme.statusBarColor,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    )
                  ],
                )),
          );
          return device;
        }),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  final FrameThemeData? theme;

  const _StatusBar({Key? key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Theme(
      data: ThemeData(brightness: theme!.statusBarBrightness),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 30, top: 4),
              child: Text(
                '${date.hour}:${date.minute}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: theme!.statusBarColor),
              )),
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.signal_cellular_4_bar,
                  size: 14,
                ),
                SizedBox(width: 4),
                Icon(Icons.wifi, size: 16),
                SizedBox(width: 4),
                Icon(CupertinoIcons.battery_charging, size: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FrameThemeData {
  final Color frameColor;

  final Brightness statusBarBrightness;

  // const FrameThemeData({this.frameColor, this.statusBarBrightness});
  factory FrameThemeData({Color? frameColor, Brightness? statusBarBrightness}) {
    frameColor ??= Colors.black;
    statusBarBrightness ??= Brightness.light;
    return FrameThemeData.raw(
      frameColor: frameColor,
      statusBarBrightness: statusBarBrightness,
    );
  }

  const FrameThemeData.raw({
    required this.frameColor,
    required this.statusBarBrightness,
  })  : assert(frameColor != null),
        assert(statusBarBrightness != null);

  Color get statusBarColor =>
      statusBarBrightness == Brightness.dark ? Colors.white : Colors.black;
}
