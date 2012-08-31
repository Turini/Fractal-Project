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

	@SuppressWarnings("unchecked")
	public Usuarios existeUsuario(Usuarios user) {

		if (user == null) {
			throw new IllegalArgumentException("Usuario não deve ser nulo");
		}

		EntityManager em = new JPAUtil().getEntityManager();

		String jdbc = "select u from Usuarios u where u.login = :login and u.senha = :senha";

		Query query = em.createQuery(jdbc).setParameter("login", user.getLogin()).setParameter("senha", user.getSenha());

		List<Usuarios> users = query.getResultList();
		em.close();

		if (users.size() != 0){
			return users.get(0);
		} else {
			return null;
		}
	}

	public List<Projeto> listaProjetosDoUsuario(Long id) {
		return dao.listaProjetosDoUsuario(id);
	}

	public void associaUsuarioEmProjeto(Long usuarioId, Long projetoId) {
		dao.associaUsuarioEmProjeto(usuarioId, projetoId);
	}

	public List<Object> listUsersByProject() {
		return dao.listUsersByProject();
	}

	public void removeFromProject(long id, long pid) {
		dao.removeFromProject(id, pid);
	}

	public List<Usuarios> listByLogin(String login) {
		return (List<Usuarios>) dao.listBylogin(login);
	}

}
