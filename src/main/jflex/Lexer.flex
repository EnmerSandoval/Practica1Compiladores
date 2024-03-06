package org.example.Lexer;

import java.io.*;
import org.example.Parser.ParserSym;
import java_cup.runtime.*;

%%

%public
%class Lexer
%unicode
%line
%column
%cup

digit = [0-9]+
decimal = ({digit} | ({digit} \. {digit}))+
letter = [a-zA-Z]
guion = \_ | \-
LineTerminator = \r|\n|\r\n
espacioEnBlanco = [ \t\f]+ | {LineTerminator}
Palabra = {letter}({letter} | {digit})+
PalabraGuion = {Palabra}({guion}{Palabra})? | {Palabra}
comillas = "\""

%{
     StringBuffer sb = new StringBuffer();

        private Symbol symbol(int type) {
            return new Symbol(type, yyline, yycolumn);
        }

        private Symbol symbol(int type, Object value) {
            return new Symbol(type, yyline, yycolumn, value);
        }

        private void error(String message) {
            System.out.println("Error en linea "+ yyline +" y en la columna "+ yycolumn + message);
          }
%}

%eofval{
        return new Symbol(ParserSym.EOF);
%eofval}
%%


"SELECCIONAR"           {return symbol(ParserSym.SELECCIONAR, yytext());}
"FILTRAR"               {return symbol(ParserSym.FILTRAR, yytext());}
"INSERTAR"              {return symbol(ParserSym.INSERTAR,  yytext());}
"ACTUALIZAR"            {return symbol(ParserSym.ACTUALIZAR, yytext());}
"ASIGNAR"               {return symbol(ParserSym.ASIGNAR,  yytext());}
"ELIMINAR"              {return symbol(ParserSym.ELIMINAR,  yytext());}
"EN"                    {return symbol(ParserSym.EN,  yytext());}
"VALORES"               {return symbol(ParserSym.VALORES,  yytext());}
"AND"                   {return symbol(ParserSym.AND,  yytext());}
"OR"                    {return symbol(ParserSym.OR,  yytext());}
{decimal}               {return symbol(ParserSym.NUMERO,  yytext());}
{PalabraGuion}          {return symbol(ParserSym.PALABRA,  yytext());}
"*"                     {return symbol(ParserSym.ASTERISCO,  yytext());}
"<="                    {return symbol(ParserSym.MENORIGUALQUE,  yytext());}
">="                    {return symbol(ParserSym.MAYORIGUALQUE,  yytext());}
"<>"                    {return symbol(ParserSym.DIFERENTE,  yytext());}
"="                     {return symbol(ParserSym.IGUAL,  yytext());}
"<"                     {return symbol(ParserSym.MENORQUE,  yytext());}
">"                     {return symbol(ParserSym.MAYORQUE,  yytext());}
","                     {return symbol(ParserSym.COMA,  yytext());}
";"                     {return symbol(ParserSym.PUNTOYCOMA,  yytext());}
":"                     {return symbol(ParserSym.DOSPUNTOS,  yytext());}
"."                     {return symbol(ParserSym.PUNTO,  yytext());}
"("                     {return symbol(ParserSym.PARENTESISA,  yytext());}
")"                     {return symbol(ParserSym.PARENTESISC,  yytext());}
{comillas}              {return symbol(ParserSym.COMILLAS,  yytext());}
{espacioEnBlanco}+ {}

.   {System.err.println("Hubo un error ");}