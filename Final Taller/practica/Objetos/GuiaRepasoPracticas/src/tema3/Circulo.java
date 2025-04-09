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
public class Circulo {
    private double radio;
    private String colorLinea;
    private String colorRelleno;

    public Circulo(double radio, String colorLinea, String colorRelleno) {
        this.setRadio(radio);
        this.setColorLinea(colorLinea);
        this.setColorRelleno(colorRelleno);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public double calcularPerimetro (){
        return 2 * Math.PI * this.getRadio();
    }
    public double calcularArea (){
        return Math.PI * (this.getRadio() * this.getRadio());
    }
    
    public String toString() {
        return "Circulo: " + " radio: " + this.getRadio() + ", colorLinea: " + this.getColorLinea() + ", colorRelleno: " + this.getColorRelleno();
    }
    
    
}
