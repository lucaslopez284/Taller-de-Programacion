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
public class Digital extends Banco {
    private String web;
    
    public Digital (String n, int e, int cm, String w){
        super(n,e,cm);
        this.setWeb(w);
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

  
  
    @Override
    public boolean chequeo(Cuenta C) {
        boolean aux = false;
        if (C.getMoneda().equals("pesos") && C.getMonto()> 70000)
            aux = true;
        return aux;    
        
    }
    
    public String toString (){
        String aux = super.toString();
        
        aux = aux + " Web: " + this.getWeb() + "\n";
        
        return aux;
    }
    
}
    
    
   

    

   

    
    

