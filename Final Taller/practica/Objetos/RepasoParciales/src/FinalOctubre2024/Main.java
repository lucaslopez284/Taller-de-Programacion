
package FinalOctubre2024;


public class Main {
    public static void main(String[] args) {
        Hospital h = new Hospital ("Curando", "Quirno 70");
        Paciente p1 = new Paciente ("46739642", "Lucas", "SomosTuSalud");
        Paciente p2 = new Paciente ("45739642", "Catalina", "PorMasVida");
        Paciente p3 = new Paciente ("44739642", "Lautaro", "SomosTuSalud");
        Paciente p4 = new Paciente ("43739642", "Malena", "PorMasVida");
        Paciente p5 = new Paciente ("42739642", "Ezequiel", "Sanara");
        Paciente p6 = new Paciente ("44444444", "Dylan", "Gissi");
        
        h.ingresarPaciente(p1, 1, 1);
        h.ingresarPaciente(p2, 3, 1);
        h.ingresarPaciente(p3, 5, 1);
        h.ingresarPaciente(p4, 7, 1);
        h.ingresarPaciente(p5, 9, 1);
        h.darDeAlta("46739642");
         
        System.out.println(h.cantidad());
        
         
    }
}
