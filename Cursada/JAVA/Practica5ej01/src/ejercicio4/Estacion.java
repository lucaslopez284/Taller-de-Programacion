/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author lopez
 */
public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    
    
    public Estacion (String unNombre, double unLatitud, double unLongitud ){
       this.setNombre(unNombre);
       this.setLatitud(unLatitud);
       this.setLongitud(unLongitud);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
    
    public String toString (){
        return "Ciudad: " + this.getNombre() + " latitud: " + this.getLatitud() +
                " longitud: " + this.getLongitud();
    }
    
    
}
