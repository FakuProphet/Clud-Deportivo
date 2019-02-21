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
public class Socio {
    private int id;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String telefono;
    private String mail;
    private int idTipoCuota;

    public Socio(){}
    
    
    public Socio(int id,String nombre){
    this.nombre= nombre;
    this.id= id;
    }
    
    public Socio(String nombre, String apellido, String dni, String direccion, String telefono, String mail, int idTipoCuota) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.telefono = telefono;
        this.mail = mail;
        this.idTipoCuota = idTipoCuota;
    }

    public Socio(int id, String nombre, String apellido, String dni, String direccion, String telefono, String mail, int idTipoCuota) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.telefono = telefono;
        this.mail = mail;
        this.idTipoCuota = idTipoCuota;
    }

    public int getId() {
        return id;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getIdTipoCuota() {
        return idTipoCuota;
    }

    public void setIdTipoCuota(int idTipoCuota) {
        this.idTipoCuota = idTipoCuota;
    }

    @Override
    public String toString() {
        return "Socio{" + "nombre=" + nombre + ", apellido=" + apellido + ", dni=" + dni + ", direccion=" + direccion + ", telefono=" + telefono + ", mail=" + mail + ", idTipoCuota=" + idTipoCuota + '}';
    }
    
    
    
}
