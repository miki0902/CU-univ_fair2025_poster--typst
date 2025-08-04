// =============================================================================
// JSTポスター テンプレート メインコンテンツファイル
// =============================================================================
// このファイルは、ポスターのメインコンテンツを統合・構成するファイルです。
// main.typの2カラムレイアウト内で表示される内容を定義しています。
//
// 構成:
// 1. グローバル設定のインポート
// 2. 研究背景・目的
// 3. 手法・アプローチ
// 4. 実験・結果
// 5. 結論・今後の課題
// 6. 参考文献

// =============================================================================
// グローバル設定のインポート
// =============================================================================
// globals.typから色設定、スタイル関数、数学記法等を読み込み
#import "/globals.typ": *

#let custom-par(content)={
    set par(leading:0.9em)
    content
}
#show: custom-par


// =============================================================================
// メインコンテンツの構成
// =============================================================================
//---Introduction---

= 研究背景
#grid(
    columns:(1fr,1fr),gutter: 1em,
    [
        //左側
        == ▪︎ CLIP#text(size:0.8em)[[A.Radford+, ICML'21]]
        - 代表的なVision-Language Modelの一つ
        - ゼロショットで一般画像分類や物体検出などの幅広いタスクで優れた予測が可能
    ],
    [
        //右側
        == ▪︎ CLIPの課題点
        - 画像とテキストのエンコーダを持つ構造上パラメータ数が大きい
        - 計算リソースの限られたエッジデバイスでの使用が困難
        
    ]
)
=== ▶︎ 性能を維持したCLIPの高速化・軽量化が求められる
#v(0.3em) 
#align(center)[
    // 太い青い線
    #line(length: 100%, stroke: 5pt + mprg-blue_1.lighten(50%) )
]
= 提案手法：モーデル間の知識蒸留によるCLIPの構造化枝刈り
    //*同一モーダル・異なるモーダルの観点から知識蒸留を行いつつ構造的に枝刈り*
- 提案手法の流れ：1ステップ学習　→ マスクの更新（枝刈り） →　一定ステップの学習を繰り返し行う
- 知識蒸留の設定：枝刈り前モデルを教師モデル，枝刈り中のモデルを生徒モデルとして使用
#grid(
    columns:(1fr,1fr),gutter: 1em,
    [
        //左側
        #v(0.0em) 
        == ▪︎ 提案手法における枝刈り
        - UPop#text(size:0.8em)[[D.shi+, ICML'23]]ベースのアプローチ
        + マスクの勾配に基づいて枝刈り箇所を選択
        + 枝刈り率を段階的に増加・マスクの値を段階的に減少させることで性能維持を促進
        + 各モジュールの枝刈り率を自動的に探索
        + 最終的にマスクの値を0に収束させパラメータギャップを排斥
        #v(0.25em) 
        == ▪︎ 提案手法における知識蒸留
        + 同一モーダルと異なるモーダルの観点から知識蒸留を使用
        + マスクの更新前後で使用する知識蒸留を切り替えることで，勾配衝突を回避
        === #align(left)[#v(-0.20em)▶︎ 枝刈り前の特徴表現を維持したモデルの枝刈りが可能]
    ],
    [
        //右側
        #v(0.0em) 
        #figure(
        image("image/method.png",width: 100%)
        )  
        #v(-0.2em)      
        - 各知識蒸留の損失設計

        + #sm[順位関係のみ転移：]$L_"relation" = 1/2 ("CE"(hat(q)^"t2i", q^"t2i") + "CE"(hat(q)^"i2t", q^"i2t"))$
          
        + #sm[類似度の値を転移：]$L_"diff" = 1/2 sum_(i=1)^N ("MSE"(hat(S)_i^"i2t", S_i^"i2t") + "MSE"(hat(S)_i^"t2i", S_i^"t2i"))$
          
        + #sm[特徴ベクトルの表現を転移：]$L_"same" = 1/2 ("MSE"(hat(t), t) + "MSE"(hat(v), v))$
    ]
)
#v(0.3em) 
#align(center)[
    // 太い青い線
    #line(length: 100%, stroke: 5pt + mprg-blue_1.lighten(50%) )
]

= 実験：UPopと提案手法によるCLIPの枝刈り比較
#grid(
    columns:(1fr,1fr),gutter: 1em,
    [
== ▪︎ 枝刈り直後における特徴表現維持度合いの比較
- データセット：COCO

- 定量的評価：各モーダルの特徴ベクトル（コサイン類似度・CKA類似度）・コサイン類似度行列（ピアソン相関係数）
    #figure(
    image("image/Quantitative_Evaluation.png",width: 90%)
    )
- 定性的評価：コサイン類似度行列をヒートマップで可視化
    #figure(
    image("image/Qualitative_Evaluation.png",width: 80%)
    )],
    [
== ▪︎ モデルの性能比較
- タスク：画像検索タスク，テキスト検索タスク
- データセット：COCO，Flickr30K
- 枝刈り率：$75%$

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: center + horizon,
  stroke: 1pt + black,
  
  // ヘッダー行
  table.cell(rowspan: 2, fill: gray.lighten(80%))[],
  table.cell(rowspan: 2, fill: gray.lighten(80%))[Fine-tuning],
  table.cell(colspan: 2, fill: gray.lighten(80%))[COCO],
  table.cell(colspan: 2, fill: gray.lighten(80%))[Flickr30K],
  
  // サブヘッダー行
  table.cell(fill: gray.lighten(80%))[image→text],
  table.cell(fill: gray.lighten(80%))[text→image],
  table.cell(fill: gray.lighten(80%))[image→text],
  table.cell(fill: gray.lighten(80%))[text→image],
  
  // データ行1: 枝刈り前モデル
  table.cell(fill: gray.lighten(80%))[#sm[枝刈り前モデル]],
  [✓],
  [71.48],
  [56.80],
  [96.80],
  [86.60],
  
  // データ行2: UPop (Fine-tuningなし)
  table.cell(rowspan: 2, fill: gray.lighten(80%))[UPop],
  [],
  [16.70],
  [13.55],
  [40.50],
  [23.30],
  
  // データ行3: UPop (Fine-tuningあり)
  [✓],
  [60.02],
  [43.64],
  [74.80],
  [63.32],
  
  // データ行4: Ours (Fine-tuningなし)
  table.cell(rowspan: 2, fill: gray.lighten(80%))[Ours],
  [],
  [*35.96*],
  [*33.81*],
  [*69.20*],
  [*65.04*],
  
  // データ行5: Ours (Fine-tuningあり)
  [✓],
  [*62.16*],
  [*47.41*],
  [*83.00*],
  [*70.86*],
)
== ▪︎ パラメータ数とFLOPsの比較
- データセット：COCO
//- 枝刈り率$75%$
#figure(
    image("image/ParamsFLOPs.png",width: 100%)
)
#rect(
    stroke:1pt,inset:0.8em,radius:4pt,[
    = 今後の展望
    #text(size:0.8em)[
    - キャプション生成タスクにおけるBLIPやBLIP-2のようなコサイン類似度行列を作成しないVLMに対する手法の探索
    - MoPE-CLIPとの差別化を考察]
    ]
)
]
)










 