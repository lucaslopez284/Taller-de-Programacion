/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialgnc;

/**
 *
 * @author lopez
 */
public class ParcialGNC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacion e1 = new Estacion ("av 28", 5,3);
        
        for (int i = 0; i< 8; i++)
          e1.crearVenta(4, 46739642, 10, "credito");
        e1.fueraDeServicio(100);
        System.out.println(e1.toString());
    }
    
}
  