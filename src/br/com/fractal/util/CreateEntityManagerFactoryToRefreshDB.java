package br.com.fractal.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CreateEntityManagerFactoryToRefreshDB {

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("fractal");
	}
}