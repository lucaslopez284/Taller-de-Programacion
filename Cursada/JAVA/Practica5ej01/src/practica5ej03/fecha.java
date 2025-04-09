/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej03;

/**
 *
 * @author lopez
 */
public class fecha {
    private int dia;
    private String ciudad;
    
    public fecha (int unDia, String unaCiudad){
        this.setDia(unDia);
        this.setCiudad(unaCiudad);
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    public String toString(){
        return "Ciudad: " + this.getCiudad() + " Dia: " + this.getDia();
    }
    
}
