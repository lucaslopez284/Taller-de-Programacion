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
public class Corista extends Persona{
    private int tono;
    
    public Corista (String nom, int dni, int ed, int t){
        super(nom,dni,ed);
        this.setTono(t);
        
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
    
    @Override
     public String toString (){
        String aux;
        aux = super.toString();
        aux = aux + " Tono: " + this.getTono();
        return aux;
    }
    
}
