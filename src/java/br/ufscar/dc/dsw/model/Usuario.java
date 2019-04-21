package br.ufscar.dc.dsw.model;

public class Usuario {
    
    private int id;
    private String email;
    private String senha;
    private String nome;
    private int ativo;

    public Usuario(String senha, String email, String nome, int ativo){
        this.senha = senha;
        this.email = email;
        this.nome = nome;
        this.ativo = ativo;
    }
    
    public Usuario(String email, String nome, int ativo){
        this.email = email;
        this.nome = nome;
        this.ativo = ativo;
    }
    
    public Usuario(String email, String senha){
        this.email = email;
        this.senha = senha;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public int getAtivo() {
        return ativo;
    }

    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }
}
