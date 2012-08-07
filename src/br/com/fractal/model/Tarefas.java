package br.com.fractal.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import br.com.fractal.model.enums.Estado;

@Entity
public class Tarefas {

	@Id @GeneratedValue
	private Long id;

	private String nome;
	private String descricao;
	
	@Enumerated(EnumType.STRING)
	private Estado estado;
	
	private String destinario;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar dataInicio;

	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar dataTermino;
	
	private int prazo;
	
	private Long projeto_id; 

	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public String getDestinario() {
		return destinario;
	}

	public void setDestinario(String destinario) {
		this.destinario = destinario;
	}

	public Calendar getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Calendar dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Calendar getDataTermino() {
		return dataTermino;
	}

	public void setDataTermino(Calendar dataTermino) {
		this.dataTermino = dataTermino;
	}

	public int getPrazo() {
		return prazo;
	}

	public void setPrazo(int prazo) {
		this.prazo = prazo;
	}

	public Long getProjeto_id() {
		return projeto_id;
	}

	public void setProjeto_id(Long projeto_id) {
		this.projeto_id = projeto_id;
	}

}