/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author lopez
 */
public class Hotel {
    private int diml;
    private Habitacion [] habitaciones;
    
    public Hotel (int numHabitaciones){ 
      this.diml = numHabitaciones;
      this.habitaciones = new Habitacion [numHabitaciones];
      for (int i = 0; i < diml ; i++)
          habitaciones [i] = new Habitacion (GeneradorAleatorio.generarInt(6001)+ 2000);
  }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int numHabitaciones) {
        diml = numHabitaciones;
    }

    public Habitacion getHabitaciones(int numHabitacion) {
        return habitaciones [numHabitacion];
    }

    public void setHabitaciones(Habitacion nueHabitacion, int numHabitacion) {
        habitaciones [numHabitacion] = nueHabitacion;
    }
    
    
    public void aumentarPrecio(double aumento) {
        for (int i = 0; i <diml; i++)
            habitaciones [i].setCosto(habitaciones[i].getCosto()+aumento);
    }
    public String toString (){
        int i;
        for (i = 0; i < diml; i++){
            System.out.print("Habitacion: " + i + " Costo " + habitaciones[i].getCosto() + " ");
            if (habitaciones [i].getDisponibilidad())
                System.out.print(" Libre ");
            else System.out.print(" Ocupada , Datos del cliente: " + habitaciones[i].getHuesped().toString());
            System.out.println();
        }
        return "";
    }
    
}
