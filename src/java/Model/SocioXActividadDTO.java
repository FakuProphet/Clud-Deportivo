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
public class SocioXActividadDTO {
    
    private int codigoSocio;
    private String nombre;
    private String apellido;
    private String dni;
    private String actividadDesc;
    private int actividadId;

    public SocioXActividadDTO() {
    }

    public SocioXActividadDTO(int codigoSocio,String nombre, String apellido, String dni, String actividadDesc, int actividadId) {
        this.codigoSocio = codigoSocio;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.actividadDesc = actividadDesc;
        this.actividadId = actividadId;
    }

    public int getCodigoSocio() {
        return codigoSocio;
    }

    public void setCodigoSocio(int codigoSocio) {
        this.codigoSocio = codigoSocio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getActividadDesc() {
        return actividadDesc;
    }

    public void setActividadDesc(String actividadDesc) {
        this.actividadDesc = actividadDesc;
    }

    public int getActividadId() {
        return actividadId;
    }

    public void setActividadId(int actividadId) {
        this.actividadId = actividadId;
    }
    
    
    
    
    
}
