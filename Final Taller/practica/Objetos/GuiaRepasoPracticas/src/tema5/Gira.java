
package tema5;

public class Gira extends Recital{
    public String nombre;
    public Fecha actual;
    public int aux;
    public Fecha [] lista;
    public int cant;
    public int max;

    public Gira(String nombre, int max, String banda, int max2){
        super(banda, max2);
        this.setNombre(nombre);
        this.lista = new Fecha [max];
        this.setAux(0);
        this.inicializar(max);
        this.setCant(0);
        this.setMax(max);
        this.actual = null;
        
    }

  
    private void inicializar(int max){
        for (int i = 0; i< max; i++)
            this.getLista()[i] = null;
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Fecha getActual() {
        return actual;
    }

    public void setActual(Fecha actual) {
        this.actual = actual;
    }

    public int getAux() {
        return aux;
    }

    public void setAux(int aux) {
        this.aux = aux;
    }
    
    

    

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public Fecha[] getLista() {
        return lista;
    }

    public void setLista(Fecha[] lista) {
        this.lista = lista;
    }
    
    public void agregarFecha(Fecha f){
        if (this.getCant()< this.getMax()){
            this.getLista()[this.getCant()]= f;
            if (this.getCant() == 0)
                this.setActual(this.getLista()[0]);
            this.setCant(this.getCant() + 1);
        }
    }
    
    public void actuar(){
        System.out.print("Buenas noches ");
        if (this.getActual() == null){
            System.out.println("----");
        }
        else{
            System.out.println(this.getActual().getCiudad());
        }
        super.actuar();
        if (this.getAux()< this.getMax()){
            this.setAux(this.getAux() + 1);
            this.setActual(this.getLista()[this.getAux()]);
        }
    }

    @Override
    public double calcularCosto() {
       double cos = this.getCant()* 30000;
       return cos; 
    }
    
    
    
}
