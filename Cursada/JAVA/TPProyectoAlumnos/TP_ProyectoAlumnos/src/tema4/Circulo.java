/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author lopez
 */
public class Circulo extends Figura {
    
    private double radio;
    
    public Circulo (double unRadio, String colRe, String colLi){
        super(colRe, colLi);
        setRadio(unRadio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double unRadio) {
       
        radio = unRadio;
    }
    
    public double calcularArea (){
        return Math.PI * (getRadio()*getRadio());
    }

  
    public double calcularPerimetro() {
        return Math.PI * getRadio();
    }
    
    public String toString () {
        String aux;
        aux = super.toString() + " Radio: " + getRadio();
        return aux;
    }
    
    public String tipoFigura() {
        return "Circulo ";
    }
}
