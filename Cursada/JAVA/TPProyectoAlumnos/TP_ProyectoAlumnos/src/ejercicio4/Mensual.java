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
public class Mensual extends Sistema {
    
    
    
    public Mensual (Estacion unaEstacion, int cant, int arranque){
        super(unaEstacion, cant, arranque);
    }

    
    public String retornarPromedio() {
       String aux = "";
       double total;
       double promedio;
       for (int j = 0; j< 12; j++) {
           total = 0;
           for (int i = 0; i< this.getCantA(); i++){
               total = total + this.getRegistro()[i][j];
           }
        promedio = (double) total / this.getCantA();
        aux = aux + this.getMeses() [j] + ": " + promedio + "°C" + "\n";
       }
       return aux;
           
       
            
    }
    
     public String toString() {
        return super.toString();
    }
    
    
}
