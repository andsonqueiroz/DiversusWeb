package model;

public class Portfolio {
	protected int id;
	protected int ano;
	protected String conteudo;
	protected String cidade;
	protected int userId;
	
	public Portfolio(int ano, String conteudo, String cidade, int user) {
		this.ano = ano;
		this.conteudo = conteudo;
		this.cidade = cidade;
		this.userId = user;
	}
	
	public Portfolio() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
