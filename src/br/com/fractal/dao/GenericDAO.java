package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.fractal.model.Comentario;

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
		this.em.merge(t);
	}

	public T buscaPorId(Long id) {
		return this.em.find(classe, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> lista() {
		return this.em.createQuery("from " + classe.getName()).getResultList();
	}

	// TODO: isso fica no GenericDAO mesmo? melhor no Comentario.
	@SuppressWarnings("unchecked")
	public List<Comentario> buscaComentarioPorTarefa(Long id) {

		String jpql = "select c from Comentario c where c.tarefas_id = :tarefas_id";

		Query query =this.em.createQuery(jpql);
		query.setParameter("tarefas_id", 1);

		return query.getResultList();
	}

}