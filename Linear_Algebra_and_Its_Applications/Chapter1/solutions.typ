#import "../typst/template/reference.typ":*
#import "../typst/template/page/basic.typ":basic,mitex

#let center_title = [SOLUTIONS \ CHAPTER I]
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

= 线性方程组
== 练习题

#example_dc(title: [
  用语言叙述解每个方程组时下一步应做的初等行变换（a中可能有不止一个答案）。
  #box(height: 120pt, columns[
    a.$
        &x_1+4&x_2-2&x_3+8&x_4 &=12 \
        &     &x_2-7&x_3+2&x_4 &=-4 \
        &     & 5   &x_3- &x_4 &=7 \
        &     &     &x_3+3&x_4 &=-5
    $
    b.$
        &x_1-3&x_2+5&x_3-2&x_4&=0 \
        &     &x_2+8&x_3  &   &=-4\
        &     & 2   &x_3  &   &=3 \
        &     &     &     &x_4&=1
    $
  ])
], solutions: [
  a. 
  
  方式一：将第三行和第四行进行对换变换，再通过第三行乘以-5加上第四行得到$x_4$的值，通过$x_4$即可向上运算得到其他$x$值。

  方式二：将第三行乘以$-1/5$与第四行进行倍加变换得到$x_4$的值，再通过$x_4$得到其他值。

  b.

  第三行乘以-4与第二行进行倍加变换得到$x_2$，通过$x_2,x_3,x_4$得到$x_1$。
])

#example_dc(
   title:[
       某线性方程组的增广矩阵已经由行变换化为以下形式，确定方程组是否是相容的。
       $
       mat(
        1,5,2,-6;
        0,4,-7,2;
        0,0,5,0;
       )
       $
   ],
   solutions:[
       相容，将矩阵转换为方程组：
       $
       &x_1+&5x_2+&2x_3 &&=-6 \
       & &4x_2-&7x_3 &&=2 \
       & & &5x_3 &&=0
       $

       得到解为$(-17/2,1/2,0)$，具有唯一解。
   ]
)

#example_dc(
   title:[
       $(3,4,-2)$是否为下列方程组的解：
       $
       5&x_1-&x_2+2&x_3&=7 \
       -2&x_1+6&x_2+9&x_3&=0 \
       -7&x_1+5&x_2-3&x_3&=-7 \
       $
   ],
   solutions:[
      将$(3,4,-2)$代入方程组中：
      $
      5*3-4+2*(-2)&=7 \
      -2*3+6*4+9*(-2)&=0 \
      -7*3+5*4-3*(-2)&=5 \
      $   
      与原式右侧常量不相符，不是该方程解。
   ]
)

#example_dc(
   title:[
       当$h$和$k$取何值时下列方程组相容？
       $
       2&x_1-&x_2&=h \
       -6&x_1+3&x_2&=k
       $
   ],
   solutions:[
       想要方程组相容，那么必须具备至少一个解，将方程组转换为增广矩阵：
       $
       mat(
        2,-1,h;
        -6,3,k;
       )
       $
      化简
      $
      -> mat(
        2,-1,h;
        0,0,3h+k;
        )
      $
      显然，由于方程2的各项系数都为0，那么必须保证$3h+k=0$才能使得方程组有解。

      综上所属，$k=-3h$时，方程组相容。
   ]
)

= 行化简与阶梯形矩阵

== 练习题

#example_dc(
   title:[
       求出下列增广矩阵对应的方程组的通解。
       $
       mat(
        1,-3,-5,0;
        0,1,-1,-1;
       )
       $
   ],
   solutions:[
       $
        ~mat(
          1,0,-8,-3;
          0,1,-1,-1;   
        ) 
       $
      通解为：
      $
      cases(
        x_1=8x_3-3,
        x_2=x_3-1,
        x_3"是自由变量"
      ) 
      $
   ]
)

#example_dc(
   title:[
       求出下列方程组的通解。
       $
        &x_1-&2x_2-&x_3+&3x_4&=0 \
        -2&x_1+&4x_2+&5x_3-&5x_4&=3 \
        3&x_1-&6x_2-&6x_3+&8x_4&=2
       $
   ],
   solutions:[
      转换为增广矩阵为
      $
        mat(
          1,-2,-1,3,0;
          -2,4,5,-5,3;
          3,-6,-6,8,2;
        )\

        ~mat(
          3,-6,-6,8,2;
          -2,4,5,-5,3;
          1,-2,-1,3,0;
        )

        ~mat(
          3,-6,-6,8,2;
          0,0,3/2,1/2,5/2;
          0,0,-3,-1,0;
        ) \

        ~mat(
          3,-6,-6,8,2;
          0,0,-3,-1,0;
          0,0,3/2,1/2,5/2;
        )

        ~mat(
          3,-6,-6,8,2;
          0,0,-3,-1,0;
          0,0,0,0,5;
        ) \

        ~mat(
          3,-6,0,10,2;
          0,0,-3,-1,0;
          0,0,0,0,5;
        )

        ~mat(
          3,-6,0,10,0;
          0,0,-3,-1,0;
          0,0,0,0,5;
        )
      $    

      该方程组是不相容的。注意：其实在得到阶梯形矩形时就应该判断是否相容。
   ]
)

#example_dc(
   title:[
       假设一个方程组的$4*7$系数矩阵有4个主元。这个方程组是相容的吗？如果它是相容的，有多少解？
   ],
   solutions:[
       那么该方程组有4个基本变量，3个自由变量。因为该矩阵为4行，有4个基本变量，则说明该方程组相容。同时存在3个自由变量，所以存在无穷个解。
   ]
)
