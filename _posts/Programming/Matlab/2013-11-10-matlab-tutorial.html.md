---
layout: post
title: Matlab tutorial
date: 2013-11-10 00:56:11.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Matlab]
tags: []
meta:
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>&gt;&gt; 5+4</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     9</p>
<p>
 </p>
<p>&gt;&gt; 3-2</p>
<p>
 </p>
<p>ans =</p>
<p>s</p>
<p>     1</p>
<p>
 </p>
<p>&gt;&gt; 5*8</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    40</p>
<p>
 </p>
<p>&gt;&gt; 2^6</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    64</p>
<p>
 </p>
<p>&gt;&gt; 1/2</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    0.5000</p>
<p>
 </p>
<p>&gt;&gt; 1 == 2</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     0</p>
<p>
 </p>
<p>&gt;&gt; 1 ~= 2</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1</p>
<p>
 </p>
<p>&gt;&gt; 1 &amp;&amp; 0</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     0</p>
<p>
 </p>
<p>&gt;&gt; 1 || 0</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1</p>
<p>
 </p>
<p>&gt;&gt; xor(1,0)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1</p>
<p>
 </p>
<p>&gt;&gt; PS('&gt;&gt;&gt; ');</p>
<p>Undefined function 'PS' for input arguments of type 'char'.</p>
<p>
 </p>
<p>&gt;&gt; PS('&gt;&gt;&gt; ');</p>
<p>Undefined function 'PS' for input arguments of type 'char'.</p>
<p>
 </p>
<p>&gt;&gt; PS1('&gt;&gt;&gt; ');</p>
<p>Undefined function 'PS1' for input arguments of type 'char'.</p>
<p>
 </p>
<p>&gt;&gt; a = 3</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; a = 3;</p>
<p>&gt;&gt; a</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; b = 'hi';</p>
<p>&gt;&gt; c = (3&gt;=1);</p>
<p>&gt;&gt; a=pi;</p>
<p>&gt;&gt; a</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>    3.1416</p>
<p>
 </p>
<p>&gt;&gt; disp(a)</p>
<p>    3.1416</p>
<p>
 </p>
<p>&gt;&gt; disp(sprintf(' 2 ddddd : %0.2f', a))</p>
<p> 2 ddddd : 3.14</p>
<p>&gt;&gt; disp(sprintf(' 2 ddddd : %0.6f', a))</p>
<p> 2 ddddd : 3.141593</p>
<p>&gt;&gt; format log</p>
<p>Error using format</p>
<p>Unknown command option.</p>
<p>
 </p>
<p>&gt;&gt; format long</p>
<p>&gt;&gt; a</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>   3.141592653589793</p>
<p>
 </p>
<p>&gt;&gt; format short</p>
<p>&gt;&gt; a</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>    3.1416</p>
<p>
 </p>
<p>&gt;&gt; A = [1 2; 3 4; 5 6]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; A = [1 2;</p>
<p>3 4;</p>
<p>5 6;</p>
<p>]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; V = [1 2 3]</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>     1     2     3</p>
<p>
 </p>
<p>&gt;&gt; V = [1; 2; 3]</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>     1</p>
<p>     2</p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; V = 1:0.1:2</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>    1.0000    1.1000    1.2000    1.3000    1.4000    1.5000    1.6000    1.7000    1.8000    1.9000    2.0000</p>
<p>
 </p>
<p>&gt;&gt; V = 1:6</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>     1     2     3     4     5     6</p>
<p>
 </p>
<p>&gt;&gt; ones(2,3)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     1     1</p>
<p>     1     1     1</p>
<p>
 </p>
<p>&gt;&gt; C = 2 * ones(2,3)</p>
<p>
 </p>
<p>C =</p>
<p>
 </p>
<p>     2     2     2</p>
<p>     2     2     2</p>
<p>
 </p>
<p>&gt;&gt; W = ONES(1,3)</p>
<p>Undefined function 'ONES' for input arguments of type 'double'.</p>
<p>
 </p>
