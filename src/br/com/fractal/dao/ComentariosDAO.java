package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.fractal.model.Comentario;
import br.com.fractal.model.Tarefas;

public class ComentariosDAO {

	private final GenericDAO<Comentario> dao;

	public ComentariosDAO(EntityManager em) {
		dao = new GenericDAO<Comentario>(em, Comentario.class);
	}

	public void adiciona(Comentario t) {
		dao.adiciona(t);
	}

	public void remove(Comentario t) {
		dao.remove(t);
	}

	public void altera(Comentario t) {
		dao.altera(t);
	}

	public Comentario buscaPorId(Long id) {
		return dao.buscaPorId(id);
	}

	public List<Comentario> lista() {
		return dao.lista();
	}

	public void removeComentariosDaTarefa(Tarefas task) {
		dao.removeComentariosDaTarefa(task);
	}
	
//	public List<Comentario> buscaComentarioPorTarefa(Long id, Tarefas tarefa) {		
//		return dao.buscaComentarioPorTarefa(id, tarefa);
//	}

}
