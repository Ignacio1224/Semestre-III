package Semana8;

public class Main {

	public static void main(String[] args) {
		
		Lista<Integer> n = new Lista<Integer>();
		
		for (int i = 6; i > 0; i--) {
			n.insertarPrincipio(i);
		}
		
//		n.mostrar();
//		
//		System.out.println("Largo: " + n.largo());
//		
//		n.insertarFin(7);
		
//		n.eliminarPrincipio();
//		n.eliminarFin();
//		n.mostrar();
//		System.out.println("Largo: " + n.largo());
		
		
		for(Integer i : n) {
			System.out.println(i);
		}
		
		System.out.println("Insertado");
		n.insertarEnPos(1891, 0); // OK
//		n.insertarEnPos(1891, 1); // OK
//		n.insertarEnPos(1891, 3); // OK
//		n.insertarEnPos(1891, 5); // OK
//		n.insertarEnPos(1891, 6); // OK
//		n.insertarEnPos(1891, 7); // OK
//		n.insertarEnPos(1891, 9); // OK
		
		
		for(Integer i : n) {
			System.out.println(i);
		}
		
		System.out.println("Largo: " + n.largo());
	}

}
