/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialuno;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class ParcialUno {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Digital b1 = new Digital ("Aguante el Arse ", 28, 100, "Polvorines");
       
       Tradicional b2 = new Tradicional ("trend", 28, 100, "av 28", " Tristan Suarez");
       
       Cuenta c1 = new Cuenta (1, "Arsenal 2 Patronato 0 ", 2,  "pesos",3);
       b1.agregarCuenta(c1);
       System.out.println(b1.toString());
       Cuenta c2 = new Cuenta (8, "Arsenal 2 Talleres 1 ", 2,  "dolares",1);
       Cuenta c3 = new Cuenta (4, "Arsenal 1 San miguel 0 ", 2,  "dolares",3000000);
       
       b2.agregarCuenta(c2);
       b2.agregarCuenta(c3);
       System.out.println(b2.toString());
       b2.incrementar(7, 10);
       System.out.println(b2.toString());
       System.out.println(b1.obtenerCBU(1).toString());
       
       
       System.out.println( b2.puedeRecibirTarjeta(4));
       
       
       
    }
    
}
