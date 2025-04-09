/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author lopez
 */
public class Hotel {
    private String Nombre;
    private int cant;
    private Habitacion habitaciones [];

    public Hotel(String unNombre,int cant) {
        this.setNombre(unNombre);
        this.setCant(cant);
        this.habitaciones = new Habitacion [cant];
        inicializar(this.habitaciones);
    }
    
    public void inicializar(Habitacion [] vector){
        for (int i = 0; i< this.getCant(); i++)
            vector[i]= new Habitacion();
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    
    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(Habitacion[] habitaciones) {
        this.habitaciones = habitaciones;
    }

    public void aumentos (double precio){
        for (int i = 0; i < this.getCant(); i++){
            this.getHabitaciones()[i].aumentar(precio);
        }
    }
    
    public void ocuparHabitacion (Persona cliente, int n){
        this.getHabitaciones()[n-1].ocupar(cliente);
    }
    
    public String toString() {
        String aux = "Hotel: " + this.getNombre() + ", cantidad de habitaciones: " + this.getCant() + "\n";
        for (int i=0; i< this.getCant(); i++){
            aux += "Habitacion: " + (i+1) + " " + this.getHabitaciones()[i].toString() + "\n";
        }
        return aux;
    }
    
    
}
