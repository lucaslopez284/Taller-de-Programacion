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
    private double ladoA ;
    private double ladoB ;
    private double ladoC ;
    private String Relleno;
    private String Linea;
    
    
    
    public Triangulo (double unLadoA, double unLadoB, double unladoC,
            String unRelleno, String unLinea){
        ladoA = unLadoA;
        ladoB = unLadoB;
        ladoC = unladoC;
        Relleno = unRelleno;
        Linea = unLinea;
     }

   

    public double getLadoA() {
        return ladoA;
    }

    public void setLadoA(double unladoA) {
        ladoA = unladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public void setLadoB(double unladoB) {
        ladoB = unladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoC(double unladoC) {
        ladoC = unladoC;
    }

    public String getRelleno() {
        return Relleno;
    }

    public void setRelleno(String unRelleno) {
        Relleno = unRelleno;
    }

    public String getLinea() {
        return Linea;
    }

    public void setLinea(String unLinea) {
        Linea = unLinea;
    }
    
    public double calcularPerimetro (){
        double aux;
        aux = ladoA + ladoB + ladoC;
        return aux;
    }
    
    public double calcularArea (){
         double s;
         s = (ladoA + ladoB + ladoC) / 2.0;
         double aux;
         aux = Math.sqrt(s *(s-ladoA)*(s-ladoB)*(s-ladoC));
         return aux;
    }
     
    public String toString () {
        String aux;
        aux = "lado A: " + ladoA + " lado B: " + ladoB + " ladoC: " + ladoC + " Color relleno: " + Relleno + " Color de linea " + Linea;
        return aux;
    }
     
}