<p>Did you mean:</p>
<p>&gt;&gt; w = zeros(1,3)</p>
<p>
 </p>
<p>w =</p>
<p>
 </p>
<p>     0     0     0</p>
<p>
 </p>
<p>&gt;&gt; w = rand(1,3)</p>
<p>
 </p>
<p>w =</p>
<p>
 </p>
<p>    0.8147    0.9058    0.1270</p>
<p>
 </p>
<p>&gt;&gt; w = rand(3,3)</p>
<p>
 </p>
<p>w =</p>
<p>
 </p>
<p>    0.9134    0.2785    0.9649</p>
<p>    0.6324    0.5469    0.1576</p>
<p>    0.0975    0.9575    0.9706</p>
<p>
 </p>
<p>&gt;&gt; w = rand(3,3)</p>
<p>
 </p>
<p>w =</p>
<p>
 </p>
<p>    0.9572    0.1419    0.7922</p>
<p>    0.4854    0.4218    0.9595</p>
<p>    0.8003    0.9157    0.6557</p>
<p>
 </p>
<p>&gt;&gt; w = randn(1,3)</p>
<p>
 </p>
<p>w =</p>
<p>
 </p>
<p>   -1.2075    0.7172    1.6302</p>
<p>
 </p>
<p>&gt;&gt; w = -6 + sqrt(10)*randn(1,10000)</p>
<p>
 </p>
<p>&gt;&gt; hist(w)</p>
<p>&gt;&gt;</p>
<p>
 </p>
<p>&gt;&gt; hist(w,50)</p>
<p>&gt;&gt; eye(3,3)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     0     0</p>
<p>     0     1     0</p>
<p>     0     0     1</p>
<p>
 </p>
<p>&gt;&gt; eye(5)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     0     0     0     0</p>
<p>     0     1     0     0     0</p>
<p>     0     0     1     0     0</p>
<p>     0     0     0     1     0</p>
<p>     0     0     0     0     1</p>
<p>
 </p>
<p>&gt;&gt; I = eye(6)</p>
<p>
 </p>
<p>I =</p>
<p>
 </p>
<p>     1     0     0     0     0     0</p>
<p>     0     1     0     0     0     0</p>
<p>     0     0     1     0     0     0</p>
<p>     0     0     0     1     0     0</p>
<p>     0     0     0     0     1     0</p>
<p>     0     0     0     0     0     1</p>
<p>
 </p>
<p>&gt;&gt; help</p>
<p>
 </p>
<p>&gt;&gt; size(A)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     3     2</p>
<p>
 </p>
<p>&gt;&gt; size(A,1)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; size(A,2)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     2</p>
<p>
 </p>
<p>&gt;&gt; sz = size(A)</p>
<p>
 </p>
<p>sz =</p>
<p>
 </p>
<p>     3     2</p>
<p>
 </p>
<p>&gt;&gt; size(sz)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     2</p>
<p>
 </p>
<p>&gt;&gt; v = [1 2 3 4]</p>
<p>
 </p>
<p>v =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>
 </p>
<p>&gt;&gt; length(v)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     4</p>
<p>
 </p>
<p>&gt;&gt; length(A)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; pwd</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>&gt;&gt; cd 'C:\Users\Yilong'</p>
<p>&gt;&gt; cd Desktop</p>
<p>&gt;&gt;</p>
<p>&gt;&gt; load X.txt</p>
<p>&gt;&gt; load Y.txt</p>
<p>&gt;&gt; who</p>
<p>
 </p>
<p>Your variables are:</p>
<p>
 </p>
<p>A    C    I    V    X    Y    a    ans  b    c    sz   v    w</p>
<p>
 </p>
<p>&gt;&gt; X</p>
<p>
 </p>
<p>X =</p>
<p>
 </p>
<p>     1   100</p>
<p>     2   300</p>
<p>
 </p>
<p>&gt;&gt; Y</p>
<p>
 </p>
<p>Y =</p>
<p>
 </p>
