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
public class Proyecto {
    private String nombre;
    private int codigo;
    private String NombreDirector;
    private Investigador [] registroInvestigadores;
    private int cantInvestigadores = 0;
    
    
    public Proyecto (String unNombre, int unCodigo, String unNombreDirector){
        this.setNombre(unNombre);
        this.setCodigo(unCodigo);
        this.setNombreDirector(unNombreDirector);
        registroInvestigadores = new Investigador [50];
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if (this.getCantInvestigadores() < 50) {
            this.getRegistroInvestigadores() [this.getCantInvestigadores()] = unInvestigador;
            this.setCantInvestigadores(this.getCantInvestigadores()+1);
        }    
    }
    
   
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return NombreDirector;
    }

    public void setNombreDirector(String NombreDirector) {
        this.NombreDirector = NombreDirector;
    }

    public void  setCantInvestigadores(int i) {
        cantInvestigadores = i;
    }
    public int getCantInvestigadores() {
        return cantInvestigadores;
    }

    

    public Investigador getInvestigador( int i) {
        return registroInvestigadores[i];
    }
    
    
    
    public double getMontoTOtal (){
        double aux = 0;
        int cant = this.getCantInvestigadores();
        for (int i = 0; i < cant; i++){
            aux = aux + this.registroInvestigadores[i].getPlataEnSubsidios();
        }
         return aux;
    }
   
     public int retornarPosicionInvestigador (String nombre) {
        int aux = -1;
        boolean encontre = false;
        int i = 0;
        while (i<this.getCantInvestigadores()&& encontre != true){
            if (this.registroInvestigadores[i].getNombre().equals(nombre)) {
                encontre = true;
                aux = i;
            }
            i++;
               
        }
        return aux;
    }

    public Investigador[] getRegistroInvestigadores() {
        return registroInvestigadores;
    }

    
    
     public void otorgarSubsidios (String Nombre) {
         
        int aux = this.retornarPosicionInvestigador(Nombre);
        if (aux != -1) {
          this.getRegistroInvestigadores()[aux].otorgarTodos();
        }
     }
    public String ToString(){
        String aux;
        aux = "Nombre Proyecto: " + this.getNombre() + " Codigo: " + this.getCodigo() 
               + " Nombre Director: " + this.getNombreDirector() + "\n";
        aux = aux + "y ahora, los investigadores: " + "\n";
        for (int i = 0; i< this.getCantInvestigadores(); i++){
            aux = aux + this.registroInvestigadores[i].toString();
        }
        return aux;
        
    
 }
    
}
