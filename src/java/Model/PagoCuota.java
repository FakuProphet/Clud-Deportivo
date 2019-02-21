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
public class PagoCuota {
    private int id;
    private int mes;
    private int anio;
    private int idSocio;

    public PagoCuota(int id, int mes, int anio, int idSocio) {
        this.id = id;
        this.mes = mes;
        this.anio = anio;
        this.idSocio = idSocio;
    }

    public PagoCuota(int mes, int anio, int idSocio) {
        this.mes = mes;
        this.anio = anio;
        this.idSocio = idSocio;
    }

     public PagoCuota(int mes, int anio) {
        this.mes = mes;
        this.anio = anio;
       
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getIdSocio() {
        return idSocio;
    }

    public void setIdSocio(int idSocio) {
        this.idSocio = idSocio;
    }

    @Override
    public String toString() {
        return "PagoCuota{" + "id=" + id + ", mes=" + mes + ", anio=" + anio + ", idSocio=" + idSocio + '}';
    }
    
    
    
}
