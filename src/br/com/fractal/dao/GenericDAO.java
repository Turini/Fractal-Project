package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.fractal.model.Comentario;
import br.com.fractal.model.Projeto;
import br.com.fractal.model.Tarefas;

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
	public List<Comentario> buscaComentarioPorTarefa(Tarefas tarefa) {

		String jpql = "select c from Comentario c where c.tarefas = :tarefa";

		Query query =this.em.createQuery(jpql);
		query.setParameter("tarefa", tarefa);

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Tarefas> listaPorProjeto(Long id) {
	
		String jpql = "select t from Tarefas t where t.projeto_id = :projeto_id";
		
		Query query = this.em.createQuery(jpql);
		query.setParameter("projeto_id", id);
		
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Projeto> listaProjetosDoUsuario(Long id) {
		String jpql = "select u.projetos from Usuarios u where u.id= :id";
		
		Query query = this.em.createQuery(jpql);
		query.setParameter("id", id);
		
		return query.getResultList();		
	}

	public void associaUsuarioEmProjeto(Long usuarioId, Long projetoId) {
		String query = "insert into Usuarios_Projeto values(:usuarioId, :projetoId)";
		this.em.createNativeQuery(query).setParameter("usuarioId", usuarioId).setParameter("projetoId", projetoId).executeUpdate();
	}

}