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
public abstract class Subsidio {
     private String Investigador;
     private String planDeTrabajo;
     private Fecha fec;

    public Subsidio(String Investigador, String planDeTrabajo, Fecha fec) {
        this.Investigador = Investigador;
        this.planDeTrabajo = planDeTrabajo;
        this.fec = fec;
    }

    public String getInvestigador() {
        return Investigador;
    }

    public void setInvestigador(String Investigador) {
        this.Investigador = Investigador;
    }

    public String getPlanDeTrabajo() {
        return planDeTrabajo;
    }

    public void setPlanDeTrabajo(String planDeTrabajo) {
        this.planDeTrabajo = planDeTrabajo;
    }

    public Fecha getFec() {
        return fec;
    }

    public void setFec(Fecha fec) {
        this.fec = fec;
    }
    public abstract double getMontoTotal();
    @Override
    public String toString() {
        return "Investigador: " + this.getInvestigador() + ", plan de trabajo: " + this.getPlanDeTrabajo() +
                ", fecha: " + this.getFec().toString()+ " monto total: " + this.getMontoTotal();
    }
    
    
     
     
    
}
