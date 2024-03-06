package org.example.clases;

import java.util.ArrayList;
import java.util.List;

public class ListaEstructuraQuerys {
    private List<EstructuraQuery> listaEstructuraQuerys;

    public ListaEstructuraQuerys() {
        this.listaEstructuraQuerys = new ArrayList<>();
    }

    public void addEstructuraQuery(EstructuraQuery estructuraQuery) {
        this.listaEstructuraQuerys.add(estructuraQuery);
    }

    public List<EstructuraQuery> getListaEstructuraQuerys() {
        return this.listaEstructuraQuerys;
    }
}
