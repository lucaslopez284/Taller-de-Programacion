/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialSupermercado;

/**
 *
 * @author lopez
 */
public class Ejercicio {
    public static void main(String[] args) {
        Supermercado s1= new Supermercado (" Sarandi y Mitre ");
        
        Caja c1 = new Caja("Lucas", 10);
        Caja c2 = new Caja("Thiago", 10);
        Caja c4 = new Caja("Joaquin", 10);
        s1.AgregarCaja(c4);
        s1.AgregarCaja(c1);
        s1.AgregarCaja(c2);
        s1.nuevoTicket(2, 63636, 7, 800, "credito");
        s1.nuevoTicket(2, 63636, 7, 800, "credito");
        s1.nuevoTicket(2, 63636, 7, 800, "credito");
        s1.nuevoTicket(1, 63636, 7, 800, "debito");
        s1.nuevoTicket(2, 63836, 7, 800, "debito");
        s1.nuevoTicket(3, 63636, 7, 800, "efectivo");
        s1.nuevoTicket(3, 63836, 7, 800, "efectivo");
       
        
        System.out.println(s1);
        System.out.println("La caja con mas pagos por credito fue la caja: " + s1.masCredito());
    }
}
