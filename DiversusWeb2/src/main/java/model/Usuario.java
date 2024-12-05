package model;

public class Usuario {
	protected int id;
	protected String nome;
	protected String email;
	protected String senha;
	protected String data;
	protected String genero;
	
	public Usuario(String nome, String email, String senha, String data, String genero) {
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.data = data;
		this.genero = genero;	
	}
	
	public Usuario() {
		
	}
	
	public Usuario(String email, String senha) {
		this.email = email;
		this.senha = senha;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
	
	public String getGenero() {
		return genero;
	}
	
	public void setGenero(String genero) {
		this.genero = genero;
	}

}
