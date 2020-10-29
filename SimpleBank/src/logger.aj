import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

import com.bank.Bank;

aspect Logger {
	  pointcut success() : call(* create*(..) );
	    after() : success() {
	    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
	    	System.out.println("**** User created ****");
	    }
}
