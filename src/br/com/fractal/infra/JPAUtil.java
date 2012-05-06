package br.com.fractal.infra;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {

	private static EntityManagerFactory entityManagerFactory;

	static {
		entityManagerFactory = Persistence
				.createEntityManagerFactory("fractal");
	}

	public EntityManager getEntityManager() {
		return entityManagerFactory.createEntityManager();
	}
}