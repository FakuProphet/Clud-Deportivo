/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Lucia
 */
public class SocioXActividad {
    private int idActividad;
    private int idSocio;

    public SocioXActividad(int idActividad, int idSocio) {
        this.idActividad = idActividad;
        this.idSocio = idSocio;
    }

    public SocioXActividad(int idSocio) {
        this.idSocio = idSocio;
    }
    

    public int getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(int idActividad) {
        this.idActividad = idActividad;
    }

    public int getIdSocio() {
        return idSocio;
    }

    public void setIdSocio(int idSocio) {
        this.idSocio = idSocio;
    }

    @Override
    public String toString() {
        return "SocioXActividad{" + "idActividad=" + idActividad + ", idSocio=" + idSocio + '}';
    }
    
    
    
}
