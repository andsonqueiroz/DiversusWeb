package model;

public class Comentario {
	private int id;
	private String conteudo;
	private int idPost;
	private int idUser;
	
	public Comentario(String conteudo, int idPost, int idUser) {
		this.conteudo = conteudo;
		this.idPost = idPost;
		this.idUser = idUser;
	}
	
	public Comentario() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public int getIdPost() {
		return idPost;
	}
	public void setIdPost(int idPost) {
		this.idPost = idPost;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	
}
