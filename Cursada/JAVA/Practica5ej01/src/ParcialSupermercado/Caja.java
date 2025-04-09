/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialSupermercado;

/**
 *
 * @author lopez
 */
public class Caja { 
    private String cajero;
    private int maxTickets;
    private int cantActualT = 0;
    private Ticket [] registroT;
    
    public Caja (String nombreC, int cant){
        this.setCajero(nombreC);
        this.setMaxTickets(cant);
        this.registroT = new Ticket [cant];
        
        
    }
    
    public String getCajero() {
        return cajero;
    }

    public void setCajero(String cajero) {
        this.cajero = cajero;
    }

    public int getMaxTickets() {
        return maxTickets;
    }

    public void setMaxTickets(int maxTickets) {
        this.maxTickets = maxTickets;
    }

    public int getCantActualT() {
        return cantActualT;
    }

    public void setCantActualT(int cantActualT) {
        this.cantActualT = cantActualT;
    }

    public Ticket[] getRegistroT() {
        return registroT;
    }

    public void setRegistroT(Ticket[] registroT) {
        this.registroT = registroT;
    }
    
    public void agregarTicket (Ticket unTicket){
        if (this.getCantActualT()< this.getMaxTickets()) {
            this.getRegistroT()[this.getCantActualT()] = unTicket;
            this.setCantActualT(this.getCantActualT()+1);
            System.out.println("Se pudo agregar el ticket");
        }
        else System.out.println("Ya se alcanzo la cantidad maxima de tickets");
    }
    
    public int contadorCredito(){
        int aux = 0;
        for (int i = 0; i < this.getCantActualT(); i++){
            if (this.getRegistroT()[i].getMedioPago().equals("credito"))
                aux++;
        }
        return aux;
    }
    
    
    @Override
    public String toString () {
        String aux = " Cajero: " + this.getCajero() + " Tickets emitidos: " + "\n";
        for (int i = 0; i < this.getCantActualT(); i++){
           aux = aux + this.getRegistroT()[i].toString();
        }
        return aux;
    }
}
