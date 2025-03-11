import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // control the middle image
  Widget controlPlaceHolder = const Placeholder();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                AspectRatio(aspectRatio: 1, child: controlPlaceHolder),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          // FractionallySIzedBoxでもう一度幅を固定する
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Close'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      //　ここでWeatherAPIを実行する
                      _handleMiddleImage('cloudy.svg');
                    },
                    child: const Text('Reload'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // set image
  void _handleMiddleImage(String weatherCondition) {
    setState(() {
      final Widget svg = SvgPicture.asset('assets/$weatherCondition');
      print(svg);
      controlPlaceHolder = svg;
    });
  }
}

class WeatherScreenVerTwo extends StatelessWidget {
  const WeatherScreenVerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                // place holder widget
                const AspectRatio(aspectRatio: 1, child: Placeholder()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    // text widget
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '** ℃',
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 計算：画面の中央から矩形の高さの半分を下に80pxを足した位置
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Close'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Reload'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class WeatherScreenVerThree extends StatelessWidget {
  const WeatherScreenVerThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 画面の半分の幅を計算
            final halfWidth = constraints.maxWidth / 2;

            // ボタンと矩形のセパレーション
            const separation = 80.0;

            // プレースホルダーの正方形サイズ
            final placeholderSize = halfWidth;

            // 矩形全体の高さを計算 (プレースホルダー + テキスト部分の高さ)
            // テキスト部分は上下16pxのパディングがあるので、仮に高さを40pxとして計算
            final rectHeight = placeholderSize + 40.0;

            // 矩形とボタンを含む全体の高さ
            final totalHeight = rectHeight + separation + 40.0; // 40.0はボタンの概算高さ

            // 画面中央から全体の半分を上にずらした位置 (矩形の開始位置)
            final startY = (constraints.maxHeight - totalHeight) / 2;

            return Stack(
              children: [
                // 矩形部分 (Placeholder + Text)
                Positioned(
                  left: (constraints.maxWidth - halfWidth) / 2,
                  top: startY,
                  width: halfWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 正方形のプレースホルダー
                      SizedBox(
                        width: placeholderSize,
                        height: placeholderSize,
                        child: const Placeholder(),
                      ),
                      // 温度表示部分
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            // 左側（青）のテキスト
                            Expanded(
                              child: Text(
                                '** ℃',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.blue),
                              ),
                            ),
                            // 右側（赤）のテキスト
                            Expanded(
                              child: Text(
                                '** ℃',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ボタン部分
                Positioned(
                  left: 0,
                  right: 0,
                  top: startY + rectHeight + separation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Close')),
                      TextButton(onPressed: () {}, child: const Text('Reload')),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
