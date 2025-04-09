/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalSeptiembre2022;

/**
 *
 * @author lopez
 */
public class SubsidioBienes extends Subsidio {
    
    private int diml = 0;
    private int max;
    private Bien bienes [];

    public SubsidioBienes(int max, String Investigador, String planDeTrabajo, Fecha fec) {
        super(Investigador, planDeTrabajo, fec);
        this.setMax(max);
        this.bienes = new Bien [max];
        this.inicializar();
    }
    
    private void inicializar (){
        for (int i = 0; i < this.getMax(); i++ )
            bienes[i] = null;
    }
    
    public void agregarBien (Bien b){
        if (this.getDiml() < this.getMax()) {
            bienes[this.getDiml()] = b;
            this.setDiml(this.getDiml() + 1);
        }
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

    public Bien[] getBienes() {
        return bienes;
    }

    public void setBienes(Bien[] Bienes) {
        this.bienes = Bienes;
    }

    @Override
    public String toString() {
        String aux = super.toString() + "\n";
        for (int i = 0; i< this.getDiml(); i++){
          aux += "Descripcion bien " + (i + 1) + " : " + this.getBienes()[i].getDescripcion() + "\n";
        }
        return aux;
    }
    
    
    
    
    

    @Override
    public double getMontoTotal() {
        double aux = 0;
        for (int i = 0; i< this.getDiml(); i++)
            aux += this.getBienes()[i].costoFinal();
        return aux;
    }
    
}
