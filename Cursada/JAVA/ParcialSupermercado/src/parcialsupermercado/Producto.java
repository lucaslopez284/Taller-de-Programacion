/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialsupermercado;

/**
 *
 * @author lopez
 */
public class Producto {
    private int codigo;
    private String nombre;
    private String marca;
    private int cantUni;
    private double precioUnidad;
    
    public Producto (int c, String n, String m, int cu, double pu){
        this.setCodigo(c);
        this.setNombre(n);
        this.setMarca(m);
        this.setCantUni(cu);
        this.setPrecioUnidad(pu);
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getCantUni() {
        return cantUni;
    }

    public void setCantUni(int cantUni) {
        this.cantUni = cantUni;
    }

    public double getPrecioUnidad() {
        return precioUnidad;
    }

    public void setPrecioUnidad(double precioUnidad) {
        this.precioUnidad = precioUnidad;
    }
    
    public String toString (){
        String aux = " Codigo: " + this.getCodigo() + " nombre: " + this.getNombre() + " cantidad de unidades: " +
                      this.getCantUni() + " precio por unidad: " + this.getPrecioUnidad() + "\n";
        return aux;
    }
    
    
}
