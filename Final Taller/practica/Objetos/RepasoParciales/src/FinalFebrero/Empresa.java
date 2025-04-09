/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalFebrero;

/**
 *
 * @author lopez
 */
public class Empresa {
    private String nombre;
    private String direccion;
    private Oficina [][] matriz = new Oficina [3][10];
    private int pisos = 3;
    private int max = 10;

    public Empresa(String nombre, String direccion) {
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.inicializar();
    }
    
    private void inicializar(){
        for (int i = 0; i< this.getPisos(); i++)
            for (int j = 0; j <this.getMax();j++ )
                this.getMatriz()[i][j] = null;
    }

    public int getPisos() {
        return pisos;
    }

    public int getMax() {
        return max;
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Oficina[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Oficina[][] matriz) {
        this.matriz = matriz;
    }
    
    public void agregarAlquiler(Persona p, double m, int pi, int o){
        Oficina ofi = new Oficina (p,m);
        this.getMatriz()[pi-1][o-1] = ofi;
    }
    
    public void liberarOficina (String d){
        boolean esta = false;
        int i = 0; int j = 0;
        while ((esta == false)&&(i < 3)){
            if (this.getMatriz()[i][j] != null){
                if (this.getMatriz()[i][j].getOcupante().getDNI().equals(d)){
                    esta = true;
                    this.getMatriz()[i][j] = null;
                } 
                j++;
                if (j == 10){
                    i++;
                    j=0;
                }
            }
               
        }
    }
    
    public void incremento (){
        double aux;
        for (int i = 0; i< this.getPisos(); i++){
            for (int j = 0; j < this.getMax();j++){
                if (this.getMatriz()[i][j]!= null){
                    if (i == 0){
                        aux = this.getMatriz()[i][j].getMontoDiario() * 1.05;
                        this.getMatriz()[i][j].setMontoDiario(aux);
                    }
                    else if (i == 1){
                          aux = this.getMatriz()[i][j].getMontoDiario() * 1.10;
                          this.getMatriz()[i][j].setMontoDiario(aux);
                        }
                    else if (i == 2){
                        aux = this.getMatriz()[i][j].getMontoDiario() * 1.15;
                        this.getMatriz()[i][j].setMontoDiario(aux);
                    }
                }
            }
        }
    }
    
    public int cantOfi(int o){
        int aux = 0;
        o = o - 1;
        for (int i = 0; i < this.getMax(); i++){
            if (this.getMatriz()[o][i]!= null)
                aux++;
        }
        return aux;
    }
    
    public String toString(){
        String aux = "Nombre " + this.getNombre()+ " , direccion " + this.getDireccion() + "\n";
        for (int i = 0; i< this.getPisos(); i++){
            aux += "Piso: " + (i+1) + "\n";
            for (int j = 0 ; j < this.getMax(); j++){
                aux += "Oficina: " + (j+1) + "\n";
                if (this.getMatriz()[i][j]!= null)
                   aux+= "Esta ocupada: " + this.getMatriz()[i][j].isAlquilado() + " ocupada por  " 
                           + this.getMatriz()[i][j].getOcupante().toString() + " monto " + this.getMatriz()[i][j].getMontoDiario();
                else aux += "Esta ocupada: " + false;
                aux+= "\n";
            } 
        }
        return aux;
    }
}
