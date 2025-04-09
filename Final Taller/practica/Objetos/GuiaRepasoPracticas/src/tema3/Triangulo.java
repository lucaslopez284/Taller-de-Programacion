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
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.setLado1(lado1);
        this.setLado2(lado2);
        this.setLado3(lado3);
        this.setColorRelleno(colorRelleno);
        this.setColorLinea(colorLinea);
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro(){
        return this.getLado1() + this.getLado2() + this.getLado3();
    }
    
    public double s (){
        return (double) (this.getLado1() + this.getLado2() + this.getLado3()) / 2;
    }
    
    public double calcularArea(){
        double aux = (double) Math.sqrt(this.s()*(this.s()- this.getLado1())*(this.s() - this.getLado2())*(this.s() - this.getLado3()));
        return aux;
    }

    @Override
    public String toString() {
        return "Triangulo{" + "lado1=" + this.getLado1() + ", lado2=" + this.getLado2() + ", lado3=" + this.getLado3() + ", colorRelleno=" + this.getColorRelleno() + ", colorLinea=" + this.getColorLinea() + '}';
    }
    
    
   
    
    
}
