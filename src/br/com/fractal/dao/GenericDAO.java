package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;

public class GenericDAO<T> {

	private final Class<T> classe;
	private final EntityManager em;

	public GenericDAO(EntityManager em, Class<T> classe) {
		this.em = em;
		this.classe = classe;
	}

	public void adiciona(T t) {
		this.em.persist(t);
	}

	public void remove(T t) {
		this.em.remove(t);
	}
	
	public void altera(T t) {
		// TODO implements this method
	}

	public T buscaPorId(Long id) {
		return this.em.find(classe, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> lista() {
		return this.em.createQuery("from " + classe.getName()).getResultList();
	}

}