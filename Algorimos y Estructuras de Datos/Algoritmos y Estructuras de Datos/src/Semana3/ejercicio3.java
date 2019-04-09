package Semana3;

public class ejercicio3 {

	public static void main(String[] args) {
		int[][] suparr = new int[][] { /* 0 */{ 1, 0, 2, 1, 8, 3, 5, 1, 9, 4, 12, 10 }, // true true
				/* 1 */{ 8, 7, 9, 4, 6, 3, 11, 2, 5, 0, 12, 10 }, // true o true
				/* 2 */{ 2, 5, 1, 3, 9, 4, 5, 5, 4, 9, 4, 2 }, // false o false
				/* 3 */{ 8, 9, 4, 5, 3, 6, 1, 12, 9, 10, 2, 7 }, // false o true
				/* 4 */{ 2, 1, 3, 0, 5, 4, 9, 7, 10, 9, 11, 12 }, // false o false
				/* 5 */{ 2, 1, 3, 0, 5, 4, 9, 7, 10, 6, 11, 8 }, // true o true
				/* 6 */{ 2, 2 }, // false o false
				/* 7 */{ 1, 2 }, // false o true
				/* 8 */{ 2, 1 }, // true o true
				/* 9 */{ 2, 1, 1 }, // false o false
				/* 10 */{ 11, 1, 0 }, // false o false
				/* 11 */{ 1, 1, 2 }, // false o false
				/* 12 */{ 1, 0, 2, 0 }, // true o true
				/* 13 */{ 1, 0, 2, 4, 1 }, // false o false
				/* 14 */{ 0, 1, 0, 0, 6 }, // false o false
				/* 15 */{ 1, 1, 2, 1, 0 }, // false o false
				/* 16 */{ 1, 0, 2, 2, 3 }, // false o false
				/* 17 */{ 0, 0, 2, 0, 0 }, // false o false
		};

		for (int i = 0; i < suparr.length; i++) {
			String s = "[";
			int sec_len = suparr[i].length;
			for (int j = 0; j < sec_len; j++) {
				s += suparr[i][j] + "";
				if (j < sec_len - 1) {
					s += ", ";
				} else {
					s += "]\t --> ";
				}
			}
			if (i >= 0)
				System.out.println(i + "] \t" + s + zig_zag(suparr[i], 0, sec_len));

		}

		// Datos de ejemplo de aulas
		int[] a = { 1, 4, 2, 5, 3, 7, 1, 8, 2, 9, 3 }; // false o true
		int[] b = { 1, 4, 1 }; // false o true
		int[] c = { 1, 4, 4 }; // false o false
		int[] d = { 1, 4, 7 }; // false o false
		System.out.println(zig_zag(a, 0, 10));
		System.out.println(zig_zag(b, 0, 2));
		System.out.println(zig_zag(c, 0, 2));
		System.out.println(zig_zag(d, 0, 2));

	}

	// Pre: from >= 0 && from <= to && to <= v.lenght
	private static boolean zig_zag(int[] v, int from, int to) {

		if (from == to) {
			return false;
		}

		boolean result = false;
		
// Opcion 2
// boolean result = false, upper = v[from] < v[++from];

		while (!result && from < to) {
			result = (from % 2 == 0) ? (from + 1 < to) ? !(v[from] > v[from + 1]) : !(v[from] > v[from - 1])
					: !(v[from] < v[from - 1]);

// Opcion 2
//			result = (upper && from % 2 == 0 && from + 1 < to) ? v[from] >= v[from + 1]
//				: (from % 2 == 0 && from + 1 < to) ? v[from] <= v[from + 1]
//						: (from % 2 == 1) ? upper ? !(v[from] > v[from - 1]) : !(v[from] < v[from - 1])
//								: upper ? v[from] >= v[from - 1] : v[from] <= v[from - 1];				

			from++;
		}

		return !result;
	}
}

//Desarrollo de la variable result

// |
// |
// V

//if (from % 2 == 0) {				 
//	if (from + 1 < to) {
//		result = !(v[from] > v[from + 1]);
//	
//	} else if (from -1 > 0) {
//		result = !(v[from] > v[from - 1]);
//	}
//	
// } else {
//		result = !(v[from] < v[from - 1]);
// }

// OPCION 2, No importa el patron, es decir da lo mismo [mayor, menor, mayor...] o [menor, mayor, menor...]

// if (upper && from % 2 == 0 && from + 1 < to) {
// res = v[from] >= v[from + 1];
// } else if (from % 2 == 0 && from + 1 < to) {
// res = v[from] <= v[from + 1];
// } else if (from % 2 == 1) {
// res = upper ? ! (v[from] > v[from - 1]) : ! (v[from] < v[from - 1]);
// } else {
// res = upper ? v[from] >= v[from - 1] : v[from] <= v[from - 1];
// }

// |
// |
// |
// V

// if (upper) {
// if (from % 2 == 0) {
// if (from + 1 < to) {
// res = v[from] >= v[from + 1];
// } else {
// res = v[from] >= v[from - 1];
// }
// } else {
// res = ! (v[from] > v[from - 1]);
// }
// } else {
// if (from % 2 == 0) {
// if (from + 1 < to) {
// res = v[from] <= v[from + 1];
// } else {
// res = v[from] <= v[from - 1];
// }
// } else {
// res = ! (v[from] < v[from - 1]);
// }
// }
