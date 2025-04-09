/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsupermercado;

/**
 *
 * @author lopez
 */
public class ParcialSupermercado {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Supermercado s = new Supermercado ("Maritimo" , " 28 y 04" , 2 , 2);
        Producto p1= new Producto (111, "crema", "sancor", 10, 2);
        Producto p2= new Producto (222, "tomate", "natural", 10, 2);
        Producto p3= new Producto (333, "leche", "sancor", 10, 2);
        Producto p4= new Producto (444, "chocolate", "milka", 10, 2);
        s.agregarProducto(p1);
        s.agregarProducto(p2);
        s.agregarProducto(p3);
        s.agregarProducto(p4);
        System.out.println(s.mismaMarca(2, "sancor"));
        System.out.println(s.toString());
         
    }
    
}
