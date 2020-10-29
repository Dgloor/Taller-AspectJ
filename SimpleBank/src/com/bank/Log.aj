package com.bank;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {
    Calendar cal = Calendar.getInstance();
    String suceso = "";
	
	private void escribirLog(String suceso) {
        try(FileWriter logwriter= new FileWriter("src/data/log.txt",true)){
        	logwriter.write(suceso + System.lineSeparator());
        } catch (IOException ex) {
            System.out.println("Oops! Todos cometemos errores pero estamos trabajando en ello.");
        }
	}
    
    pointcut transaccion() : execution(* moneyMakeTransaction(..));
    after() : transaccion() {
    	suceso= "DEPOSITO - " + cal.getTime();
    	escribirLog(suceso);
    	System.out.println("Se realizó la transacción");

    }
    
    before() : transaccion(){
    	System.out.println("Has seleccionado hacer una transacción. Ingresa lo siguiente ");
    }

}
