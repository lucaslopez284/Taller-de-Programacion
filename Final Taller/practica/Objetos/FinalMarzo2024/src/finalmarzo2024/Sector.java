/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalmarzo2024;

/**
 *
 * @author lopez
 */
public class Sector {
    private String nombre;
    private int max;
    private int cantPro = 0;
    private Producto [] productos;
    private int cantEmp = 0;
    private Trabajador jefe = null;
    private Trabajador [] empleados = new Trabajador [50];

    public Sector(String nombre, int max) {
        this.setNombre(nombre);
        this.setMax(max);
        this.productos = new Producto [max];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getMax() {
        return max;
    }

    private void setMax(int max) {
        this.max = max;
    }

    public int getCantPro() {
        return cantPro;
    }

    private void setCantPro(int cantPro) {
        this.cantPro = cantPro;
    }

    public Producto[] getProductos() {
        return productos;
    }

    public void setProductos(Producto[] productos) {
        this.productos = productos;
    }

    public int getCantEmp() {
        return cantEmp;
    }

    private void setCantEmp(int cantEmp) {
        this.cantEmp = cantEmp;
    }

    public Trabajador getJefe() {
        return jefe;
    }

    public void setJefe(Trabajador jefe) {
        this.jefe = jefe;
    }

    public Trabajador[] getEmpleados() {
        return empleados;
    }

    public void setEmpleados(Trabajador[] empleados) {
        this.empleados = empleados;
    }
    
    public void agregarEmpleado (Trabajador e, boolean esJefe){
        if (esJefe)
            this.setJefe(e);
        else {
            this.getEmpleados()[this.getCantEmp()] = e;
            this.setCantEmp(this.getCantEmp() + 1);
        }   
    }
    
    public void agregarProducto (Producto p){
        this.getProductos()[this.getCantPro()] = p;
        this.setCantPro(this.getCantPro() + 1);
    }
    
    public double costoTotal (int e){
        double aux = 0;
        for (int i = 0; i < this.getCantPro();i++){
            if (this.getProductos()[i].getEtapa() == e)
                aux += this.getProductos()[i].getCosto();
        }
        return aux;
    }
    
    public void cambiarEtapa (int cod, double p){
        boolean esta = false;
        int i = 0;
        while ((esta == false )&&(i < this.getCantPro())){
            if (this.getProductos()[i].getCod() == cod){
                this.getProductos()[i].cambiarEtapa(p);
                esta = true;
            }
        }
    }
    
    public double costoEtapa5 (){
        double aux = 0;
        for(int i = 0; i< this.getCantPro(); i++)
            aux += this.getProductos()[i].devolverCostoFinalizado();
        return aux;
    }
    
    public String toString(){
        String aux = "Nombre " + this.getNombre() + ", jefe ";
        if  (this.getJefe()!= null) 
            aux += this.getJefe().toString();
        else
            aux += " ---vacio---";
        aux+= "\n" + "Costo total de productos en etapa 5 " + this.costoEtapa5() + "\n";
        aux += "Listado de empleados con antiguedad mayor a 10 " + "\n";
        for(int i = 0; i< this.getCantEmp(); i++){
            if (this.getEmpleados()[i].getAntiguedad() > 10){
                aux += this.getEmpleados()[i].toString() + "\n";
            }
        }
        return aux;
    }
}
