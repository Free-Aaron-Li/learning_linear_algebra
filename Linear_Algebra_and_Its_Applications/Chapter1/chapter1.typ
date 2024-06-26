#import "../typst/template/reference.typ":*
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

在许多领域，研究者应用计算机分析*数学模型*，由于模型涉及的数据数量庞大且通常是#regular_script[线性]的，所以用#regular_script[线性方程组]描述。随着计算机功能和性能增强，线性代数在应用中的重要性随之增加。需要注意到：*线性方程组是线性代数的核心*。

#line_dc

== 线性方程组

*线性方程*形如：
$
  a_1x_1+a_2x_2+...+a_n x_n=b
$
其中$b$与*系数*$a_1,a_2,...,a_n$是实数或复数，通常是已知数。下标$n$可以是任意正整数。

*线性方程组*由一个或几个包含相同变量$x_1,x_2,...,x_n$组成的。线性方程组的*解*为一组数$(s_1,s_2,...,s_n)$，用这组数分别替代$x_1,x_2,...,x_n$时*所有*方程组由相同的解。

方程组所有可能的解的集合称为线性方程组的*解集*，若两个线性方程组由相同的解集，则认为这两个线性方程组是*等价*的。

#line_dc
#example_dc(title: [
  $
    x_1-2x_2 &=-1 \
    -x_1+3x_2&=3
  $
], solutions: [
  该方程组具有唯一解(3,2)
])

#line_dc

#THEOREM(
  title:[一般事实],
  des:[
    线性方程组的解有下列三种情况：
    #pad(x:2em)[
      1. 无解。
      2. 有唯一解。
      3. 有无穷多解。
    ] 
  ]
)

当一个线性方程组具有一个解或无穷多解，称它*相容的*；若无解，称它*不相容的*。

一个线性方程组包含的主要信息可以用一个*矩阵*的紧凑的矩阵阵列表示：
$
  &x_1 - &2x_2+med med med &x_3&&=0 \
  & &2x_2-8&x_3&&=8 \
  5&x_1&-5&x_3&&=10
$

把每一个变量的系数写在对齐的一列中，矩阵
$
mat(
  1,-2,1;
  0,2,-8;
  5,0,-5;
)
$

#indent
*增广矩阵*，其系数矩阵再添上一列（由方程组右边的常数组成）。
$
mat(
  1,-2,1,0;
  0,2,-8,8;
  5,0,-5,10;
)
$

矩阵的*尺寸*说明它包含的行数和列数。*$m*n$矩阵*表示$m$行$n$列的数的矩形阵列。

解线性方程组的一般方法：#regular_script[方程组用一个更容易解的等价方程组（即有相同解集的方程组）代替]。

化简线性方程组的三种变换为：
#pad(x:2em)[
  - 把某个方程换成它与另一方程的倍数的和。
  - 交换两个方程的位置。
  - 把某一个方程的所有项乘以一个非零常数。
]

线性方程的变换对应于增广矩阵的行变换。前面三种化简线性方程组的基本变换对应于增广矩阵的下列变换。
#THEOREM(
  title:[初等行变换],
  des:[
    #pad(x:2em)[
      1. （倍加变换）把某一行换成它本身与另一行的倍数的和。
      2. （对换变换）把两行对换。
      3. （倍乘变换）把某一行的所有元素乘同一个非零数。
    ]
  ]
)

#THEOREM(
  title:[一般事实],
  des:[
  若两个线性方程组的增广矩阵是行等价的，则他们具有相同的解集。
  ]
)

== 行化简与阶梯形矩阵

#rect(width: 100%)[
  *线性方程组的两个基本问题*
  1. 方程组是否相容，即它是否至少有一个解？
  2. 若它有解，它是否只有一个解，即解是否唯一？
]

这两个问题：基本存在与唯一性问题可通过行化简算法（行消去法）解决。

非零行的*先导元素*是指该行中最左边的非零元素。

