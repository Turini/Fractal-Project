package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.fractal.model.Comentario;
import br.com.fractal.model.Tarefas;

public class TarefasDAO {

private final GenericDAO<Tarefas> dao;
	
	public TarefasDAO(EntityManager em) {
		dao = new GenericDAO<Tarefas>(em,Tarefas.class);
	}

	public void adiciona(Tarefas t) {
		dao.adiciona(t);
	}

	public void remove(Tarefas t) {
		dao.remove(t);
	}

	public void altera(Tarefas t) {
		dao.altera(t);
	}

	public Tarefas buscaPorId(Long id) {
		return dao.buscaPorId(id);
	}

	public List<Tarefas> lista() {
		return dao.lista();
	}

	public List<Comentario> buscaComentarioPorTarefa(Tarefas tarefa) {		
		return dao.buscaComentarioPorTarefa(tarefa);
	}

	public List<Tarefas> listaPorProjeto(Long id) {
		return dao.listaPorProjeto(id);
	}

	public List<Object> listCountOfTasksAndStatusByProject() {
		return dao.listCountOfTasksAndStatusByProject();
	}

}
