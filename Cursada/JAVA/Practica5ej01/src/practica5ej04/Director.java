/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej04;

/**
 *
 * @author lopez
 */
public class Director extends Persona {
    private int antiguedad;
    
    public Director (String nom, int dni, int ed, int ant){
        super(nom,dni,ed);
        this.setAntiguedad(ant);
        
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString (){
        String aux;
        aux = super.toString();
        aux = aux + " Antiguedad: " + this.getAntiguedad();
        return aux;
    }
   

    
    
}
