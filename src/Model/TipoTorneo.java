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
public class TipoTorneo {
    private int idTipoTorneo;
    private String tipoDescripcion;

    public int getIdTipoTorneo() {
        return idTipoTorneo;
    }

    public void setIdTipoTorneo(int idTipoTorneo) {
        this.idTipoTorneo = idTipoTorneo;
    }

    public String getTipoDescripcion() {
        return tipoDescripcion;
    }

    public void setTipoDescripcion(String tipoDescripcion) {
        this.tipoDescripcion = tipoDescripcion;
    }

    public TipoTorneo() {
    }

    public TipoTorneo(int idTipoTorneo, String tipoDescripcion) {
        this.idTipoTorneo = idTipoTorneo;
        this.tipoDescripcion = tipoDescripcion;
    }
    
    
}
