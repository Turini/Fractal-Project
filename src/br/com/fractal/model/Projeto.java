package br.com.fractal.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Projeto {

	String nome;
	
	@Id
	Long id;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}
