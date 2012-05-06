package br.com.fractal.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Comentario {
	
	@Id @GeneratedValue
	int tarefa_id;
	
	private Calendar data;
	
	String conteudo;

	public int getTarefa_id() {
		return tarefa_id;
	}

	public void setTarefa_id(int tarefa_id) {
		this.tarefa_id = tarefa_id;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	
}
