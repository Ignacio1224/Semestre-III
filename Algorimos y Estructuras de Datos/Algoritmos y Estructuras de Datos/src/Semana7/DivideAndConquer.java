package Semana7;

import java.util.Arrays;
import Utils.Utils;

public class DivideAndConquer {

	public static void main(String[] args) {
		
		int[] v = Utils.RandomArray(7, 0, 7);
		System.out.println(Arrays.toString(v) + " Suma de los multiplos de 7: " + mult7(v, 0, 6));
		System.out.println(Arrays.toString(v) + " Cantidad de ocurrencias de 6: " + cantOcurrencias(v, 0, 6, 6));
		System.out.println(Arrays.toString(v) + " Posicion del elemento 6: " + posElement(v, 0, 6, 6));
	}
	
	// Pre: from < to, from >=0
	private static int mult7 (int[] v, int from, int to) {
		if (from == to) {
			return (v[from] % 7 == 0) ? v[from] : 0;
		}
		
		int pivot = (from + to) / 2;
		
		int left = mult7(v, from, pivot);
		int right = mult7(v, pivot + 1, to);
		
		return left + right;
	}
	
	private static int cantOcurrencias (int[] v, int from, int to, int element) {
		if (from == to) {
			return (v[from] == element) ? 1 : 0;
		}
		
		int pivot = (from + to) / 2;
		
		int left = cantOcurrencias(v, from, pivot, element);
		int right = cantOcurrencias(v, pivot + 1, to, element);
		
		return left + right;
	}
	
	private static int posElement(int[] v, int from, int to, int element) {
		if (from == to) {
			return (v[from] == element) ? from : -1;
		}
		
		int pivot = (from + to) / 2;

		int right = posElement(v, pivot + 1, to, element);
		
		if (right != -1) {
			return right;
		} else {
			return posElement(v, from, pivot, element);	
		}
	}

}