<p>     1</p>
<p>     0</p>
<p>
 </p>
<p>&gt;&gt; whos</p>
<p>  Name      Size               Bytes  Class      Attributes</p>
<p>
 </p>
<p>  A         3x2                   48  double</p>
<p>  C         2x3                   48  double</p>
<p>  I         6x6                  288  double</p>
<p>  V         1x6                   48  double</p>
<p>  X         2x2                   32  double</p>
<p>  Y         2x1                   16  double</p>
<p>  a         1x1                    8  double</p>
<p>  ans       1x19                  38  char</p>
<p>  b         1x2                    4  char</p>
<p>  c         1x1                    1  logical</p>
<p>  sz        1x2                   16  double</p>
<p>  v         1x4                   32  double</p>
<p>  w         1x10000            80000  double</p>
<p>
 </p>
<p>&gt;&gt; clear A</p>
<p>&gt;&gt; V = X(1:2)</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>     1     2</p>
<p>
 </p>
<p>&gt;&gt; V = X(1:1)</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>     1</p>
<p>
 </p>
<p>&gt;&gt; save hello.mat v;</p>
<p>&gt;&gt; clear v;</p>
<p>&gt;&gt; load hello.mat</p>
<p>&gt;&gt; whos</p>
<p>  Name      Size               Bytes  Class      Attributes</p>
<p>
 </p>
<p>  C         2x3                   48  double</p>
<p>  I         6x6                  288  double</p>
<p>  V         1x1                    8  double</p>
<p>  X         2x2                   32  double</p>
<p>  Y         2x1                   16  double</p>
<p>  a         1x1                    8  double</p>
<p>  ans       1x19                  38  char</p>
<p>  b         1x2                    4  char</p>
<p>  c         1x1                    1  logical</p>
<p>  sz        1x2                   16  double</p>
<p>  v         1x4                   32  double</p>
<p>  w         1x10000            80000  double</p>
<p>
 </p>
<p>&gt;&gt; save hello.txt v;</p>
<p>&gt;&gt; save hello.txt v -ascii</p>
<p>&gt;&gt; A</p>
<p>Undefined function or variable 'A'.</p>
<p>
 </p>
<p>Did you mean:</p>
<p>&gt;&gt; A = [1 2; 3 4; 5 6;]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; A(3,2)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     6</p>
<p>
 </p>
<p>&gt;&gt; A(3,:)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; A(:,2)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     2</p>
<p>     4</p>
<p>     6</p>
<p>
 </p>
<p>&gt;&gt; A([1 3], ;)</p>
<p> A([1 3], ;)</p>
<p>          |</p>
<p>Error: Unbalanced or unexpected parenthesis or bracket.</p>
<p>
 </p>
<p>&gt;&gt; A([1 3], :)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     2</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; A(:,2) = [10 ; 11; 12]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1    10</p>
<p>     3    11</p>
<p>     5    12</p>
<p>
 </p>
<p>&gt;&gt; A = [A, [100 ;101 ;102]]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1    10   100</p>
<p>     3    11   101</p>
<p>     5    12   102</p>
<p>
 </p>
<p>&gt;&gt; A = [A [100 ;101 ;102]]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1    10   100   100</p>
<p>     3    11   101   101</p>
<p>     5    12   102   102</p>
<p>
 </p>
<p>&gt;&gt; A = [A ; [100 101 102 111]]</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1    10   100   100</p>
<p>     3    11   101   101</p>
<p>     5    12   102   102</p>
<p>   100   101   102   111</p>
<p>
 </p>
<p>&gt;&gt; A(:)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1</p>
<p>     3</p>
<p>     5</p>
<p>   100</p>
<p>    10</p>
<p>    11</p>
<p>    12</p>
<p>   101</p>
<p>   100</p>
<p>   101</p>
<p>   102</p>
<p>   102</p>
<p>   100</p>
<p>   101</p>
<p>   102</p>
<p>   111</p>
<p>
 </p>
