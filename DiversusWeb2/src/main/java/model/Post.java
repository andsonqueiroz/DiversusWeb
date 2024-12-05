package model;

public class Post {
	
	private int id;
	private String titulo;
	private String subtitulo;
	private String conteudo;
	private String datapub;
	private int iduser;
	private String temaPredominante;
	private String caminhoImg;
	
	public Post(String titulo, String subtitulo, String conteudo, int iduser) {
		this.titulo = titulo;
		this.subtitulo = subtitulo;
		this.conteudo = conteudo;
		this.iduser = iduser;
	}
	
	public Post() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public String getDatapub() {
		return datapub;
	}
	public void setDatapub(String datapub) {
		this.datapub = datapub;
	}
	public int getIduser() {
		return iduser;
	}
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public String getTemaPredominante() {
		return temaPredominante;
	}

	public void setTemaPredominante(String temaPredominante) {
		this.temaPredominante = temaPredominante;
	}

	public String getCaminhoImg() {
		return caminhoImg;
	}

	public void setCaminhoImg(String caminhoImg) {
		this.caminhoImg = caminhoImg;
	}
	

}
