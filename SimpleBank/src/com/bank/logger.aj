package com.bank;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {

	pointcut success() : call(* create*(..) );

	after() : success() {
		// Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un
		// usuario
		System.out.println("**** User created ****");
	}

	Calendar cal = Calendar.getInstance();
	String suceso = "";

	private void escribirLog(String suceso) {
		try (FileWriter logwriter = new FileWriter("src/data/log.txt", true)) {
			logwriter.write(suceso + System.lineSeparator());
		} catch (IOException ex) {
			System.out.println("Oops! Todos cometemos errores pero estamos trabajando en ello.");
		}
	}

	pointcut transaccion() : execution(* moneyMakeTransaction(..));

	after() : transaccion() {
		suceso = "DEPOSITO - " + cal.getTime();
		escribirLog(suceso);
		System.out.println("Se realizo el deposito");
	}

	pointcut retiro() : execution(* moneyWithdrawal(..));

	after() : retiro(){
		suceso = "RETIRO - " + cal.getTime();
		escribirLog(suceso);
		System.out.println("Se realizo el retiro.");
	}

}
