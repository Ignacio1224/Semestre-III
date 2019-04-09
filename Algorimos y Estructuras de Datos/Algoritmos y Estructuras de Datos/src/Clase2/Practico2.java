package Clase2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Practico2 {

	public static void main(String[] args) {
		// Ex 1
		// for (int i = 0; i < 100; i++) {
		// System.out.println("Es primo " + i + "? " + esPrimo(i));
		// }

		// Ex 2
		// System.out.println("Es primo " + 20 + "? " + primoSup(20));

		// Ex 4
		// dividir(14, 7);
		
		// Ex 5
		// mcd(33, 12);
		
		
		// Ex 8
		//	int[] v = randomV(1, 12, 6);
		//	System.out.println("Maximo: " + maximoDelVector(v, 0, v.length - 1) + " - vector: " + Arrays.toString(v));
		//	System.out.println("Pos max: " + maximoDelVectorPos(v, 0, v.length - 1));
		
		// Ex 9 QuickSort
		//	int[] vec = {4, 9, 12, 8, 6, 3};
		// System.out.println(Arrays.toString(vec));
		// System.out.println(cuickSort(vec).toString());
		
		// Ex 10
		int[] vec = {4, 9, 12, 8, 6, 3}; // Promedio 7.0
		System.out.println("Promedio: " + promedio(vec) + " - Array: " + Arrays.toString(vec));
		ej10b(vec, 0, vec.length-1);
		
		//Ex 11
		int[] vec1 = {4, 9, 12, 8, 6, 3};
		int[] vec2 = {8, 7, 5, 11, 2, 1};
		
		System.out.println(Arrays.toString(concat(vec1, vec2)));
	}

	public static boolean esPrimo(int _n) {
		if (_n < 2) {
			return false;
		}

		for (int i = 2; i <= _n / 2; i++) {
			if (_n % i == 0) {
				return false;
			}
		}
		return true;
	}

	public static int primoSup(int _n) {
		while (!esPrimo(++_n))
			;
		return _n;

//		while (!esPrimo(_n + 1))
//			_n++;
//		return _n + 1;

	}

	public static void dividir(int dividendo, int divisor) {

		int cociente = 0;
		while (dividendo >= divisor) {
			dividendo -= divisor;
			cociente++;
		}

		System.out.println("Cociente: " + cociente + " Resto: " + dividendo);
	}

	public static void mcd(int a, int b) {
		int aux;

		while (a % b != 0) {
			aux = a;
			a = b;
			b = aux % b;
		}

		System.out.println(b);

	}
	
	private static int[] randomV (int min, int max, int n) {
		int[] ret = new int[n];
		for (int i = 0; i < n; i++) {
			ret[i] = ((int)(Math.random()*(max - min + 1))) + min;
		}
		return ret;
	}
	
	// Pre: desde >=0 && hasta < v.length && desde <= hasta
	private static int maximoDelVector(int[] v, int desde, int hasta) {
		int max = Integer.MIN_VALUE;
		for (int i = desde; i < hasta; i++) {
			if (v[i] >= max) { // la ultima ocurrencia con el =
				max = v[i];
			}
		}
		return max;
	}
	
	private static int maximoDelVectorPos(int[] v, int desde, int hasta) {
		int maxpos = desde;
		for (int i = desde + 1; i < hasta; i++) {
			if (v[i] >= v[maxpos]) { // la ultima ocurrencia con el =
				maxpos = i;
			}
		}
		return maxpos;
	}
	
	static int iterations = 0;
	private static ArrayList cuickSort(int[] arr) {
		
		++iterations;
		ArrayList pivot = new ArrayList();
		pivot.add(arr[0]);
		ArrayList left = new ArrayList();
		ArrayList right = new ArrayList();
		
		int i = 1, len = arr.length;
		
		for (i = 1; i < len; i++) {
			if ((int)pivot.get(0) < arr[i]){
				right.add(arr[i]);
			} else {
				left.add(arr[i]);
			}
		}
		
//		System.out.println("Gen: " + iterations + " + Left: " + left + " Pivot: " + pivot + " Right: " + right);
		
		if (left.size() > 1) {
			left = cuickSort(convertIntegers(left));
		}
		
		if (right.size() > 1){
			right = cuickSort(convertIntegers(right));
		}

		left.addAll(pivot);
		left.addAll(right);
		
		return left;
	}
	
	public static int[] convertIntegers(List<Integer> integers)
	{
	    int[] ret = new int[integers.size()];
	    for (int i=0; i < ret.length; i++)
	    {
	        ret[i] = integers.get(i).intValue();
	    }
	    return ret;
	}

	public static double promedio(int[] arr) {
		double promedio = 0.0;
		
		for (int i = 0; i < arr.length; i++) {
			promedio += arr[i];
		}
		
		return promedio / arr.length;
	}

	public static void ej10b(int[] v, int desde, int hasta) {
		int cantVeces = 1, min = v[desde], posMin = desde;
		
		for (int i = desde +1; i<= hasta; i++) {
			if (v[i] < min) {
				cantVeces = 1;
				min = v[i];
				posMin = i;
			} else if (v[i] == min) {
				cantVeces++;
			}
		}
		System.out.println(Arrays.toString(v) + " - Min: " + min + " - canVeces: " + cantVeces + " - Pos: " + posMin);
	}
	
	public static int[] concat(int[] arr1, int[] arr2) {
		List res = new ArrayList();
		
		int i = 0;
		boolean end1 = false;
		boolean end2 = false;
		
		while(!(end1 || end2)) {
			if (i< arr1.length) {
				res.add(arr1[i]);
			} else {
				end1 = true;
			}
			
			if (i< arr2.length) {
				res.add(arr2[i]);
			} else {
				end2 = true;
			}
			
			i++;
		}
		
		return convertIntegers(cuickSort(convertIntegers(res)));
	}


}

