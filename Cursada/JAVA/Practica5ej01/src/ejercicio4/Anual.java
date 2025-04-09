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
public class Anual extends Sistema {
    
    
    public Anual (Estacion unaEstacion, int cant, int arranque){
        super(unaEstacion, cant, arranque);
    }

    
    public String retornarPromedio() {
        String aux = "";
        double total;
        double promedio;
        for (int i = 0; i< this.getCantA(); i++){
            total = 0;
            for (int j = 0; j < 12;  j++){
                total = total + this.getRegistro()[i][j];
            }
        promedio = (double) total / 12;
        aux = aux + "Anio: " + (this.getaIni()+ i) + " temperatura promedio: " + promedio + "°C" + "\n";
        }
     return aux;
    }
    
     public String toString() {
        return super.toString();
    }
}
