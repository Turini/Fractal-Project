package br.com.fractal.test;

import java.util.Calendar;

import javax.persistence.EntityManager;

import br.com.fractal.dao.TarefasDAO;
import br.com.fractal.infra.JPAUtil;
import br.com.fractal.model.Tarefas;
import br.com.fractal.model.enums.Estado;

public class TestaDAOS {

	public static void main(String[] args) {
		
		EntityManager em = new JPAUtil().getEntityManager();
		em.getTransaction().begin();
		
		TarefasDAO tarefasDAO = new TarefasDAO(em);
		
		Tarefas tarefas = new Tarefas();
		tarefas.setNome("Test Taks");
		tarefas.setEstado(Estado.DONE);
		tarefas.setPrazo(1);
		tarefas.setDestinario("Rodrigo");
		tarefas.setDescricao("descricao");
		tarefas.setDataInicio(Calendar.getInstance());
		tarefas.setDataTermino(Calendar.getInstance());
		
		tarefasDAO.adiciona(tarefas);
//		tarefasDAO.remove(tarefas);
		
		em.getTransaction().commit();
		em.close();
		
	}
}
