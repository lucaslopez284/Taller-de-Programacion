/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalOctubre2024;

/**
 *
 * @author lopez
 */
public class Cama {
    private int id;
    private Paciente pac = null;
    private boolean ocupada;
    private int cantDias ;

    public Cama(int id) {
        this.setId(id);
        this.setOcupada(false);
        this.setCantDias(0);
    }
    
    
    public void completar(Paciente p){
        this.setPac(p);
        this.setOcupada(true);
    }
    
    public void liberar(){
        System.out.println("Paciente " + this.getPac().getNombre() + " dado de alta");
        this.setPac(null);
        this.setOcupada(false);
        this.setCantDias(0);
    }
    
    public String obtenerDni(){
        String aux = this.getPac().getDni();
        return aux;
    }
    
    public void sumar(){
        this.setCantDias(this.getCantDias() + 1);
    }

    public Paciente getPac() {
        return pac;
    }

    public void setPac(Paciente pac) {
        this.pac = pac;
    }
    
    
            
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public int getCantDias() {
        return cantDias;
    }

    public void setCantDias(int cantDias) {
        this.cantDias = cantDias;
    }
    
    
    
}
