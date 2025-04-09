package parcialsandwich;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lopez
 */
public class Ingrediente extends Componente {
   
    private String grupo;
    
    public Ingrediente (String n, double c, String g){
        super (n,c);
        this.setGrupo(g);
    }

    

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }
    
    public String toString (){
        String aux = super.toString()
                     + " Grupo: " + this.getGrupo() + "\n";
        return aux;
    }

    @Override
    public double calcularCostoFinal() {
        double aux = this.getCosto();
        if (this.getGrupo().equals("B"))
            aux = aux * 1.10;
        return aux;
    }
    
}
