package Semana5;

public class Recursividad {

	public static void main(String[] args) {
		
		/* Circular function, StackOverflowException */
		// circular();
		
		/* Factorial */
		System.out.println("\n------------------Factorial------------------");
		double factorr = 4.0;
		System.out.println(factorr + "! = " + factorial(factorr));
		
		/* Potencia */
		System.out.println("\n------------------Potencia------------------");
		System.out.println("0^0 = " + pow(0, 0));
		System.out.println("2^3 = " + pow(2, 3));
		System.out.println("0^1 = " + pow(0, 1));
		System.out.println("12^0 = " + pow(12, 0));
		System.out.println("4^-3 = " + pow(4, -3));
		
		/* Listar 1 a 10 */
		System.out.println("\n----------------Listar 1 a 10----------------");
		listar1(10);
		
		/* Listar 1 a 10 */
		System.out.println("\n\n----------------Listar 10 a 1----------------");
		listar2(10);
		
	}
	
	private static void circular() {
		circular();
	}
	
	private static double factorial(double f) {
		return (f <= 2 ) ? f : f * factorial(f -1);
	}
	
	private static double pow (double b, double e) {
		return (e == 0) ? 1d : (e < 0) ? 1 / pow(b, -e) : b * pow(b, e -1);
	}

	private static void listar1(int i) {
		if (i != 0) {
			listar1(i -1);
			System.out.print(i + " ");
		}
	}
	
	private static void listar2(int i) {
		if (i != 0) {
			System.out.print(i + " ");
			listar2(i -1);
		}
	}

}
