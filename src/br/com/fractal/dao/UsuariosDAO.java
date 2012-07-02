package br.com.fractal.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.fractal.infra.JPAUtil;
import br.com.fractal.model.Projeto;
import br.com.fractal.model.Usuarios;

public class UsuariosDAO {

	private final GenericDAO<Usuarios> dao;

	public UsuariosDAO(EntityManager em) {
		dao = new GenericDAO<Usuarios>(em, Usuarios.class);
	}

	public void adiciona(Usuarios t) {
		dao.adiciona(t);
	}

	public void remove(Usuarios t) {
		dao.remove(t);
	}

	public void altera(Usuarios t) {
		dao.altera(t);
	}

	public Usuarios buscaPorId(Long id) {
		return dao.buscaPorId(id);
	}

	public List<Usuarios> lista() {
		return dao.lista();
	}

	public Usuarios existeUsuario(Usuarios user) {

		if (user == null) {
			throw new IllegalArgumentException("Usuario não deve ser nulo");
		}

		EntityManager em = new JPAUtil().getEntityManager();

		String jdbc = "select u from Usuarios u where u.login = :login and u.senha = :senha";

		Query query = em.createQuery(jdbc);
		query.setParameter("login", user.getLogin());
		query.setParameter("senha", user.getSenha());

		List resultList = query.getResultList();
		em.close();

		if (resultList.size() == 0) {
			return null;
		} else {
			return (Usuarios) resultList.get(0);
		}

	}

	public List<Projeto> listaProjetosDoUsuario(Long id) {
		return dao.listaProjetosDoUsuario(id);
	}

}
