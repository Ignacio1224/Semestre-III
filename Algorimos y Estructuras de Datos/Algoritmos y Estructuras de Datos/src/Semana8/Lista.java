package Semana8;

import java.util.Iterator;

public class Lista<T> implements ILista<T> {

	private NodoLista<T> _inicio;
	private int _largo = 0;

	// Pre: La lista no es vacia, pos < largo de la lista
	public void insertarEnPos(T dato, int pos) {
		if (pos == 0) {
			_inicio = new NodoLista<T>(dato, _inicio); // Insertar principio.
		} else if (pos >= _largo) {
			insertarFin(dato);
		}else {

			NodoLista<T> aux = _inicio;
			while (pos > 1) {
				aux = aux.getSig();
				pos --;
			}

			aux.setSig(new NodoLista<T>(dato, aux.getSig()));

		}
		_largo ++;
	}
	
	@Override
	public void insertarFin(T dato) {
		if (_inicio == null) {
			insertarPrincipio(dato);
		} else {
			NodoLista<T> puntero_aux = _inicio;

			while (puntero_aux.getSig() != null) {
				puntero_aux = puntero_aux.getSig();
			}

			puntero_aux.setSig(new NodoLista<T>(dato));
		}

		_largo++;
	}
	
	@Override
	public void insertarPrincipio(T dato) {
		_inicio = new NodoLista<T>(dato, _inicio);
		_largo++;
	}

	@Override
	public void eliminarPrincipio() {
		_inicio = _inicio.getSig();
		_largo--;
	}

	@Override
	public void eliminarFin() {

		if (_inicio.getSig() == null) {
			eliminarPrincipio();
		} else {
			NodoLista<T> puntero_aux = _inicio;
			while (puntero_aux.getSig().getSig() != null) {
				puntero_aux = puntero_aux.getSig();
			}
			puntero_aux.setSig(null);
			_largo--;
		}
	}

	@Override
	public void mostrar() {
		NodoLista<T> puntero_aux = _inicio;

		while (puntero_aux != null) {
			System.out.println(puntero_aux.getDato());
			puntero_aux = puntero_aux.getSig();
		}
		System.out.println();

	}

	@Override
	public int largo() {
		return _largo;
	}
	
	public void eliminar(T dato) {
		if (_inicio.getDato().equals(dato)) {
			_inicio = _inicio.getSig();
		} else {
			NodoLista<T> aux = _inicio;
			while(aux.getSig().getDato() != dato) {
				aux = aux.getSig();
			}
			aux.setSig(aux.getSig().getSig());
		}
		_largo --;
	}

	
	@Override
	public void eliminarEnPos(int pos) {
		if (pos == 0) {
			_inicio = _inicio.getSig();
		} else {
			NodoLista<T> aux = _inicio;
			while(pos > 1) {
				aux = aux.getSig();
				pos --;
			}
			aux.setSig(aux.getSig().getSig());
		}
		_largo--;		
	}


	public void eliminarTodos(T dato) {
		while(_inicio != null && _inicio.getDato().equals(dato)) {
			_inicio = _inicio.getSig();
			_largo --;
		}
		
		if (_inicio != null) {
			NodoLista<T> aux = _inicio;
			
			while (aux.getSig() != null) {
				if (aux.getSig().getDato().equals(dato)) {
					aux.setSig(aux.getSig().getSig());
					_largo --;
				} else {
					aux = aux.getSig();
				}
			}
		}
	}
	
	@Override
	public boolean existe(T dato) {
		return existeRec(dato, _inicio);
		
		
//		NodoLista<T> aux = _inicio;
//		while (aux != null) {
//			if (dato == aux.getDato()) {
//				return true;
//			}
//			aux = aux.getSig();
//		}
//		return false;
	}

	private boolean existeRec(T dato, NodoLista<T> nodo) {
		if (nodo == null) {
			return false;
		}
		return nodo.getDato().equals(dato) || existeRec(dato, nodo.getSig());
	}

	
	@Override
	public Iterator<T> iterator() {
		return new Iterator<T>() {
			NodoLista<T> aux = _inicio;
			public boolean hasNext() {
				return aux != null;
			}
			
			public T next() {
				T ret = aux.getDato();
				aux = aux.getSig();
				return ret;
			}
		};
	}

	
}
