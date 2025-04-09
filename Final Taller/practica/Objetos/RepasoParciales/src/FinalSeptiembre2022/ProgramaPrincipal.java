/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalSeptiembre2022;

/**
 *
 * @author lopez
 */
public class ProgramaPrincipal {
    public static void main(String[] args) {
        Fecha f1 = new Fecha (28,4,2019);
        SubsidioDeEstadia s1 = new SubsidioDeEstadia ("Flores", 100 , 5 , 10, "Lucas", "Sumar todo",  f1);
        System.out.println(s1.toString());
        Fecha f2 = new Fecha (28,9,2019);
        SubsidioBienes s2 = new SubsidioBienes (10, "Abril", "Gastar poco", f2 );
        Bien b1 = new Bien ("Sirve mucho", 20 , 10);
        Bien b2 = new Bien ("Muuy Malo", 2 , 3);
        s2.agregarBien(b1);
        s2.agregarBien(b2);
        System.out.println(s2.toString());
    }
}
