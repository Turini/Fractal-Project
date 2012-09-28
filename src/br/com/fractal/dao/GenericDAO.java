package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.fractal.model.Comentario;
import br.com.fractal.model.Projeto;
import br.com.fractal.model.Tarefas;
import br.com.fractal.model.Usuarios;

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
		return this.em.createQuery(jpql).setParameter("id", id).getResultList();		
	}

	public void associaUsuarioEmProjeto(Long usuarioId, Long projetoId) {
		String query = "insert into Usuarios_Projeto values(:usuarioId, :projetoId)";
		this.em.createNativeQuery(query).setParameter("usuarioId", usuarioId).setParameter("projetoId", projetoId).executeUpdate();
	}

	public void removeComentariosDaTarefa(Tarefas task) {
		String jpql = "delete from Comentario where tarefas_id = :taskId";
		this.em.createNativeQuery(jpql).setParameter("taskId", task.getId()).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Object> listCountOfTasksByStatusOfAllProjects() {
		String query = "select estado, count(*) from Tarefas group by estado";
		return this.em.createNativeQuery(query).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Object> listUsersByProject() {
		String query = "select u.id, u.email, u.login, u.telefone, up.projetos_id from Usuarios_Projeto as up left join Usuarios as u on u.id = up.usuarios_id";
		return this.em.createNativeQuery(query).getResultList();
	}

	public void removeFromProject(long id, long pid) {
		String query = "delete from Usuarios_Projeto where Usuarios_id = :id and projetos_id = :pid";
		this.em.createNativeQuery(query).setParameter("id", id).setParameter("pid", pid).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Usuarios> listBylogin(String login) {
		String query = "from "+ classe.getName()+ " where login like '%"+login+"%'";
		return this.em.createQuery(query).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Projeto> listByName(String name) {
		String query = "from "+ classe.getName()+ " where nome like '%"+name+"%'";
		return this.em.createQuery(query).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Object> listCountOfTasksByStatus(String projectId) {
		String query = "select estado, count(*) from Tarefas where projeto_id = :projeto_id group by estado;";
		return this.em.createNativeQuery(query).setParameter("projeto_id", projectId).getResultList();
	}

}