# Lexical Analyzer (Scanner)


This assignment is to write a scanner for the μC language (NOT C language) with lex. This document gives the lexical definition
of the language, while the syntactic definition and code generation will follow in subsequent assignments.

TODO
1. ask TA can I just run the judge.py with specific input and output


## 1. Lexical Definitions
---

Tokens are divided into two classes:
  - tokens that will be passed to the parser, and
  - tokens that will discarded by the scanner (e.g., recognized but not pased to the parser).

**1.1 Tokens that will be passed to the parser**

The following tokens will be recognized by the scanner and will be eventually passed to the parser.

**1.1.1 Delimiters**

![pic1](https://user-images.githubusercontent.com/44123278/114821521-44b10e00-9df3-11eb-82c9-673ac0d82a42.PNG)

**1.1.2 Arithmetic, Relational, and Logical Operators**

![pic2](https://user-images.githubusercontent.com/44123278/114821581-585c7480-9df3-11eb-9bf6-29f2259eb6ad.PNG)

**1.1.3 Keywords**

![pic3](https://user-images.githubusercontent.com/44123278/114821606-64e0cd00-9df3-11eb-859c-c1c792a92c1a.PNG)



