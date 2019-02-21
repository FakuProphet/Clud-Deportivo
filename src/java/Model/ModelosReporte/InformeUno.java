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
public class InformeUno {
    
    /*Monto total anual de ganancias en cuotas*/
    private double montoTotal;
    private int anio;

    public InformeUno() {
    }

    public InformeUno(double montoTotal, int anio) {
        this.montoTotal = montoTotal;
        this.anio = anio;
    }

    
    
    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }
    
    
    
}
