/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej03;

/**
 *
 * @author lopez
 */
public abstract class Recital {
    private String Banda;
    private String [] listaTemas;
    private int cantMax;
    private int cantTemas;
    private String [] motivos = {" a beneficio ", " show TV " , " show privado "};
    
    
    public Recital (String unaBanda, int max){
        this.setBanda(unaBanda);
        this.setCantMax(max);
        this.setCantTemas(0);
        listaTemas = new String [max];
        for (int i = 0; i<max;i++)
            listaTemas [i] = null;
    }

    public String getBanda() {
        return Banda;
    }

    public void setBanda(String Banda) {
        this.Banda = Banda;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    public int getCantMax() {
        return cantMax;
    }

    public void setCantMax(int cantMax) {
        this.cantMax = cantMax;
    }

    public String[] getMotivos() {
        return motivos;
    }

    public void setMotivos(String[] motivos) {
        this.motivos = motivos;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public void setCantTemas(int cantTemas) {
        this.cantTemas = cantTemas;
    }
    
    public void agregarTema (String nuevoTema){
        if (this.getCantTemas()< this.getCantMax()) {
          this.getListaTemas()[this.getCantTemas()]= nuevoTema;
          this.setCantTemas(this.getCantTemas() + 1);
          System.out.println("Se pudo agregar correctamente el tema " + nuevoTema);
        }
        else  System.out.println("La lista de temas se encuentra llena");
    }
    
    public void Actuar (){
        for (int i = 0; i< this.getCantTemas(); i++){
            System.out.println("Y ahora tocaremos " + this.getListaTemas()[i]);
        }
    }
    
    public abstract double calcularCosto();
}
