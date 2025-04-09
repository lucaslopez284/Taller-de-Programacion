
package tema5;

public class Fecha {
    public String ciudad;
    public int dia;

    public Fecha(String ciudad, int dia) {
        this.setCiudad(ciudad);
        this.setDia(dia);
    }
    
    

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    
}
