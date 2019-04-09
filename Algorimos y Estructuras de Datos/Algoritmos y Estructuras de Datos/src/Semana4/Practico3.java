package Semana4;

public class Practico3 {

	public static void main(String[] args) {

		// Ex 1
		//e1();
		
		// Ex 2
		//e2();
		
		// Ex 4
		e4();
	}

	private static void e1() {
		// a
		String[][] personas = { 
				{ "Juan Rodriguez", "Martin Ocampo" }, 
				{ "Maria Perez", 	"Ignacio Castillo" },
				{ "Carla Gomez", 	"Ana Romero" }
				};

		// b
		showMatrix(personas);
	}

	
	private static void e2() {
		Integer[][] tresporcuatroA = {
				{1, 1, 1},
				{2, 2, 2},
				{3, 3, 3},
				{4, 4, 4}
		};
		
		Integer[][] tresporcuatroB = {
				{2, 2, 2},
				{3, 3, 3},
				{4, 4, 4},
				{5, 5, 5}
		};
		
		Integer[][] cincoporcuatroA = {
				{1, 1, 1, 1, 1},
				{2, 2, 2, 2, 2},
				{3, 3, 3, 3, 3},
				{4, 4, 4, 4, 4}
		};
		
		Integer[][] cincoporcuatroB = {
				{2, 2, 2, 2, 2},
				{3, 3, 3, 3, 3},
				{4, 4, 4, 4, 4},
				{5, 5, 5, 5, 5}
		};
		
		Integer[][] cuatroporcuatroA = {
				{1, 1, 1, 1},
				{2, 2, 2, 2},
				{3, 3, 3, 3},
				{4, 4, 4, 4}
		};
		
		Integer[][] cuatroporcuatroB = {
				{2, 2, 2, 2},
				{3, 3, 3, 3},
				{4, 4, 4, 4},
				{5, 5, 5, 5}
		};
		
		Integer[][] suma1 = new Integer[3][4];
		suma1 = opMatrix(tresporcuatroA, tresporcuatroB, 1);
		
		Integer[][] resta1 = new Integer[3][4];
		resta1 = opMatrix(tresporcuatroA, tresporcuatroB, -1);
		
		Integer[][] suma2 = new Integer[5][4];
		suma2 = opMatrix(cincoporcuatroA, cincoporcuatroB, 1);
		
		Integer[][] resta2 = new Integer[5][4];
		resta2 = opMatrix(cincoporcuatroA, cincoporcuatroB, -1);
		
		Integer[][] suma3 = new Integer[4][4];
		suma3 = opMatrix(cuatroporcuatroA, cuatroporcuatroB, 1);
		
		Integer[][] resta3 = new Integer[4][4];
		resta3 = opMatrix(cuatroporcuatroA, cuatroporcuatroB, -1);
		
		
		System.out.println("SUMA 3X4");
		showMatrix(suma1);
		System.out.println("RESTA 3X4");
		showMatrix(resta1);
		
		System.out.println("SUMA 5X4");
		showMatrix(suma2);
		System.out.println("RESTA 5X4");
		showMatrix(resta2);
		
		System.out.println("SUMA 4X4");
		showMatrix(suma3);
		System.out.println("RESTA 4X4");
		showMatrix(resta3);
	}
	
	
	private static void e4() {
		Integer[][] mat = new Integer[][] {
			{1, 2, 0},
			{2, 6, 3}
		};
		
		extValueMatrix(mat, 2, 3, 1); // 1 --> Max Value; -1 --> Min Value
		
	}
	
	
	private static Integer [][] opMatrix(Integer[][] m, Integer[][] b, int signo) {
		Integer[][] sum = new Integer[m.length][m[0].length];
		
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[i].length; j++) {
				sum[i][j] =  m[i][j] + signo * b[i][j];
			}
		}
		
		return sum;
	}


	
	private static <T> void showMatrix(T[][] m) {
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[i].length-1; j++) {
				System.out.print(String.format( (j == 0) ? "%3s" : "%5s", m[i][j]) + String.format("%5s", "|"));
			}
			System.out.println(String.format("%5s", m[i][m[i].length -1]));
		}
	}


	
	private static void extValueMatrix(Integer[][] m, int rows, int cols, int op) {
		int val = (op == -1) ? m[rows-1][cols-1] : m[0][0];
		int posX = rows -1;
		int posY = cols -1;
		
		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < cols; j++) {
				
				if (op == 1 && m[i][j] >= val) {
					val = m[i][j];
					posX = i;
					posY = j;
				} else if(m[i][j] <= val) {
					val = m[i][j];
					posX = i;
					posY = j;
				}
				
			}
		}
		
		System.out.println(((op == -1) ? "Minimo" : "Maximo") + " valor: " + val + "\nPosicion: [" + posX + ", " + posY + "]; indizada en 0");
	}
}
