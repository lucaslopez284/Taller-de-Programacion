
package tema5;


public class Evento extends Recital {
    public String motivo;
    public String contratante;
    public int dia;

    public Evento(String motivo, String contratante, int dia, String banda, int max) {
        super(banda, max);
        this.setMotivo(motivo);
        this.setContratante(contratante);
        this.setDia(dia);
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
    
    public void actuar(){
        if (this.getMotivo().equals("beneficencia")){
            System.out.println("Recuerden colaborar con " + this.getContratante());
        }
        else if (this.getMotivo().equals("TV")){
               System.out.println("Saludos amigos televidentes");
             }
             else if (this.getMotivo().equals("privado")){
                    System.out.println("Un feliz cumple para " + this.getContratante());
             }
                  else {
                    System.out.println("Motivo desconocido");
             }
        
        super.actuar();
    }

    @Override
    public double calcularCosto() {
        double aux = 999;
        if (this.getMotivo().equals("beneficencia"))
            aux = 0;
        else if (this.getMotivo().equals("TV"))
               aux = 50000;
             else if (this.getMotivo().equals("privado"))
                    aux = 150000;
        return aux;
    }
    
    
}
