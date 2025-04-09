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
public class Triangulo extends Figura {
    
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unColorR, String unColorLi){
        super(unColorR, unColorLi);
        setLado1(unLado1);
        setLado2(unLado2);
        setLado3(unLado3);
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double unLado1) {
        lado1 = unLado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double unLado2) {
        lado2 = unLado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double unLado3) {
        lado3 = unLado3;
    }
    
    public double calcularPerimetro () {
        double aux;
        aux = getLado1() + getLado2() + getLado3();
        return aux;
    }
    
    public double calcularArea(){
         double s;
         s = (getLado1() + getLado2() + getLado3()) / 2.0;
         double aux;
         aux = Math.sqrt(s *(s-getLado1())*(s-getLado2())*(s-getLado3()));
         return aux;
    }
    
    public String toString (){
        String aux;
        aux = super.toString() +
              " Lado 1 : " + getLado1() +
               " Lado 2 : " + getLado2() +
                " Lado 3 : " + getLado3();
        return aux;
    }
    
    public String tipoFigura() {
        return "Triangulo ";
    }
}



