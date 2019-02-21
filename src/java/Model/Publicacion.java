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
public class Publicacion {
    private int id;
    private String texto;
    private int idActividad;
    private int habilitada;

    

     public Publicacion(String texto, int idActividad) {
         
        this.texto = texto;
        this.idActividad = idActividad;
       
    }

    public Publicacion(int id, String texto, int idActividad, int habilitada) {
        this.id = id;
        this.texto = texto;
        this.idActividad = idActividad;
        this.habilitada = habilitada;
    }
    
    public Publicacion(int id, String texto, int habilitada) {
        this.id = id;
        this.texto = texto;
        this.habilitada = habilitada;
    }
    
   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(int idActividad) {
        this.idActividad = idActividad;
    }

    public int getHabilitada() {
        return habilitada;
    }

    public void setHabilitada(int habilitada) {
        this.habilitada = habilitada;
    }

    @Override
    public String toString() {
        return "Publicacion{" + "id=" + id + ", texto=" + texto + ", idActividad=" + idActividad + ", habilitada=" + habilitada + '}';
    }

   
    
   
    
    
}
