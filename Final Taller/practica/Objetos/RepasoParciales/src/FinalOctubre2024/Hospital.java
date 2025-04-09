
package FinalOctubre2024;
public class Hospital {
   private String nombre;
   private String direccion;
   private int pisos = 10;
   private int camas = 20;
   private Cama [] [] matriz = new Cama [10] [20];

    public Hospital(String nombre, String direccion) {
        this.getNombre();
        this.getDireccion();
        this.inicializarCama();
    }
   
    private void inicializarCama(){
        int aux = 0;
        for (int i = 0; i < this.getPisos(); i++)
            for (int j = 0; j < this.getCamas(); j++){
                aux++;
                this.getMatriz()[i][j] = new Cama (aux);
            }              
    }
    
    public void ingresarPaciente(Paciente p, int pi, int ca){
        this.getMatriz()[pi-1][ca-1].completar(p);   
        System.out.println("Paciente " + p.getNombre() + "agregado correctamente a la cama " + ca + " del piso " + pi);
    }
    
    public void darDeAlta (String d){
        boolean esta = false;
        int i = 0;
        int j = 0;
        while ((esta != true) && (i< this.getPisos())){
            
            if (this.getMatriz()[i][j].isOcupada()){
                if (this.getMatriz()[i][j].obtenerDni().equals(d)){
                    
                    this.getMatriz()[i][j].liberar();
                    esta = true;
                }
            }
            if (j == 20){
                j = 0;
                i++;
            }
        }
        if (esta == false)
            System.out.println("No se encontro el DNI" + d);
    }
    
    private void incrementar(){
        for (int i = 0; i < this.getPisos(); i++){
            for (int j = 0; j < this.getCamas(); j++){
                if (this.getMatriz()[i][j].isOcupada())
                    this.getMatriz()[i][j].sumar();
            } 
        }
    }
    
    public int cantidad(){
        int suma = 0;
        for (int i = 0; i < this.getPisos(); i++){
            int aux = 0;
            for (int j = 0; j < this.getCamas(); j++){
                if (this.getMatriz()[i][j].isOcupada())
                    aux++;
            } 
            if (aux == 20)
                suma++;
        }
        return suma;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getPisos() {
        return pisos;
    }

    private void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getCamas() {
        return camas;
    }

    private void setCamas(int camas) {
        this.camas = camas;
    }

    public Cama[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Cama[][] matriz) {
        this.matriz = matriz;
    }
   
   
   
}