<p>&gt;&gt; A =  [1 2; 3 4 ; 5 6];</p>
<p>&gt;&gt; B=[3 4; 5 6; 7 8];</p>
<p>&gt;&gt; C = [A B]</p>
<p>
 </p>
<p>C =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>     3     4     5     6</p>
<p>     5     6     7     8</p>
<p>
 </p>
<p>&gt;&gt; C = [A ; B]</p>
<p>
 </p>
<p>C =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>     3     4</p>
<p>     5     6</p>
<p>     7     8</p>
<p>
 </p>
<p>&gt;&gt; &gt;&gt; [A B]</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>     3     4     5     6</p>
<p>     5     6     7     8</p>
<p>
 </p>
<p>&gt;&gt; [A, B]</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>     3     4     5     6</p>
<p>     5     6     7     8</p>
<p>
 </p>
<p>&gt;&gt; A</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; b</p>
<p>
 </p>
<p>b =</p>
<p>
 </p>
<p>hi</p>
<p>
 </p>
<p>&gt;&gt; B</p>
<p>
 </p>
<p>B =</p>
<p>
 </p>
<p>     3     4</p>
<p>     5     6</p>
<p>     7     8</p>
<p>
 </p>
<p>&gt;&gt; C</p>
<p>
 </p>
<p>C =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>     3     4</p>
<p>     5     6</p>
<p>     7     8</p>
<p>
 </p>
<p>&gt;&gt; C = [1 1 ; 2 2]</p>
<p>
 </p>
<p>C =</p>
<p>
 </p>
<p>     1     1</p>
<p>     2     2</p>
<p>
 </p>
<p>&gt;&gt; A*C</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     5     5</p>
<p>    11    11</p>
<p>    17    17</p>
<p>
 </p>
<p>&gt;&gt; A.*C</p>
<p>Error using  .*</p>
<p>Matrix dimensions must agree.</p>
<p>
 </p>
<p>&gt;&gt; A.*B</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     3     8</p>
<p>    15    24</p>
<p>    35    48</p>
<p>
 </p>
<p>&gt;&gt; A .^ 2</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     4</p>
<p>     9    16</p>
<p>    25    36</p>
<p>
 </p>
<p>&gt;&gt; V = [1;2;3]</p>
<p>
 </p>
<p>V =</p>
<p>
 </p>
<p>     1</p>
<p>     2</p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; 1 ./ V</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    1.0000</p>
<p>    0.5000</p>
<p>    0.3333</p>
<p>
 </p>
<p>&gt;&gt; 1 ./ A</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    1.0000    0.5000</p>
<p>    0.3333    0.2500</p>
<p>    0.2000    0.1667</p>
<p>
 </p>
<p>&gt;&gt; log(v)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>         0    0.6931    1.0986    1.3863</p>
<p>
 </p>
<p>&gt;&gt; exp(v)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    2.7183    7.3891   20.0855   54.5982</p>
<p>
 </p>
<p>&gt;&gt; v</p>
<p>
 </p>
<p>v =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>
 </p>
<p>&gt;&gt; abs(v)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>
 </p>
