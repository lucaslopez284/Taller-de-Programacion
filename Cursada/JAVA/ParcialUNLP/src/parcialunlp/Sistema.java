/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialunlp;

/**
 *
 * @author lopez
 */
public abstract class Sistema {
    private Carrera propuesta;
    private int [] [] matriz;
    private int cantA;
    private int canTri = 4;
    
    public Sistema (Carrera unaCarrera, int cant){
        this.setPropuesta(unaCarrera);
        this.setCantA(cant);
        this.matriz = new int [cant][canTri];
        this.inicializarMatriz();
  
        
    }
    public void inicializarMatriz (){
        for (int i = 0; i < this.getCantA(); i++)
            for (int j= 0; j < this.getCanTri(); j++)
                this.getMatriz()[i][j] = -1;
        
    }

    public Carrera getPropuesta() {
        return propuesta;
    }

    public void setPropuesta(Carrera propuesta) {
        this.propuesta = propuesta;
    }

    public int[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(int[][] matriz) {
        this.matriz = matriz;
    }

    public int getCantA() {
        return cantA;
    }

    public void setCantA(int cantA) {
        this.cantA = cantA;
    }

    public int getCanTri() {
        return canTri;
    }

    public void setCanTri(int canTri) {
        this.canTri = canTri;
    }
    
    public void registrarCantidad (int a, int tri, int cant){
        int aux = a - this.getPropuesta().getCreacion();
        if (this.getMatriz()[aux][tri - 1] == -1) 
          this.getMatriz()[aux][tri - 1] = cant;
        
    }
    
    public int retornarCantidadEgresados (int a, int tri){
        int aux = a - this.getPropuesta().getCreacion();
        int c = this.getMatriz()[aux][tri];
        return c;
    }
    
    public int retornarCantidadTrimestres (int cant){
        int aux = 0;
        for (int i = 0; i < this.getCantA(); i++)
            for (int j= 0; j < this.getCanTri(); j++)
                  if (this.getMatriz()[i][j] == cant)
                      aux = aux + 1;
        return aux;
    }
    
            
    public String toString (){
        String aux = this.getPropuesta().toString();
        return aux;
    }
    
}
