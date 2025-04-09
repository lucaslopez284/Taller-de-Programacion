/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalAbril2024;

/**
 *
 * @author lopez
 */
public class Fecha {
    private int dia;
    private int mes;
    private int anio;

    public Fecha(int dia, int mes, int anio) {
        this.setDia(dia);
        this.setMes(mes);
        this.setAnio(anio);
    }
    
    

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }
    
    public boolean coincide(int m, int a){
        boolean aux = false;
        if ((this.getMes() == m)&&(this.getAnio() == a))
            aux = true;
        return aux;
    }

    @Override
    public String toString() {
        return "Dia: " + this.getDia() + ", mes: " + this.getMes() + ", anio: " + this.getAnio();
    }
    
    
    
}
