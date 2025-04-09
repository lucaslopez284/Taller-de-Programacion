/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector; 	

/**
 *
 * @author lopez
 */
public abstract class Sistema {
    private Estacion estAct;
    private int aIni;
    private int cantA;
    private double [] [] registro;
    private String[] meses = new String[]{"Enero", "Febrero", "Marzo",
        "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
        "Octubre", "Noviembre", "Diciembre"};
    
    public Sistema (Estacion unaEstacion, int cant , int inicio){
        this.setEstAct(unaEstacion);
        this.setCantA(cant);
        this.setaIni(inicio);
        registro = new double [cant] [12];
        for (int i = 0; i <cant; i++) {
            for(int j = 0; j < 12; j++) 
                this.getRegistro() [i][j] = 100;
    
        }
    }

    public String[] getMeses() {
        return meses;
    }

    
    
    
    public Estacion getEstAct() {
        return estAct;
    }

    public void setEstAct(Estacion estAct) {
        this.estAct = estAct;
    }

    public int getaIni() {
        return aIni;
    }

    public void setaIni(int aIni) {
        this.aIni = aIni;
    }

    public int getCantA() {
        return cantA;
    }

    public void setCantA(int cantA) {
        this.cantA = cantA;
    }

    public double[][] getRegistro() {
        return registro;
    }

    public void setRegistro(double[][] registro) {
        this.registro = registro;
    }
    public void registrarTemperatura (double temp, int anio, int mes){
        int aux = anio - this.getaIni();
        this.getRegistro() [aux][mes - 1] = temp;
    }
    
    public double devolverTemperatura (int anio, int mes) {
        double aux;
        int a = anio - this.getCantA();
        aux = this.getRegistro()[a][mes - 1];
        return aux;
        
    }
    
    public void cargarAMano(){
        double t;
        for (int i = 0; i < this.getCantA(); i++) {
            for (int j = 0; j < 12 ; j++){
                System.out.println("Ingrese la temperatura para el mes " + this.getMeses()[j] + 
                        " del anio " + (this.getaIni()+ i));
                t = Lector.leerDouble();
                this.registrarTemperatura(t, (this.getaIni()+ i), (j+1));
        }
      }
    }
    
    public String mayorTemperatura (){
        String aux;
        double max = -1;
        int mesMax = -1;
        int aMax = -1;
        for (int i = 0; i < this.getCantA(); i++) {
            for (int j = 0; j < 12 ; j++){
                if (this.getRegistro()[i][j] > max) {
                    max = this.getRegistro()[i][j];
                    mesMax = j;
                    aMax = this.getaIni()+ i;
                }
            }
        }
        aux = "La mayor temperatura fue: " + max + " se registro el mes de " + this.getMeses()[mesMax]
                + " en el anio " + aMax;
        return aux;
    }
            
            
    public String toString() {
        String aux;
        aux = this.getEstAct().toString() + "\n";
        aux = aux + this.retornarPromedio();
        return aux;
    }
    
    public abstract String retornarPromedio ();
    

}
