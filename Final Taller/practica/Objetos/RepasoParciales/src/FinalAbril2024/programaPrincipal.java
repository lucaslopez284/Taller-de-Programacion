/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAbril2024;

import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class programaPrincipal {
    public static void main(String[] args) {
        Sistema s = new Sistema();
        
        Fecha f1 = new Fecha (21, 4, 2019);
        Fecha f2 = new Fecha (28, 4, 2019);
        Fecha f3 = new Fecha (28, 9, 2019);
        Fecha f4 = new Fecha (18, 10, 2019);
        Fecha f5 = new Fecha (7, 12, 2019);
        Fecha f6 = new Fecha (1, 6, 2023);
        Fecha f7 = new Fecha (1, 6, 2023);
        Fecha f8 = new Fecha (23, 4, 2024);
        Fecha f9 = new Fecha (23, 4, 2024);
        Fecha f10 = new Fecha (23, 4, 2024);
        
        Cliente c1 = new Cliente (1, "Lucas", "Necul");
        Cliente c2 = new Cliente (2, "Nicolas", "Gimenez");
        Cliente c3 = new Cliente (3, "Santiago", "Toloza");
        Cliente c4 = new Cliente (4, "Nicolas", "Domingo");
        Cliente c5 = new Cliente (5, "Bautista", "Cejas");
        
        Poliza p1 = new Poliza (100, 100, f1, f6, c1);
        Poliza p2 = new Poliza (100, 100, f2, f7, c2);
        Poliza p3 = new Poliza (100, 100, f3, f8, c3);
        Poliza p4 = new Poliza (100, 100, f4, f9, c4);
        Poliza p5 = new Poliza (100, 100, f5, f10, c5);
        
        s.agregarPoliza(p1, 3);
        s.agregarPoliza(p2, 3);
        s.agregarPoliza(p3, 1);
        s.agregarPoliza(p4, 5);
        s.agregarPoliza(p5, 7);
        
        System.out.println(s.toString());
        System.out.println("Ingrese dni");
        int dni = Lector.leerInt();
        System.out.println("Polizas del cliente de DNI " + dni);
        System.out.println (s.infoCliente(dni));
        System.out.println("Cantidad de polizas que se vencen en abril de 2024 " + s.cantidadAVencer(4, 2024));
        s.aumentarCuotas(1.11, 3);
        System.out.println(s.toString());
    }
}
