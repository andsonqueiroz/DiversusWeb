package model;
public class PostNewsletter {
	private String titulo;
	private String subtitulo;
	private String diasDesdePostagem;
	private String nome;
	
	public PostNewsletter(String titulo, String subtitulo, String diasDesdePostagem, String nome) {
		this.titulo = titulo;
		this.subtitulo = subtitulo;
		this.diasDesdePostagem = diasDesdePostagem;
		this.nome = nome;
	} 

	public PostNewsletter(PostNewsletter post) {
		this.titulo = post.getTitulo();
		this.subtitulo = post.getSubtitulo();
		this.diasDesdePostagem = post.getDiasDesdePostagem();
		this.nome = post.getNome();
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getSubtitulo() {
		return subtitulo;
	}
	
	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}
	
	public String getDiasDesdePostagem() {
		return diasDesdePostagem;
	}
	
	public void setDiasDesdePostagem(String diasDesdePostagem) {
		this.diasDesdePostagem = diasDesdePostagem;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	
}
