/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalmarzo2024;

/**
 *
 * @author lopez
 */
public class FinalMarzo2024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Sector s = new Sector ("Automovilismo" , 10);
        Trabajador j = new Trabajador ("Lucas", "Lopez", 25);
        Trabajador e1 = new Trabajador ("Catalina", "Petroni", 20);
        Trabajador e2 = new Trabajador ("Lautaro", "Petroni", 30);
        s.agregarEmpleado(j, true);
        s.agregarEmpleado(e1, false);
        s.agregarEmpleado(e2, false);
        Producto p1 = new Producto(280419);
        Producto p2 = new Producto(280919);
        Producto p3 = new Producto(71219);
        s.agregarProducto(p1);
        s.agregarProducto(p2);
        s.agregarProducto(p3);
        s.cambiarEtapa(280419, 10);
        s.cambiarEtapa(280419, 10);
        s.cambiarEtapa(280419, 10);
        s.cambiarEtapa(280419, 10);
        System.out.println(s.toString());
    }
    
}
