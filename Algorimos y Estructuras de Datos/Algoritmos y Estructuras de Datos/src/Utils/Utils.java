package Utils;

public class Utils {
	public static int[] RandomArray(int size, int min, int max) {
		int [] ra = new int[size];
		for (int i = 0; i < size; i++) {
			ra[i] = ((int)(Math.random()*(max - min + 1))) + min;
		}
		return ra;
	}
}
