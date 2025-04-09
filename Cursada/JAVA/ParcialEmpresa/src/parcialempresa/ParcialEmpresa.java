/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialempresa;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class ParcialEmpresa {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      Director d1 = new Director ("Lucas", 46739642, 2000, 100, 28);
      
      Empresa emp1 = new Empresa ("Eficiencias", "av 28 calle 4", d1, 4);
      Encargado e1 = new Encargado ("Delga", 46739642, 2008, 2000, 6);
      emp1.agregarEncargado(e1,2);
      System.out.println(emp1.toString());
    }
    
}
 