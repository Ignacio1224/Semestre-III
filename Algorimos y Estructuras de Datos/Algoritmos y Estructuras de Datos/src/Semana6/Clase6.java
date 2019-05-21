package Semana6;

public class Clase6 {

	public static void main(String[] args) {
		
		int [] v = new int [] {1, 2, 3, 0, -5, 6};
		
		System.out.println("Min 1: " + min1(v, 0, 5));
		System.out.println("Min 2: " + min2(v, 0, 5));
		System.out.println("Pos Min: " + pos_min(v, 0, 5));
	
		System.out.println("Practico 4, Ej 8: " + x(2, 5));
	}
	
	// Partition of vector at half and compare recursively both parts
	private static int min1(int [] v, int from, int to) {
		if (from == to) {
			return v[from];
		}
		
		int pivot = (from + to) / 2;
		
		int left = min1(v, from, pivot);
		int right = min1(v, pivot + 1, to);
		
		return left <= right ? left : right;
	}
	
	// Partition of vector in two, first element and the other side is the rest
	private static int min2(int [] v, int from, int to) {
		if (from == to) {
			return v[from];
		}
		
	
		int left = v[from];
		int right = min2(v, from + 1, to);
		
		return left <= right ? left : right;
	}
	
	// Partition of vector at half and compare recursively both parts
	private static int pos_min(int [] v, int from, int to) {
			if (from == to) {
				return from;
			}
			
			int pivot = (from + to) / 2;
			
			int pos_left = pos_min(v, from, pivot);
			int pos_right = pos_min(v, pivot + 1, to);
			
			return v[pos_left] < v[pos_right] ? pos_left : pos_right;
		}

	// Ejercicio 8 Practico 4
	private static int x(int n, int k) {
		int x1, x2;
		if (n < 1) {
			return k;
		}
		
		x1 = x(n-1, k);
		x2 = x(n-1, k);
		
		return x1 + x2;
	}


	

}
