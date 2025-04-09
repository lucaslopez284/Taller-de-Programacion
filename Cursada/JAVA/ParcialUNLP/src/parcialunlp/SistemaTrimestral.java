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
public class SistemaTrimestral extends Sistema {
    
     public SistemaTrimestral (Carrera c, int cant){
        super(c, cant);
        
    }

    
    @Override
    public String toString (){
        String aux = super.toString();
        for (int j = 0; j< this.getCanTri(); j++){
            int contador = 0;
            for (int i = 0; i < this.getCantA(); i++){
                contador = contador + this.getMatriz()[i][j];
            }
             aux = aux + "trimestre " + (j + 1) + ": " + contador + " egresados " + " \n";
        }
        return aux;
            
        
    }
}
