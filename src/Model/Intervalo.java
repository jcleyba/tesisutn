/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author juanleyba
 */
public class Intervalo {
    private int idIntervalo;
    private int valor;
    private String nombre;

    public int getIdIntervalo() {
        return idIntervalo;
    }

    public void setIdIntervalo(int idIntervalo) {
        this.idIntervalo = idIntervalo;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Intervalo() {
    }

    public Intervalo(int idIntervalo, int valor, String nombre) {
        this.idIntervalo = idIntervalo;
        this.valor = valor;
        this.nombre = nombre;
    }
    
    
}