\
#POINT[定义] 一个*矩阵*成为*阶梯形*（或*行阶梯形*），若它有以下三个性质：
#pad(x:2em)[
  1. 每一非零行都在每一零行之上。
  2. 每一行的先导元素所在的列位于前一行先导元素的右边。
  3. 某一先导元素所在列下方都是零。
  若一个阶梯形矩阵还满足以下性质，则称它为*简化阶梯形*（或*简化行阶梯形*）。
  4. 每一非零行的先导元素是1。
  5. 每一先导元素1是该元素所在列的唯一非零元素。
]
   
#THEOREM(
  title:[定理1],
  des:[
    简化阶梯形矩阵的唯一性：每个矩阵等价于唯一的简化阶梯形矩阵。
  ]
)

#POINT[定义] 矩阵中的*主元位置*是矩阵A中对应于它的简化阶梯形中先导元素1的位置。*主元列*是A的含有主元位置的列。

#rect(width:100%)[
  *行化简算法*

  共五步，前四步产生一个阶梯形矩阵，第五步产生简化阶梯形矩阵。

  *例题*：用初等变换把下列矩阵先化为阶梯形，再化为简化阶梯形。
  $
    mat(
      0,3,-6,6,4,-5;
      3,-7,8,-5,8,9;
      3,-9,12,-9,6,15;
    )
  $

  第一步，由最左边的非零列开始。这是一个主元列。主元位置在该列顶端。

  $
    mat(
      0,3,-6,6,4,-5;
      3,-7,8,-5,8,9;
      3,-9,12,-9,6,15;
    )
  $

  第二步，在主元列中选取一个非零元素作为主元。若有必要的话，对换两行使这个元素移到主元位置上。

  $
    mat(
      3,-9,12,-9,6,15;
      3,-7,8,-5,8,9;
      0,3,-6,6,4,-5;
    )
  $

  第三步，用倍加行变换将主元下面的元素变成0。

  $
    mat(
      3,-9,12,-9,6,15;
      0,2,-4,4,2,-6;
      0,3,-6,6,4,-5;
    )
  $

  第四步，暂时不管包含主元位置的行以及它上面的各行，对剩下的自矩阵使用上述的三步骤知道没有非零行需要处理为止。

  $
    mat(
      3,-9,12,-9,6,15;
      0,2,-4,4,2,-6;
      0,0,0,0,1,4;
    )
  $

  第五步，由最右边的主元开始，把每个主元上方的各元素变成0。若某个主元不是1，用倍乘将它变成1。

  $
    mat(
      3,-9,12,-9,0,-9;
      0,2,-4,4,0,-14;
      0,0,0,0,1,4;
    )
  $

  $
    mat(
      3,-9,12,-9,0,-9;
      0,1,-2,2,0,-7;
      0,0,0,0,1,4;
    )
  $

  $
    mat(
      3,0,-2,3,0,-24;
      0,1,-2,2,0,-7;
      0,0,0,0,1,4;
    )
  $

  得到原矩阵的简化阶梯形。

  第一步至第四步称为行化简算法的*向前步骤*，第五步称为*向后步骤*。
],

对应于主元列的变量（如$x_1,x_2$）称为*基本变量*，其他称为*自由变量*。

方程组的*通解*（解集的参数表示），给出所有解的显示表示。例如
$
cases(
  x_1=1+5x_3,
  x_2=4-x_3,
  x_3"是自由变量"
)
$
通常约定使用自由变量作为参数来表示解集。

#THEOREM(
  title:[定理2],
  des:[
    存在与唯一定理：线性方程组相容的充要条件是增广矩阵的最右列不是主原列。也就是说，增广矩阵的阶梯形没有形如
    $
      [0 ... 0 b],b!=0
    $
    的行，若线性方程组相容，则它的解集可能有两种情形：

    (i) 当没有自由变量时，有唯一解；

    (ii) 若至少有一个自由变量，则有无穷多解。
  ]
)

#rect(width: 100%)[
  *应用行化简算法解线性方程组*

  1. 写出方程组的增广矩阵。
  2. 应用行化简算法把增广矩阵化为阶梯形。确定方程组是否相容。如果没有解则停止；否则进行下一步。
  3. 继续行化简算法得到它的简化阶梯形。
  4. 写出由第3步所得矩阵对应的方程组
  5. 把第4步所得的每个非零方程改写为用任意自由变量表示其基本变量的形式。
]




 



























