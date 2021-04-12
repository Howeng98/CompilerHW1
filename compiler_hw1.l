/* Definition section */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    int line_num = 0;
    int comment_num = 0;
%}

/* Define regular expression label */
letter [a-zA-Z_]
digit [0-9]
id {letter}+({letter}|{digit})*
inumber {digit}+
fnumber ({digit}*\.{digit}+)
%x string
cpp_comment "//".*
%x c_comment



/* Rules section */
%%

"+"          { printf("%-8s \t %s\n", yytext, "ADD"); }
"-"          { printf("%-8s \t %s\n", yytext, "SUB"); }
"*"          { printf("%-8s \t %s\n", yytext, "MUL"); }
"/"          { printf("%-8s \t %s\n", yytext, "QUO"); }
"%"          { printf("%-8s \t %s\n", yytext, "REM"); }
"++"         { printf("%-8s \t %s\n", yytext, "INC"); }
"--"         { printf("%-8s \t %s\n", yytext, "DEC"); }
">"          { printf("%-8s \t %s\n", yytext, "GTR"); }
"<"          { printf("%-8s \t %s\n", yytext, "LSS"); }
">="         { printf("%-8s \t %s\n", yytext, "GEQ"); }
"<="         { printf("%-8s \t %s\n", yytext, "LEQ"); }
"=="         { printf("%-8s \t %s\n", yytext, "EQL"); }
"!="         { printf("%-8s \t %s\n", yytext, "NEQ"); }
"="          { printf("%-8s \t %s\n", yytext, "ASSIGN"); }
"+="         { printf("%-8s \t %s\n", yytext, "ADD_ASSIGN"); }
"-="         { printf("%-8s \t %s\n", yytext, "SUB_ASSIGN"); }
"*="         { printf("%-8s \t %s\n", yytext, "MUL_ASSIGN"); }
"/="         { printf("%-8s \t %s\n", yytext, "QUO_ASSIGN"); }
"%="         { printf("%-8s \t %s\n", yytext, "REM_ASSIGN"); }
"&&"         { printf("%-8s \t %s\n", yytext, "AND"); }
"||"         { printf("%-8s \t %s\n", yytext, "OR"); }
"!"          { printf("%-8s \t %s\n", yytext, "NOT"); }
"("          { printf("%-8s \t %s\n", yytext, "LPAREN"); }
")"          { printf("%-8s \t %s\n", yytext, "RPAREN"); }
"["          { printf("%-8s \t %s\n", yytext, "LBRACK"); }
"]"          { printf("%-8s \t %s\n", yytext, "RBRACK"); }
"{"          { printf("%-8s \t %s\n", yytext, "LBRACE"); }
"}"          { printf("%-8s \t %s\n", yytext, "RBRACE"); }
";"          { printf("%-8s \t %s", yytext, "SEMICOLON"); }
","          { printf("%-8s \t %s\n", yytext, "COMMA"); }
"print"         { printf("%-8s \t %s\n", yytext, "PRINT"); }
"return"        { printf("%-8s \t %s\n", yytext, "RETURN"); }
"if"            { printf("%-8s \t %s\n", yytext, "IF"); }
"else"          { printf("%-8s \t %s\n", yytext, "ELSE"); }
"for"           { printf("%-8s \t %s\n", yytext, "FOR"); }
"while"         { printf("%-8s \t %s\n", yytext, "WHILE"); }
"int"           { printf("%-8s \t %s\n", yytext, "INT"); }
"float"         { printf("%-8s \t %s\n", yytext, "FLOAT"); }
"string"        { printf("%-8s \t %s\n", yytext, "STRING"); }
"bool"          { printf("%-8s \t %s\n", yytext, "BOOL"); }
"true"          { printf("%-8s \t %s\n", yytext, "TRUE"); }
"false"         { printf("%-8s \t %s\n", yytext, "FALSE"); }
"continue"      { printf("%-8s \t %s\n", yytext, "CONTINUE"); }
"break"         { printf("%-8s \t %s\n", yytext, "BREAK"); }
"void"          { printf("%-8s \t %s\n", yytext, "VOID"); }
"\""            { printf("%-8s \t %s\n", yytext, "QUOTA"); }}
"\n"            { printf("\n");line_num++;}         

\"				        { BEGIN string;       printf("%-8s \t %s\n", yytext, "QUOTA");}
<string>{letter}*|{digit}*       {                     printf("%-8s \t %s\n", yytext, "STRING_LIT");}
<string>\"		        { BEGIN INITIAL;      printf("%-8s \t %s\n", yytext, "QUOTA");}

"/*"                    { BEGIN c_comment;    printf("%-8s \t %s\n", yytext, "C Comment"); comment_num++; line_num++;}
<c_comment>[^*\n]+      { printf("%-8s \t %s\n", yytext, "C Comment"); comment_num++; line_num++;}
<c_comment>"*"          { printf("%-8s \t %s\n", yytext, "C Comment"); comment_num++; line_num++;}
<c_comment>"*/"         { printf("%-8s \t %s\n", yytext, "C Comment"); comment_num++; line_num++;}



{cpp_comment}	        { printf("%-8s \t %s\n", yytext, "C++ Comment"); comment_num++; line_num++;}


{inumber}        { printf("%-8s \t %s\n", yytext, "INT_LIT"); }
{fnumber}        { printf("%-8s \t %s\n", yytext, "FLOAT_LIT"); }
{id}             { printf("%-8s \t %s\n", yytext, "IDENT"); }
<<EOF>>     { line_num++; yyterminate(); }
.           {;}

%%

/*  C Code section */
int yywrap(void)
{
    return 1;
}

int main(int argc, char *argv[])
{
    if (argc == 2) {
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yylex();
    printf("\n\nFinish scanning,\n");
    printf("total line: %d\n", line_num);
    printf("comment line: %d\n", comment_num);
    fclose(yyin);
    return 0;
}
