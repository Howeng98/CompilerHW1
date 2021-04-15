# Lexical Analyzer (Scanner)


This assignment is to write a scanner for the μC language (NOT C language) with lex. This document gives the lexical definition
of the language, while the syntactic definition and code generation will follow in subsequent assignments.

TODO
1. ask TA can I just run the judge.py with specific input and output


## 1. Lexical Definitions


Tokens are divided into two classes:
  - tokens that will be passed to the parser, and
  - tokens that will discarded by the scanner (e.g., recognized but not pased to the parser).

### **1.1 Tokens that will be passed to the parser**

The following tokens will be recognized by the scanner and will be eventually passed to the parser.

### **1.1.1 Delimiters**

![pic1](https://user-images.githubusercontent.com/44123278/114821521-44b10e00-9df3-11eb-82c9-673ac0d82a42.PNG)

### **1.1.2 Arithmetic, Relational, and Logical Operators**

![pic2](https://user-images.githubusercontent.com/44123278/114821581-585c7480-9df3-11eb-9bf6-29f2259eb6ad.PNG)

### **1.1.3 Keywords**

![pic3](https://user-images.githubusercontent.com/44123278/114821606-64e0cd00-9df3-11eb-859c-c1c792a92c1a.PNG)

### **1.1.4 Identifiers**

An identifier is a string of letters (``a ~ z`` , ``A ~ Z`` , ``_`` ) and digits ( ``0 ~ 9`` ) and it begins with a letter or underscore. Identifiers are
case-sensitive; for example, ``ident`` , ``Ident`` , and ``IDENT`` are not the same identifier. Note that keywords are not identifiers.

### **1.1.5 Integer Literals and Floating-Point Literals**

Integer literals: a sequence of one or more digits, such as ``1`` , ``23`` , and ``666`` .
Floating-point literals: numbers that contain floating decimal points, such as ``0.2`` and ``3.141`` .

### **1.1.6 String Literals**

A string literal is a sequence of zero or more ASCII characters appearing between double-quote ( ``"`` ) delimiters. A double-quote
appearing with a string must be written after a ``"`` , e.g., ``"abc"`` , ``"Hello world"`` , and ``"She is a \"girl\""`` .

### **1.2 Tokens that will be discarded**

The following tokens will be recognized by the scanner, but should be discarded, rather than returning to the parser.
 
### **1.2.1 Whitespace**

A sequence of blanks(spaces), tabs, and newlines.

### **1.2.2 Comments**

Comments can be added in several ways:
  - C-style is texts surrounded by ``/*`` and ``*/`` delimiters, which may span more than one line
  - C++ style comments are a text following a ``//`` delimiter running up to the end of the line.

Whichever comment style is encountered first remains in effect until the appropriate comment close is encountered. For
example,

``// this is a comment // line */ /* with /* delimiters */ before the end``
and
``/* this is a comment // line with some and C delimiters */``
are both valid comments.

### **1.2.3 Other characters**

The undefined characters or strings should be discarded by your scanner during parsing.


## 2. What should we do in this Scanner

### 2.1 Assignment Requirements

Here we have prepared 11 μC programs, which are used to test the functionalities of your scanner.

``` Python
python3 judge/judege.py input/in01_arithmetic.c output/in01.out
```

![pic4](https://user-images.githubusercontent.com/44123278/114822684-04eb2600-9df5-11eb-9dc7-976f9a08c559.PNG)

### 2.2 Output

![pic5](https://user-images.githubusercontent.com/44123278/114822889-509dcf80-9df5-11eb-87d4-e0884af73c1a.PNG)

![pic6](https://user-images.githubusercontent.com/44123278/114822899-54c9ed00-9df5-11eb-943a-9cfc31fd019d.PNG)

![pic7](https://user-images.githubusercontent.com/44123278/114822905-5693b080-9df5-11eb-87ce-becc95cd2873.PNG)

### 2.3 Debug

Make Makefile
```
$ make clean && make
```

Execute
```
$ ./myscanner < input/in01_arithmetic.c > output/in01.out
```

Check diff
```
$ diff -y tmp.out answer/in01_arithmetic.out
$ od -c answer/in05_comment.out
```
