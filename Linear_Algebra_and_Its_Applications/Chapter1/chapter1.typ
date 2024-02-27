#import "../typst/template/reference.typ": POINT,NOTE,TIP,cn_fake-italic,indent,example,line_cs,line_dc,Concept_review,regular_script
#import "../typst/template/page/basic.typ":basic,mitex

#let center_title = [LEARNING\ Linear Algebra and Its Applications]
#show:doc=>basic(
  title: center_title, // 标题
  authors: ((
    name: "aaron.li",
    affiliation: "pzhu",
    email: "communicate_aaron@outlook.com",
  ),),
  doc,
  chapter: 1,
)

= 线性代数中的线性方程组

#line_dc

#text(size: 15pt)[#align(center)[*前言*]]

在许多领域，研究者应用计算机分析*数学模型*，由于模型涉及的数据数量庞大且通常是#regular_script[线性]的，所以用#regular_script[线性方程组]描述。随着计算机功能和性能增强，线性代数在应用中的重要性随之增加。

#line_dc

== 线性方程组

*线性方程组是线性代数的核心*。