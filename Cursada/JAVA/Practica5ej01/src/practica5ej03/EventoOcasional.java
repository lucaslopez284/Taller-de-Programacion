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
public class EventoOcasional extends Recital {
    private String motivo;
    private String contratante;
    private int dia;
    
    
    public EventoOcasional (String unaBanda, int max, int numMotivo, String unContratante, int unDia ){
        super(unaBanda,max);
        this.setMotivo(this.getMotivos()[numMotivo - 1]);
        this.setContratante(unContratante);
        this.setDia(unDia);
        
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public void Actuar () {
        String aux="";
        if (this.getMotivo().equals(" a beneficio "))
            aux = aux + "Recuerden colaborar con " + this.getContratante();
        else if (this.getMotivo().equals(" show TV "))
            aux = aux + "Saludos amigos televidentes";
             else if (this.getMotivo().equals(" show privado "))
                 aux = aux + "Un felix cumple para " + this.getContratante();
        
        System.out.println(aux);
        super.Actuar();
    }

    @Override
    public double calcularCosto() {
       double aux = -1;
       if (this.getMotivo().equals(" a beneficio "))
            aux = 0;
        else if (this.getMotivo().equals(" show TV "))
            aux = 50000;
             else if (this.getMotivo().equals(" show privado "))
                 aux = 150000;
       
       return aux;
        
    }
}
