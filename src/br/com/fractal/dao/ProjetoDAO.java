package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.fractal.model.Projeto;

public class ProjetoDAO {

	private final GenericDAO<Projeto> dao;
	
	public ProjetoDAO(EntityManager em) {
		dao = new GenericDAO<Projeto>(em, Projeto.class);
	}

	public List<Projeto> listaProjetos() {
		return dao.lista();
	}
	
}
