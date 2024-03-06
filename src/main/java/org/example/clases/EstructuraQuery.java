package org.example.clases;

import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class EstructuraQuery {
    private List<String> columnas;
    private List<String> tablas;
    private List<String> condiciones;
    private String path;
    private List<String> valores;
    private List<String> operadores;
    private List<String> operadoresLogicos;
    private int bandera;
}