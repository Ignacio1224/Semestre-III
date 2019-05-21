package Semana8;

public interface ILista<T> extends Iterable<T> {
	
	public boolean existe(T dato);

	public void insertarEnPos(T dato, int pos);

	public void insertarFin(T dato);

	public void insertarPrincipio(T dato);
		
	public void eliminar(T dato);
	
	public void eliminarEnPos(int pos);
	
	public void eliminarFin();

	public void eliminarPrincipio();
	
	public void eliminarTodos(T dato);
	
	public void mostrar();
	
	public int largo();
	
}
