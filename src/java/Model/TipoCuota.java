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
public class TipoCuota {
    private int id;
    private String nombre;
    private int monto;

    public TipoCuota(String nombre, int monto) {
        this.nombre = nombre;
        this.monto = monto;
    }

    public TipoCuota(int id, String nombre, int monto) {
        this.id = id;
        this.nombre = nombre;
        this.monto = monto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    @Override
    public String toString() {
        return "TipoCuota{" + "id=" + id + ", nombre=" + nombre + ", monto=" + monto + '}';
    }
    
    
    
}
