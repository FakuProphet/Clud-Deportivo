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
public class PublicacionDTO {
    
    private String texto;
    private String Descipcion;
    private int idHabilitada;
    private int idPublicacion;
    private String habilitada;

    public PublicacionDTO(String texto, String Descipcion, int idHabilitada, int IdPublicacion) {
        this.texto = texto;
        this.Descipcion = Descipcion;
        this.idHabilitada = idHabilitada;
        this.idPublicacion= IdPublicacion;
    }

    
    
    public int getIdPublicacion() {
        return idPublicacion;
    }

    public void setIdPublicacion(int idPublicacion) {
        this.idPublicacion = idPublicacion;
    }

    
    
    public PublicacionDTO(String texto, String Descipcion) {
        this.texto = texto;
        this.Descipcion = Descipcion;
    }

    public PublicacionDTO(String texto, String Descipcion, String habilitada) {
        this.texto = texto;
        this.Descipcion = Descipcion;
        this.habilitada = habilitada;
    }
    
    public int getIdHabilitada() {
        return idHabilitada;
    }

    public void setIdHabilitada(int idHabilitada) {
        this.idHabilitada = idHabilitada;
    }
    public String getHabilitada() {
        return habilitada;
    }

    public void setHabilitada(String habilitada) {
        this.habilitada = habilitada;
    }

    
    
    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getDescipcion() {
        return Descipcion;
    }

    public void setDescipcion(String Descipcion) {
        this.Descipcion = Descipcion;
    }
    
    
    
}
