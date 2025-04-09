
package tema5;


public abstract class Recital {
    private String banda;
    private String [] listaTemas;
    private int cant;
    private int max;

    public Recital(String banda, int max) {
        this.setBanda(banda);
        this.setCant(0);
        this.listaTemas = new String [max];
        this.inicializar(max);
    }
    
    private void inicializar(int cant){
        for (int i = 0; i< cant; i++)
            this.getListaTemas()[i] = null;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }
    
    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }
    
    
    
    

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }
    
    public boolean hayLugar(){
        return (this.getCant()< this.getMax());
    }
    
    public void agregarTema(String t){
        if (this.hayLugar()){
            this.listaTemas[cant] = t;
            this.cant++;
        }
    }
    
    public void actuar(){
        for (int i = 0; i < this.getCant(); i++){
            System.out.println("Y ahora tocaremos " + this.listaTemas[i]);
        }
    }
    
    public abstract double calcularCosto();
    
}
