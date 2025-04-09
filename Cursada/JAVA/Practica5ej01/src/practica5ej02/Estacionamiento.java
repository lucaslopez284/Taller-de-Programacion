package practica5ej02;

/**
 *
 * @author lopez
 */
public class Estacionamiento {

    private String nombre;
    private String direccion;
    private int apertura;
    private int cierre;
    private Auto [] [] matriz;
    private int cantPisos;
    private int cantPlazas;
    
    public Estacionamiento (String unNombre, String dire){
        this.setNombre(unNombre);
        this.setDireccion(dire);
        this.setApertura(8);
        this.setCierre(21);
        matriz = new Auto [5][10];
        this.setCantPisos(5);
        this.setCantPlazas(10);
        
    }
    
    public Estacionamiento (String unNombre, String dire, int ap, int cie, int numPi ,int numPa ) {
        this.setNombre(unNombre);
        this.setDireccion(dire);
        this.setApertura(ap);
        this.setCierre(cie);
        matriz = new Auto [numPi] [numPa];
        this.setCantPisos(numPi);
        this.setCantPlazas(numPa);
        this.inicializarMatriz(numPi, numPa);
       
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

    public int getApertura() {
        return apertura;
    }

    public void setApertura(int apertura) {
        this.apertura = apertura;
    }

    public int getCierre() {
        return cierre;
    }

    public void setCierre(int cierre) {
        this.cierre = cierre;
    }

    public Auto[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Auto[][] matriz) {
        this.matriz = matriz;
    }

    public int getCantPisos() {
        return cantPisos;
    }

    public void setCantPisos(int cantPisos) {
        this.cantPisos = cantPisos;
    }

    public int getCantPlazas() {
        return cantPlazas;
    }

    public void setCantPlazas(int cantPlazas) {
        this.cantPlazas = cantPlazas;
    }
    
     
    public void agregarAuto(Auto au, int piso, int plaza){
        this.getMatriz() [piso - 1] [plaza - 1] = au;
        
    }
    
     public void inicializarMatriz(int n,int a){
        int i, j;
        for(i=0;i<n;i++){
            for(j=0;j<a;j++){
                this.matriz[i][j] = new Auto();
            }
        }
    }   
    
    
    public String buscarPatente(String pat){
        String aux = "";
        Boolean encontre = false;
        int i = 0;
        int j = 0;
        int pi = -1;
        int pa = -1;
        while (i < this.getCantPisos() && encontre == false){
            while (j < this.getCantPlazas() && encontre == false) {
               
                   if (this.getMatriz()[i][j].getPatente().equals(pat)) {
                      encontre = true;
                      pi = i+1;
                      pa = j+1;
                    }
                   else 
                       j++;
                 
              
             }
            i++;
            }
        
            
         
        
        
        if (encontre == true)
            aux = aux + "El auto con patente: " + pat + " se encuentra en el piso " + pi +
                 " y en la plaza " + pa;
        else
            aux = aux + "No se encontro el auto de patente: " + pat;
        
        
            
            
   
     return aux;
    }
    
    @Override
    public String toString (){
         String aux = "";
         for (int i = 0; i< this.getCantPisos();i++) {
            
            for (int j = 0; j< this.getCantPlazas(); j++) {
            
                if (!this.getMatriz()[i][j].getPropietario().equals("Ninguno"))
                    aux = aux + "Piso: " + (i+1)+ " Plaza: " + (j+1) + this.getMatriz()[i][j].toString() + "\n";
                else aux = aux + "Piso: " + (i+1)+ " Plaza: " + (j+1) + " Libre " + "\n";
            }
                
            }
         return aux;
    }
    
    public int cantPlaza (int numPlaza){
        int total = 0;
        for (int i = 0; i <this.getCantPlazas(); i++) {
        if (this.getMatriz()[i][numPlaza - 1] != null)
            if (this.getMatriz()[i][numPlaza - 1].getPropietario() != null) {
                total = total + 1;
            }
        }
        return total;
        
    }
    
}