<p>&gt;&gt; abs([-1; -2;3]</p>
<p> abs([-1; -2;3]</p>
<p>               |</p>
<p>Error: Expression or statement is incorrect--possibly unbalanced (, {, or [.</p>
<p>
 </p>
<p>&gt;&gt; abs([-1; -2; 3];</p>
<p> abs([-1; -2; 3];</p>
<p>                |</p>
<p>Error: Unbalanced or unexpected parenthesis or bracket.</p>
<p>
 </p>
<p>&gt;&gt; abs([-1; -2; 3])</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1</p>
<p>     2</p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; -v</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    -1    -2    -3    -4</p>
<p>
 </p>
<p>&gt;&gt; v .+ 1</p>
<p>Error: "v" was previously used as a variable, conflicting with its use here as the name of a function or command.</p>
<p>See "How MATLAB Recognizes Command Syntax" in the MATLAB documentation for details.</p>
<p>
 </p>
<p>&gt;&gt; v + ones(length(v), 1)</p>
<p>Error using  +</p>
<p>Matrix dimensions must agree.</p>
<p>
 </p>
<p>&gt;&gt; length(v)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     4</p>
<p>
 </p>
<p>&gt;&gt; v + ones(4, 1)</p>
<p>Error using  +</p>
<p>Matrix dimensions must agree.</p>
<p>
 </p>
<p>&gt;&gt; v + ones(1, 5)</p>
<p>Error using  +</p>
<p>Matrix dimensions must agree.</p>
<p>
 </p>
<p>&gt;&gt; v</p>
<p>
 </p>
<p>v =</p>
<p>
 </p>
<p>     1     2     3     4</p>
<p>
 </p>
<p>&gt;&gt; v + ones(1, 4)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     2     3     4     5</p>
<p>
 </p>
<p>&gt;&gt; v + ones(1, 4)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     2     3     4     5</p>
<p>
 </p>
<p>&gt;&gt; v + ones(length(v), 4)</p>
<p>Error using  +</p>
<p>Matrix dimensions must agree.</p>
<p>
 </p>
<p>&gt;&gt; v + ones(lengths(v), 4)</p>
<p>Undefined function 'lengths' for input arguments of type 'double'.</p>
<p>
 </p>
<p>Did you mean:</p>
<p>&gt;&gt; v + ones(length(v), 4)</p>
<p>Error using  +</p>
<p>Matrix dimensions must agree.</p>
<p>
 </p>
<p>&gt;&gt; length(v)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     4</p>
<p>
 </p>
<p>&gt;&gt; v + ones(1, length(v))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     2     3     4     5</p>
<p>
 </p>
<p>&gt;&gt; A'</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     3     5</p>
<p>     2     4     6</p>
<p>
 </p>
<p>&gt;&gt; a</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>    3.1416</p>
<p>
 </p>
<p>&gt;&gt; A</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; A''</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     2</p>
<p>     3     4</p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; a = [1 15 2 0.5]</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>    1.0000   15.0000    2.0000    0.5000</p>
<p>
 </p>
<p>&gt;&gt; val = max(a)</p>
<p>
 </p>
<p>val =</p>
<p>
 </p>
<p>    15</p>
<p>
 </p>
<p>&gt;&gt; [val, ind] max(a)</p>
<p> [val, ind] max(a)</p>
<p>            |</p>
<p>Error: Unexpected MATLAB expression.</p>
<p>
 </p>
<p>&gt;&gt; [val, ind] = max(a)</p>
<p>
 </p>
<p>val =</p>
<p>
 </p>
<p>    15</p>
<p>
 </p>
<p>
 </p>
<p>ind =</p>
<p>
 </p>
<p>     2</p>
<p>
 </p>
<p>&gt;&gt; max(A)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     5     6</p>
<p>
 </p>
<p>&gt;&gt; a &lt; 3</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     0     1     1</p>
<p>
 </p>
<p>&gt;&gt; find(a &lt; 3)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     3     4</p>
<p>
 </p>
<p>&gt;&gt; A = magic(3)</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     8     1     6</p>
<p>     3     5     7</p>
<p>     4     9     2</p>
<p>
 </p>
<p>&gt;&gt; find(A &lt; 3)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     4</p>
<p>     9</p>
<p>
 </p>
<p>&gt;&gt; sum(a)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>   18.5000</p>
<p>
 </p>
<p>&gt;&gt; prod(a)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    15</p>
<p>
 </p>
<p>&gt;&gt; floor(a)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1    15     2     0</p>
<p>
 </p>
<p>&gt;&gt; a</p>
<p>
 </p>
<p>a =</p>
<p>
 </p>
<p>    1.0000   15.0000    2.0000    0.5000</p>
<p>
 </p>
<p>&gt;&gt; ceil(a)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1    15     2     1</p>
<p>
 </p>
<p>&gt;&gt; rand(3)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    0.3051    0.2553    0.5389</p>
<p>    0.6498    0.3582    0.5901</p>
<p>    0.2888    0.8059    0.2311</p>
<p>
 </p>
<p>&gt;&gt; max(rand(3), rand(3))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    0.9085    0.6990    0.8383</p>
<p>    0.6446    0.1879    0.8559</p>
<p>    0.9801    0.5094    0.6144</p>
<p>
 </p>
<p>&gt;&gt; A</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     8     1     6</p>
<p>     3     5     7</p>
<p>     4     9     2</p>
<p>
 </p>
<p>&gt;&gt; max(A, [], 1)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     8     9     7</p>
<p>
 </p>
<p>&gt;&gt; max(A, [], 2)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     8</p>
<p>     7</p>
<p>     9</p>
<p>
 </p>
<p>&gt;&gt; max(A)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     8     9     7</p>
<p>
 </p>
<p>&gt;&gt; max(max(A))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     9</p>
<p>
 </p>
<p>&gt;&gt; max(A(:))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     9</p>
<p>
 </p>
<p>&gt;&gt; A = magic(9)</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>    47    58    69    80     1    12    23    34    45</p>
<p>    57    68    79     9    11    22    33    44    46</p>
<p>    67    78     8    10    21    32    43    54    56</p>
<p>    77     7    18    20    31    42    53    55    66</p>
<p>     6    17    19    30    41    52    63    65    76</p>
<p>    16    27    29    40    51    62    64    75     5</p>
<p>    26    28    39    50    61    72    74     4    15</p>
<p>    36    38    49    60    71    73     3    14    25</p>
<p>    37    48    59    70    81     2    13    24    35</p>
<p>
 </p>
<p>&gt;&gt; sum(A, 1)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>   369   369   369   369   369   369   369   369   369</p>
<p>
 </p>
<p>&gt;&gt; sum(A, 2)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>   369</p>
<p>
 </p>
<p>&gt;&gt; eye(9)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     1     0     0     0     0     0     0     0     0</p>
<p>     0     1     0     0     0     0     0     0     0</p>
<p>     0     0     1     0     0     0     0     0     0</p>
<p>     0     0     0     1     0     0     0     0     0</p>
<p>     0     0     0     0     1     0     0     0     0</p>
<p>     0     0     0     0     0     1     0     0     0</p>
<p>     0     0     0     0     0     0     1     0     0</p>
<p>     0     0     0     0     0     0     0     1     0</p>
<p>     0     0     0     0     0     0     0     0     1</p>
<p>
 </p>
<p>&gt;&gt; A .* eye(9)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    47     0     0     0     0     0     0     0     0</p>
<p>     0    68     0     0     0     0     0     0     0</p>
<p>     0     0     8     0     0     0     0     0     0</p>
<p>     0     0     0    20     0     0     0     0     0</p>
<p>     0     0     0     0    41     0     0     0     0</p>
<p>     0     0     0     0     0    62     0     0     0</p>
<p>     0     0     0     0     0     0    74     0     0</p>
<p>     0     0     0     0     0     0     0    14     0</p>
<p>     0     0     0     0     0     0     0     0    35</p>
<p>
 </p>
<p>&gt;&gt; sum(sum(A .* eye(9)))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>   369</p>
<p>
 </p>
<p>&gt;&gt; sum(sum(A .* eye(9)'))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>   369</p>
<p>
 </p>
<p>&gt;&gt; flipup(eye(9))</p>
<p>Undefined function 'flipup' for input arguments of type 'double'.</p>
<p>
 </p>
<p>&gt;&gt; flipud(eye(9))</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>     0     0     0     0     0     0     0     0     1</p>
<p>     0     0     0     0     0     0     0     1     0</p>
<p>     0     0     0     0     0     0     1     0     0</p>
<p>     0     0     0     0     0     1     0     0     0</p>
<p>     0     0     0     0     1     0     0     0     0</p>
<p>     0     0     0     1     0     0     0     0     0</p>
<p>     0     0     1     0     0     0     0     0     0</p>
<p>     0     1     0     0     0     0     0     0     0</p>
<p>     1     0     0     0     0     0     0     0     0</p>
<p>
 </p>
<p>&gt;&gt; A = magic(3)</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>     8     1     6</p>
<p>     3     5     7</p>
<p>     4     9     2</p>
<p>
 </p>
<p>&gt;&gt; pinv(A)</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    0.1472   -0.1444    0.0639</p>
<p>   -0.0611    0.0222    0.1056</p>
<p>   -0.0194    0.1889   -0.1028</p>
<p>
 </p>
<p>&gt;&gt; temp = pinv(A)</p>
<p>
 </p>
<p>temp =</p>
<p>
 </p>
<p>    0.1472   -0.1444    0.0639</p>
<p>   -0.0611    0.0222    0.1056</p>
<p>   -0.0194    0.1889   -0.1028</p>
<p>
 </p>
<p>&gt;&gt; temp * A</p>
<p>
 </p>
<p>ans =</p>
<p>
 </p>
<p>    1.0000    0.0000   -0.0000</p>
<p>   -0.0000    1.0000    0.0000</p>
<p>    0.0000    0.0000    1.0000</p>
<p>
 </p>
<p>&gt;&gt; t=[0:0.01:0.98];</p>
<p>&gt;&gt; y1=sin(2*pi*4*t);</p>
<p>&gt;&gt; plot(t,y1);</p>
<p>&gt;&gt; y2=cos(2*pi*4*t);</p>
<p>&gt;&gt; plot(t,y2);</p>
<p>&gt;&gt; plot(t,y1);</p>
<p>&gt;&gt; hold on;</p>
<p>&gt;&gt; plot(t,y2, 'r');</p>
<p>&gt;&gt; xlabel('time');</p>
<p>&gt;&gt; ylabel('value');</p>
<p>&gt;&gt; legend('sin', 'cos')</p>
<p>&gt;&gt; title('my plot')</p>
<p>&gt;&gt; print -dpng 'myPlot.png'</p>
<p>&gt;&gt; print -dpng 'myPlot.jpg'</p>
<p>Error using validateHandleToPrint (line 26)</p>
<p>No Figure to print.</p>
<p>
 </p>
<p>Error in validate (line 17)</p>
<p>pj = validateHandleToPrint(pj);</p>
<p>
 </p>
<p>Error in print (line 204)</p>
<p>    pj = validate( pj );</p>
<p>
 </p>
<p>&gt;&gt; close</p>
<p>&gt;&gt; figure(1); plot(t,y1);</p>
<p><img src="{{ site.baseurl }}/assets/110913_1656_matlabtutor1.png" alt="" />
	</p>
<p>&gt;&gt; figure(2); plot(t,y2);</p>
<p>&gt;&gt; subplot(1,2,1);</p>
<p><img src="{{ site.baseurl }}/assets/110913_1656_matlabtutor2.png" alt="" />
	</p>
<p>&gt;&gt; plot(t,y1);</p>
<p>&gt;&gt; subplot(1,2,2);</p>
<p>&gt;&gt; plot(t,y2);</p>
<p>&gt;&gt; axis([0.5 1 -1 1])</p>
<p>&gt;&gt; clf;</p>
<p>&gt;&gt; A = magic(5);</p>
<p>&gt;&gt; A</p>
<p>
 </p>
<p>A =</p>
<p>
 </p>
<p>    17    24     1     8    15</p>
<p>    23     5     7    14    16</p>
<p>     4     6    13    20    22</p>
<p>    10    12    19    21     3</p>
<p>    11    18    25     2     9</p>
<p>
 </p>
<p>&gt;&gt; imagesc(A)</p>
<p>&gt;&gt; imagesc(A), colorbar, colormap gray;</p>
<p>&gt;&gt; imagesc(magic(15)), colorbar, colormap gray;</p>
<p><img src="{{ site.baseurl }}/assets/110913_1656_matlabtutor3.png" alt="" />
	</p>
<p>v=zeros(10,1)</p>
<p>for i=1:10,</p>
<p>v(i) = 2^i;</p>
<p>end;</p>
<p>v</p>
<p>indices = 1:10;</p>
<p>indices</p>
<p>for i=indices,</p>
<p>disp(i);</p>
<p>end;</p>
<p>i = 1;</p>
<p>while  i&lt;5,</p>
<p>v(i) = 100;</p>
<p>i= i+1;</p>
<p>end;</p>
<p>v</p>
<p>while true,</p>
<p>v(i) = 999;</p>
<p>i= i + 1;</p>
<p>if i ==6,</p>
<p>break;</p>
<p>end;</p>
<p>v</p>
<p>i = 1;</p>
<p>v(1)</p>
<p>v(1) = 2;</p>
<p>if v(1) == 1,</p>
<p>disp('hh');</p>
<p>elseif v(1) == 2,</p>
<p>diso('222');</p>
<p>else</p>
<p>disp('no');</p>
<p>end;</p>
<p>if v(1) == 1,</p>
<p>disp('hh');</p>
<p>elseif v(1) == 2,</p>
<p>disp('222');</p>
<p>else</p>
<p>disp('no');</p>
<p>end;</p>
<p>
 </p>
<p><span style="color:black;font-family:Courier New;font-size:10pt;">squareThisNumber.m</span>
	</p>
<p><span style="color:blue;font-family:Courier New;"><span style="font-size:10pt;">function<span style="color:black;"> y = squareThisNumber( x )</span></span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:forestgreen;font-size:10pt;">%SQUARETHISNUMBER Summary of this function goes here</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:forestgreen;font-size:10pt;">%   Detailed explanation goes here</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">y = x ^ 2;</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p>
 </p>
<p><span style="font-family:Courier New;"><span style="color:blue;font-size:10pt;">end</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p>
 </p>
<p><span style="color:blue;font-family:Courier New;"><span style="font-size:10pt;">function<span style="color:black;"> [y1, y2] = squareThisNumber( x )</span></span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:forestgreen;font-size:10pt;">%SQUARETHISNUMBER Summary of this function goes here</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:forestgreen;font-size:10pt;">%   Detailed explanation goes here</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">y1 = x ^ 2;</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">y2 = x ^ 3;</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:blue;font-size:10pt;">end</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p>
 </p>
<p>
 </p>
<p>
 </p>
<p>[a, b] = squareThisNumber(3)</p>
<p>
 </p>
<p><span style="color:blue;font-family:Courier New;"><span style="font-size:10pt;">function<span style="color:black;"> J = costFunctionJ( X, y, theta )</span></span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:forestgreen;font-size:10pt;">%COSTFUNCTIONJ Summary of this function goes here</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:forestgreen;font-size:10pt;">%   Detailed explanation goes here</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">    m = size(X, 1);</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">    predications = X*theta;</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p>
 </p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">    sqrError = (predications-y).^2;</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:black;font-size:10pt;">    J = 1 / (2*m) * sum(sqrError);</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p><span style="font-family:Courier New;"><span style="color:blue;font-size:10pt;">end</span><span style="font-size:12pt;"><br />
			</span></span></p>
<p>
 </p>
<p>
 </p>
<p>&gt;&gt; X = [1 1; 1 2; 1 3]</p>
<p>
 </p>
<p>X =</p>
<p>
 </p>
<p>     1     1</p>
<p>     1     2</p>
<p>     1     3</p>
<p>
 </p>
<p>&gt;&gt; Y = [1; 2; 3]</p>
<p>
 </p>
<p>Y =</p>
<p>
 </p>
<p>     1</p>
<p>     2</p>
<p>     3</p>
<p>
 </p>
<p>&gt;&gt; theta = [0;0];</p>
<p>&gt;&gt; J = costFunctionJ(X, Y, theta)</p>
<p>
 </p>
<p>J =</p>
<p>
 </p>
<p>2.3333</p>
<p>
 </p>
