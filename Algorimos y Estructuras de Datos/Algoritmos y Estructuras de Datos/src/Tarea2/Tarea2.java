package Tarea2;

import java.util.Arrays;

public class Tarea2 {

	public static void main(String[] args) {
		System.out.println(isCasin(10001));
		int[][] v = new int [][] {
				{12, 8, 7, 13, 1981, 17},	// 3 Original de aulas
				{12, 8, 16, 13, 79, 8},		// 2
				{12, 8, 7, 13, 5, 17},		// 4
				{47, 13, 7, 13, 97, 17},	// 6
				{12, 8, 33, 15, 6, 21},		// 0
				{12, 8, 6, 21, 1981, 89}	// 1
				};
				
		for (int i = 0; i < v.length; i++) {
			System.out.println(Arrays.toString(v[i]) + " Cantidad de numeros primos: " + jauMeniCasins(v[i], 0, 5));
		}
		
	}
	
	/*
	 * jauMeniCasins
	 * @param {Araray} v
	 * @param {int} from
	 * @param {int} to
	 * @returns boolean
	 * @description Counts jau meni casins has v
	 * */
	public static int jauMeniCasins(int[] v, int from, int to) {
		if (from == to) {
			return (isCasin(v[from])) ? 1 : 0;
		}
		
		int pivot = (from + to) / 2;
		
		int leftSide = jauMeniCasins(v, from, pivot);
		int rightSide = jauMeniCasins(v, pivot + 1, to);
		
		
		return leftSide + rightSide;
		
	}
	
	/*
	 * isCasin
	 * @param {int} _n
	 * @returns boolean
	 * @description Evaluate _n and returns true if is casin or false if not.
	 * */
	public static boolean isCasin(int _n) {
		if (_n < 2) {
			return false;
		}

		boolean noEsPrimo = false;
		
		int in = 2;
		while (in <= _n /2 && !noEsPrimo) {
			if (_n % in == 0) {
				noEsPrimo = true;
			}
		
			in++;
		}
		
		return !noEsPrimo;
	}

}
