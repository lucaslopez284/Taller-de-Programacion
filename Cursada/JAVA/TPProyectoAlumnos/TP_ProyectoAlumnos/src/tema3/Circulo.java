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
    private String relleno;
    private String linea;
   
    public Circulo (double unRadio, String unRelleno, String unColorLinea) {
          radio = unRadio;
          relleno = unRelleno;
          linea = unColorLinea;
     } 

    public double getRadio() {
        return radio;
    }

    public void setRadio(double unRadio) {
        radio = unRadio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String unRelleno) {
        relleno = unRelleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String unColorLinea) {
        linea = unColorLinea;
    }
    
    public double calcularPerimetro () {
        double aux;
        aux = Math.PI * radio;
        return aux;
    }
    
    public double calcularArea (){
        double aux;
        aux = Math.PI * (radio * radio);
        return aux;
    } 
        
}
