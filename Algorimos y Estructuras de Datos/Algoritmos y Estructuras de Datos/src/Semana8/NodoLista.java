package Semana8;

public class NodoLista<T> {

	private T _dato;
	private NodoLista<T> _sig;
	
	
	public NodoLista (T dato, NodoLista<T> sig) {
		this._dato = dato;
		this._sig = sig;
	}
	
	public NodoLista (T dato) {
		this._dato = dato;
	}

	public T getDato() {
		return _dato;
	}

	public NodoLista<T> getSig() {
		return _sig;
	}
	public void setSig(NodoLista<T> sig) {
		_sig = sig;
	}
	
}
