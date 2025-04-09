/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsandwich;

/**
 *
 * @author lopez
 */
public class Pan extends Componente {
    
    private String calidad;
    
    public Pan (String n, double cos, String cal){
        super (n, cos);
        this.setCalidad(cal);
    }

    

    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }
    
    
    public String toString (){
        String aux = super.toString()
                     + " Calidad: " + this.getCalidad() + "\n";
        return aux;
    }

    @Override
    public double calcularCostoFinal() {
       double aux = this.getCosto();
        if (this.getCalidad().equals("Premium"))
            aux = aux * 1.20;
        return aux;
    }
    
}
