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

1.1 Tokens that will be passed to the parser
