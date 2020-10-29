import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect log {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    String suceso = "";
	
	private void escribirLog(String suceso) {
		// Codigo para escribir en el archivo log
		FileWriter writer = null;
        try {
            String ruta = "log.txt"; //ruta del archivo que se va a leer
            writer = new FileWriter(ruta, true);
            writer.write(suceso + System.lineSeparator());
            writer.close();
        } catch (IOException ex) {
            System.out.println("Wrong!");
        } finally {
            try {
                writer.close();
            } catch (IOException ex) {
            	System.out.println("Wrong!");
            }
        }
		System.out.println(suceso);
	}
	pointcut deposito(): execution(* moneyMakeTransaction(..));
	pointcut retiro(): execution(* moneyWithdrawal(..));
	
	after() : deposito() {
		suceso = "DEPOSITO - " + cal.getTime();
		escribirLog(suceso);
	}
	
	after() : retiro() {
		suceso = "RETIRO - " + cal.getTime();
		escribirLog(suceso);
	}
}