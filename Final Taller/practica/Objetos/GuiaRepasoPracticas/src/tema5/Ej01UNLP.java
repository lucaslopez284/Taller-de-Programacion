/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author lopez
 */
public class Ej01UNLP {
    public static void main(String[] args) {
        Proyecto p = new Proyecto ("Arse", 2804 , "Toloza");
        Investigador i = new Investigador ("Lucas", 5, "que se yo");
        Subsidio s = new Subsidio (912, "AAAA");
        i.agregarSubsidio(s);
        p.agregarInvestigador(i);
        p.otorgar("Lucas");
        System.out.println(p.toString());
        
    }
}
