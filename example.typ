// =============================================================================
// JSTポスター テンプレート サンプルファイル
// =============================================================================
// このファイルは、JSTポスターテンプレートの使用例を示すサンプルです。
// 実際の研究内容に合わせて編集してご利用ください。

// --- グローバル設定のインポート ---
#import "/globals.typ": *

// =============================================================================
// ページ設定（A0ポスター用）
// =============================================================================
#set page(
    paper: "a0",
    flipped: false,
    margin: (
        top: 3cm,
        bottom: 2cm,
        left: 2.5cm,
        right: 2.5cm,
    ),
)

// =============================================================================
// 基本スタイル設定
// =============================================================================
#set heading(numbering: none)
#set figure(numbering: none)
#set text(lang: "jp", size: 38pt, fill: body-text-color)
#set text(lang: "en", font: "Times New Roman", size: 32pt, fill: body-text-color)
#show math.equation: set text(size: 32pt)

// =============================================================================
// 見出しスタイル
// =============================================================================
#show heading.where(level: 1): it => {
    v(1em, weak: true)
    block(
        width: 100%,
        radius: 4pt,
        stroke: (left: 8pt + primary-color.darken(30%)),
        fill: gradient.linear(
            primary-color.lighten(20%),
            primary-color,
        ),
        inset: (x: 15pt, y: 20pt),
    )[
        #set text(
            size: 60pt,
            weight: "bold",
            fill: text-on-primary,
        )
        #it
    ]
    v(0.8em, weak: true)
}

#show heading.where(level: 2): it => {
    block(
        stroke: (left: 10pt + accent-color),
        inset: (x: 15pt),
    )[
        #set text(
            size: 40pt,
            weight: "semibold",
            fill: heading-text-color,
        )
        #it
        #v(0.5em, weak: true)
        #line(length: 100%, stroke: 2pt + line-color)
    ]
    v(0.5em, weak: true)
}

// =============================================================================
// タイトルブロック
// =============================================================================
#v(-3cm)

#block(
    fill: primary-color,
    width: 100%,
    radius: 4pt,
    stroke: (left: 8pt + primary-color.darken(30%)),
    inset: (top: 50pt, bottom: 50pt),
)[
    #align(center)[
        #set text(fill: text-on-primary)

        #text(size: 70pt, weight: 700)[
            機械学習による画像認識精度向上の研究
        ]

        #v(-0.5em)

        #text(size: 50pt)[山田太郎]
        #h(1em)
        #text(size: 50pt)[東京大学工学部]
    ]
]

// =============================================================================
// メインコンテンツ（2カラムレイアウト）
// =============================================================================
#columns(2, gutter: 2.5cm)[

// = 研究背景・目的

#research-objective[
    本研究では、_従来の画像認識手法の精度不足_を解決するため、
    _深層学習とアンサンブル手法を組み合わせた新しいアプローチ_を開発・実装しました。
    
    主な目標：
    - 画像認識精度の15%向上
    - 処理速度の10倍高速化
    - メモリ使用量の50%削減
]

// = 手法・アプローチ

提案手法の概要：

#key-point[
    1. **データ拡張**: 回転、反転、ノイズ追加による学習データの多様化
    2. **アンサンブル学習**: 複数のCNNモデルの予測結果を統合
    3. **転移学習**: 事前学習済みモデルの特徴抽出層を活用
]

// 提案手法の数式：
$f(x) = argmin_(theta) sum_(i=1)^n L(y_i, h_theta(x_i)) + lambda R(theta)$

// アルゴリズム：
```
1. データ前処理（正規化、拡張）
2. 複数CNNモデルの並列学習
3. アンサンブル予測の実行
4. 結果の統合と評価
```

// = 実験・結果

#result-box[
    主要な実験結果：
    
    - 認識精度：従来手法比 +18.5%
    - 処理速度：12倍高速化
    - メモリ使用量：45%削減
    
    統計的有意性も確認済み（p < 0.001）
]

// 実験結果の表：
#table(
    columns: 4,
    [*手法*], [*精度*], [*速度*], [*メモリ*],
    [従来手法], [82.3%], [1.0s], [100MB],
    [提案手法], [97.5%], [0.08s], [55MB],
    [改善率], [+18.5%], [12.5倍], [-45%],
)

// = 結論・今後の課題

#key-point[
    本研究の主要な貢献：
    
    1. _深層学習とアンサンブル手法の効果的な組み合わせ_
    2. _実用的な処理速度での高精度画像認識の実現_
    3. _リソース効率的な学習手法の提案_
]

今後の課題：
- より大規模なデータセットでの検証
- リアルタイム処理への応用
- 他の画像認識タスクへの拡張

// = 参考文献

[1] Krizhevsky, A., et al., "ImageNet Classification with Deep Convolutional Neural Networks", NIPS, 2012.

[2] He, K., et al., "Deep Residual Learning for Image Recognition", CVPR, 2016.

[3] Szegedy, C., et al., "Going Deeper with Convolutions", CVPR, 2015.

// =============================================================================
// 連絡先情報
// =============================================================================
#v(2em)
#align(center)[
    #text(size: 24pt, fill: muted-text-color)[
        連絡先：`yamada@example.com` | 研究室URL: `https://example-lab.example.com`
    ]
]

] 