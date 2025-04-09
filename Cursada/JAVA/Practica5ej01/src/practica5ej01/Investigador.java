/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej01;

/**
 *
 * @author lopez
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio [] registroSub; 
    private int cantSubsidios = 0;
    
    public Investigador (String unNombre , int cate, String unaEspecialidad) {
        this.setNombre(unNombre);
        this.setCategoria(cate);
        this.setEspecialidad(unaEspecialidad);
        this.registroSub = new Subsidio [5];
        
    }
    
   
    
    public void AgregarSubsidio (Subsidio unSubsidio) {
        
        if (this.getCantSubsidios()<5) {
            
            registroSub [this.getCantSubsidios()] = unSubsidio;
            this.setCantSubsidios(this.getCantSubsidios()+1);
        }
        
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int nueCategoria) {
        if (nueCategoria > 0 && nueCategoria < 6)
                this.categoria = nueCategoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }

    public void setCantSubsidios(int cantSubsidios) {
        this.cantSubsidios = cantSubsidios;
    }

    public Subsidio[] getRegistroSub() {
        return registroSub;
    }

    public void setRegistroSub(Subsidio[] registroSub) {
        this.registroSub = registroSub;
    }
    
   
    
    
    
    
    public double getPlataEnSubsidios (){
        double aux = 0;
        
        int cant = this.getCantSubsidios();
        for (int i = 0; i<cant; i++){
                 aux = aux + this.registroSub[i].getMonto();
                
            }
            
                
        
        return aux;
        
    }
    public void otorgarTodos(){
        for (int i = 0; i < this.getCantSubsidios(); i++)
            this.getRegistroSub()[i].setEstado();
    }
    
    public String toString(){
        String aux;
        aux = " Nombre: " + this.getNombre() + " Categoria: " + this.getCategoria() +
                " Especialidad: " + this.getEspecialidad() + " Total plata de subsidios: " + this.getPlataEnSubsidios() + "\n";
        return aux;
    }
    
}
