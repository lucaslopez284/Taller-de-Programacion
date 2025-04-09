/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialuno;

/**
 *
 * @author lopez
 */
public class Tradicional extends Banco {
    private String direccion;
    private String localidad;
    private int CantDolares = 0;
    
    public Tradicional (String n, int e, int cm, String dir, String loc){
        super(n,e,cm);
        this.setDireccion(dir);
        this.setLocalidad(loc);
    }
        

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public int getCantDolares() {
        return CantDolares;
    }

    public void setCantDolares(int CantDolares) {
        this.CantDolares = CantDolares;
    }

    
    @Override
    public void agregarCuenta(Cuenta c) {
        if (this.getCantDolares()< 100){
            this.getRegistroCuentas()[this.getCantC()] = c;
            this.setCantC(this.getCantC() + 1);
            this.setCantDolares(this.getCantDolares()+1);
            System.out.println("Se agrego correctamente");
        }
        else System.out.println("No se pudo agregar la cuenta");       

    }
    
    @Override
    public boolean chequeo(Cuenta C){
        boolean aux = false;
        if (C.getMoneda().equals("dolares")){
            if (C.getMonto()> 500)
                aux = true;
            
        }
        else if (C.getMoneda().equals("pesos"))
            if (C.getMonto()> 70000)
                aux = true;
        return aux;
    }
    
     public String toString (){
         String aux = super.toString();
         aux = aux + " Direccion: " + this.getDireccion() + " Localidad: " + this.getLocalidad();
         return aux;
     }
    
}
