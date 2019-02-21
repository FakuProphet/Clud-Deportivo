/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ModelosReporte;

/**
 *
 * @author Prophet
 */
public class InformeDos {
    private int codSocio;
    private String apellido;
    private String nombre;
    private int mes;
    private int anio;

    public InformeDos(int codSocio, String apellido, String nombre, int mes, int anio) {
        this.codSocio = codSocio;
        this.apellido = apellido;
        this.nombre = nombre;
        this.mes = mes;
        this.anio = anio;
    }

    public int getCodSocio() {
        return codSocio;
    }

    public void setCodSocio(int codSocio) {
        this.codSocio = codSocio;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
    
    
    
    
}
