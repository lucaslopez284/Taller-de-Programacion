/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej01;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author lopez
 */
public class Practica5ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Proyecto pro1 = new Proyecto ("Laburo", 280419, "Lucas");
        Investigador in1 = new Investigador ("Mateo", 1 , " Ciencia");
        Investigador in2 = new Investigador ("Felipe", 2, "Historia");
        Investigador in3 = new Investigador ("Pedro", 3 , "Estadistica");
        pro1.agregarInvestigador(in1);
        pro1.agregarInvestigador(in2);
        pro1.agregarInvestigador(in3);
        
        for (int i = 0; i<3; i++){
           Subsidio sub1 = new Subsidio (100, " Desarrolo ");
           Subsidio sub2 = new Subsidio (200, " Inversion ");
           pro1.getInvestigador(i).AgregarSubsidio(sub1);
           pro1.getInvestigador(i).AgregarSubsidio(sub2);
        }
        
        pro1.otorgarSubsidios("Mateo");
        System.out.println(pro1.ToString());
        System.out.println(" El monto total recibido en subsidios para el proyecto es " + pro1.getMontoTOtal());
         
        
        
        
    }
    
}
