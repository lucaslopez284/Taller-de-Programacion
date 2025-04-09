/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsandwich;

/**
 *
 * @author lopez
 */
public class ParcialSandwich {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Pan p = new Pan (" El mejor ", 100, "Premium");
       Sandwich san = new Sandwich ("Supeer", p, 4);
       Ingrediente i1 = new Ingrediente ("Tomate", 10, "A");
       Ingrediente i2 = new Ingrediente ("lechuga", 10, "A");
       Ingrediente i3 = new Ingrediente ("Carne", 10, "B");
       Ingrediente i4 = new Ingrediente ("Cheddar", 10, "B");
       Ingrediente i5 = new Ingrediente ("nada", 0, "A");
       san.agregarIngrediente(i1);
       san.agregarIngrediente(i2);
       san.agregarIngrediente(i3);
       san.agregarIngrediente(i4);
       san.agregarIngrediente(i5);
       System.out.println(san.toString());
       
    } 
    
}
