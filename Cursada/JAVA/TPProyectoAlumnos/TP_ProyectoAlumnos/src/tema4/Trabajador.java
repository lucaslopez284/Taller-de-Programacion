/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author lopez
 */

public class Trabajador extends Persona {
    private String Tarea;
    
    public Trabajador (String unNombre, int unDNI, int unaEdad,
             String unaTarea){
        super(unNombre,unDNI,unaEdad);
        this.setTarea(unaTarea);
       
    }
            

    public String getTarea() {
        return Tarea;
    }

    public void setTarea(String nueTarea) {
        this.Tarea = nueTarea;
    }
    
    public String toString (){
        return super.toString() + " Soy " + this.getTarea();
    }
}

    

