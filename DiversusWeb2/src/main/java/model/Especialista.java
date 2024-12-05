package model;

import java.util.ArrayList;
import java.util.List;

public class Especialista extends Usuario{

	private boolean especialista;
	private String especialidade;
	private String formacao;
	private String biografia;
	private String caminhoImg;
	private String cidade;
	private String telefone;
	private List<ExperienciaProjeto> experiencias;
	private List<Formacao> formacoes;
	private List<Post> postsUser;
	
	public Especialista(String nome, String email, String senha, String data, String genero,
			String especialidade) {
		super(nome, email, senha, data, genero);
		
		this.especialista = false;
		this.especialidade = especialidade;
		this.formacao = null;
		this.biografia = null;
		this.experiencias = new ArrayList<>();
		this.formacoes = new ArrayList<>();
		this.postsUser = new ArrayList<>();
	}
	public Especialista() {
		
	}
	
	public Especialista(String email, String senha) {
		super(email, senha);
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

	public boolean isEspecialista() {
		return especialista;
	}

	public void setEspecialista(int especialista) {
		this.especialista = especialista == 1;
	}

	public String getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}

	public String getFormacao() {
		return formacao;
	}

	public void setFormacao(String formacao) {
		this.formacao = formacao;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}
	public String getCaminhoImg() {
		return caminhoImg;
	}
	public void setCaminhoImg(String caminhoImg) {
		this.caminhoImg = caminhoImg;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public List<ExperienciaProjeto> getExperiencias() {
		return experiencias;
	}
	public void setExperiencias(List<ExperienciaProjeto> experiencias) {
		this.experiencias = experiencias;
	}
	public List<Formacao> getFormacoes() {
		return formacoes;
	}
	public void setFormacoes(List<Formacao> formacoes) {
		this.formacoes = formacoes;
	}
	public List<Post> getPostsUser() {
		return postsUser;
	}
	public void setPostsUser(List<Post> postsUser) {
		this.postsUser = postsUser;
	}
	
	public void adicionarPost(Post post) {
		postsUser.add(post);
	}
	
	public void adicionarExperiencia(ExperienciaProjeto exp) {
		experiencias.add(exp);
	}
	
	public void adicionarFormacao(Formacao formacao) {
		formacoes.add(formacao);
	}
	
}
