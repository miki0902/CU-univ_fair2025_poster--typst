# JSTポスター Typstテンプレート

このリポジトリは、JST（科学技術振興機構）の研究発表用ポスターを作成するためのTypstテンプレートです。

## 特徴

- **A0サイズ対応**: 学術ポスター標準サイズ（841mm × 1189mm）
- **JSTブランドカラー**: 公式ブランドカラーに基づいたデザイン
- **2カラムレイアウト**: 読みやすさを重視した構成
- **日本語対応**: 日本語フォントとレイアウトに最適化
- **数学記法対応**: LaTeX風の数式記法をサポート
- **図表作成機能**: CeTZライブラリによる高度な図表作成

## 作成されたポスター

このテンプレートを使用して作成されたポスターの例です：

### 📄 ポスターPDF
[![JSTポスター例](https://img.shields.io/badge/PDF-ポスターを表示-blue?style=for-the-badge&logo=adobe-acrobat-reader)](main.pdf)

**タイトル**: パネル3：枝刈り - モーデル間の知識蒸留によるCLIPの構造化枝刈り  
**発表者**: 小林亮太，西川実希  
**所属**: 中部大学　MPRG：機械知覚&ロボティクスグループ

> 💡 **ヒント**: PDFリンクをクリックすると、ブラウザでポスターを直接表示できます。



### 🎨 デザインの特徴

- **A0サイズ**: 学術ポスター標準サイズ（841mm × 1189mm）
- **2カラムレイアウト**: 読みやすさを重視した構成
- **JSTブランドカラー**: 公式カラーパレットを使用
- **日本語最適化**: 日本語フォントとレイアウトに最適化

## ファイル構成

```
jst_poster_template/
├── main.typ          # メインファイル（レイアウト・スタイル設定）
├── globals.typ       # グローバル設定（色、関数、数学記法）
├── contents.typ      # メインコンテンツ（ポスター内容）
├── refs.bib          # 参考文献データベース（BibTeX形式）
├── modified-ieee.csl # 引用スタイルファイル
└── README.md         # このファイル
```

## 初めての方へ - Typstの基本

### Typstとは
Typstは、LaTeXの代替となる現代的な組版システムです。より直感的な文法と高速なコンパイルを特徴としています。

### 基本的な文法
- `#` でコマンドを開始
- `{}` でブロックを囲む
- `[]` で引数を指定
- `=` で見出しを作成

## 環境セットアップ

### 1. Typstのインストール

```bash
# macOS
brew install typst

# Windows (Chocolatey)
choco install typst

# Linux
curl -fsSL https://typst.app/install.sh | sh

# その他のOS
# https://typst.app/docs/getting-started/installation を参照
```

### 2. インストール確認

```bash
typst --version
```

## 基本的な文章の書き方

### 見出しの作成

```typst
= 大見出し
== 中見出し
=== 小見出し
```

### 段落と改行

```typst
// 通常の段落
これは通常の段落です。

// 強制改行
これは改行されます。#linebreak()
次の行に移動します。

// 空行で段落を分ける
最初の段落。

二番目の段落。
```

### 箇条書きの作成

```typst
// 通常の箇条書き
- 項目1
- 項目2
- 項目3

// 番号付き箇条書き
1. 最初の項目
2. 二番目の項目
3. 三番目の項目

// ネストした箇条書き
- 親項目
  - 子項目1
  - 子項目2
    - 孫項目
```

### 強調と装飾

```typst
*太字*
_斜体_
`コード`
#highlight[ハイライト]
```

## 図表の挿入方法

### 画像の挿入

```typst
// 基本的な画像挿入
#figure(
    image("image/example.png", width: 80%),
    caption: "図の説明"
)

// サイズ指定
image("image/example.png", width: 10cm, height: 5cm)

// 配置指定
#figure(
    image("image/example.png", width: 60%),
    caption: "図の説明",
    placement: left
)
```

### 表の作成

```typst
// 基本的な表
#table(
    columns: 3,
    [*項目*], [*値1*], [*値2*],
    [項目A], [10], [20],
    [項目B], [30], [40],
)

// より詳細な表
#table(
    columns: (auto, auto, auto),
    stroke: 0.5pt,
    [*実験*], [*精度*], [*時間*],
    [実験A], [95%], [10秒],
    [実験B], [92%], [8秒],
    [実験C], [98%], [15秒],
)
```

### 数式の挿入

```typst
// インライン数式
$f(x) = x^2 + 2x + 1$

// ブロック数式
$f(x) = sum_(i=1)^n x_i^2$

// 複数行の数式
$
f(x) &= x^2 + 2x + 1 \
&= (x + 1)^2
$
```

## レイアウトの作成

### グリッドレイアウト

```typst
#grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
        // 左側のコンテンツ
        左側の内容
    ],
    [
        // 右側のコンテンツ
        右側の内容
    ]
)
```

### カラムレイアウト

```typst
#columns(2, gutter: 2cm)[
    左カラムの内容
]
```

### ボックスとフレーム

```typst
// 基本的なボックス
#box(content)

// フレーム付きボックス
#box(
    stroke: 1pt,
    fill: rgb("#f0f0f0"),
    content
)
```

## コンパイル方法

### 基本的なコンパイル

```bash
# PDFファイルを生成
typst compile main.typ

# 出力ファイル名を指定
typst compile main.typ --output poster.pdf
```

### 監視モード（推奨）

```bash
# ファイル変更を監視して自動コンパイル
typst watch main.typ

# 出力ファイル名を指定して監視
typst watch main.typ --output poster.pdf
```

### フォント埋め込み

```bash
# フォントを埋め込んでPDFを生成
typst compile main.typ --font-path /path/to/fonts
```

## ポスター作成の手順

### 1. プロジェクトの準備

```bash
# テンプレートをコピー
git clone [repository-url]
cd jposter_template

# または、ファイルを直接ダウンロード
```

### 2. 内容の編集

`contents.typ`を編集してポスター内容を記述します：

```typst
// タイトル
= 研究タイトル

// 背景
== 研究背景
- 現状の課題
- 問題の重要性

// 手法
== 提案手法
- アプローチの説明
- 技術的な詳細

// 結果
== 実験結果
- 実験設定
- 結果の分析

// 結論
== 結論
- 成果のまとめ
- 今後の課題
```

### 3. 画像の追加

1. `image/`フォルダに画像ファイルを配置
2. `contents.typ`で画像を参照

```typst
#figure(
    image("image/result.png", width: 80%),
    caption: "実験結果"
)
```

### 4. コンパイルと確認

```bash
# 監視モードでコンパイル
typst watch main.typ

# ブラウザでPDFを確認
open main.pdf
```

## カスタマイズ

### 色の変更

`globals.typ`の以下の部分を編集：

```typst
#let primary-color = rgb("#1e3a8a") // メインカラー
#let accent-color = rgb("#dc2626")  // アクセントカラー
#let body-text-color = rgb("#374151") // 本文色
```

### フォントサイズの調整

`main.typ`の以下の部分を編集：

```typst
#set text(lang: "jp", size: 32pt, fill: body-text-color)
```

### レイアウトの変更

```typst
// カラム数と間隔の変更
#columns(3, gutter: 1.5cm)[
    #include "/contents.typ"
]

// ページサイズの変更
#set page(
    paper: "a0",
    margin: (2cm, 2cm, 2cm, 2cm)
)
```

## 利用可能なスタイル関数

### ボックススタイル

```typst
// 重要ポイント
#key-point[重要ポイントの説明]

// 研究目的
#research-objective[研究目的の説明]

// 結果ボックス
#result-box[実験結果の説明]
```

### テキスト装飾

```typst
#sm[小さなテキスト]
#lg[大きなテキスト]
#xl[非常に大きなテキスト]
#highlight[ハイライト表示]
```

### 数学記法

```typst
$argmin_x f(x)$  // argmin演算子
$argmax_x f(x)$  // argmax演算子
$E[X]$           // 期待値
$Var[X]$         // 分散
$sum_(i=1)^n$    // 総和
$prod_(i=1)^n$   // 総積
```

## トラブルシューティング

### よくある問題と解決方法

#### 1. 日本語が表示されない

**症状**: 日本語が文字化けする、または表示されない

**解決方法**:
```typst
// main.typで以下を確認
#set text(lang: "jp")
```

#### 2. 図表が表示されない

**症状**: 画像や表が表示されない

**解決方法**:
- ファイルパスが正しいか確認
- 画像ファイルが存在するか確認
- ファイル名の大文字小文字を確認

#### 3. コンパイルエラー

**症状**: コンパイル時にエラーが発生

**解決方法**:
```bash
# エラーの詳細を確認
typst compile main.typ --diagnostic-format=human

# 構文エラーの確認
typst check main.typ
```

#### 4. フォントが見つからない

**症状**: フォント関連のエラー

**解決方法**:
```bash
# システムフォントを使用
typst compile main.typ --font-path /System/Library/Fonts
```

## 参考資料

- [Typst公式ドキュメント](https://typst.app/docs)
- [Typstチートシート](https://typst.app/docs/reference/cheat-sheet)
- [CeTZライブラリ](https://github.com/johannes-wolf/cetz)
- [JST公式サイト](https://www.jst.go.jp/)

## ライセンス

このテンプレートはMITライセンスの下で提供されています。

## 貢献

バグ報告や機能要望は、GitHubのIssueでお知らせください。 