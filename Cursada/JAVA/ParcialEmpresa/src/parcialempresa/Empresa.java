/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialempresa;

/**
 *
 * @author lopez
 */
public class Empresa {
    private String nombre;
    private String direccion;
    private Director ejecutivo;
    private Encargado [] registro;
    private int diml = 0;
    private int max;
    
    public Empresa (String unNom, String dire, Director unDirec,int cant){
        this.setNombre(unNom);
        this.setDireccion(dire);
        this.setEjecutivo(unDirec);
        
        this.setMax(cant);
        this.registro = new Encargado [cant];
        this.inicializar(cant);
        
    }
    
    public void inicializar (int max){
        for (int i = 0; i < max; i++){
            this.registro[i]= null;
        }
    }
    
    
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getEjecutivo() {
        return ejecutivo;
    }

    public void setEjecutivo(Director ejecutivo) {
        this.ejecutivo = ejecutivo;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Encargado[] getRegistro() {
        return registro;
    }

    public void setRegistro(Encargado[] registro) {
        this.registro = registro;
    }
    
    
    public void agregarEncargado (Encargado unEncargado, int pos){
        if (this.getDiml()< this.getMax()){
            this.getRegistro()[pos - 1] = unEncargado;
            this.setDiml(this.getDiml() + 1);
            System.out.println("Se agrego correctamente");
        }
        else   System.out.println("Ya estan llenas las sucursales");
    }
    
    public String toString (){
        String aux = " Nombre: " + this.getNombre() + " direccion: " + this.getDireccion() 
                + this.getEjecutivo().toString() + "\n";
        for (int i = 0; i< this.getMax(); i++){
            if (this.getRegistro()[i] != null){
                aux = aux + " Sucursal: " + (i+1) + this.getRegistro()[i].toString();
            }
            else aux = aux + " Sucursal: " + (i+1) + " se encuentra vacia " + "\n";
        }
        return aux;
           
    }
            
}
