package org.example.clases;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Condicional {
    private String columna;
    private String operador;
    private String valor;
    private List<Condicional> condicionales;
    private List<String> columnas;


    public void addCondicional(Condicional condicional){
        this.condicionales.add(condicional);
    }
}
