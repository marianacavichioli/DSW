package br.ufscar.dc.dsw.model;

public class Locadora extends Usuario {
    
    private int id;
    private String nome;
    private String cnpj;
    private String cidade;

    public Locadora(String nome, String senha, String email, int ativo) {
        super(senha, email, ativo);
        this.id = super.getId();
    }

    public Locadora(int id, String nome, String cnpj, String cidade, String email, int ativo) {
        super(email, ativo);
        this.id = id;
        this.nome = nome;
        this.cnpj = cnpj;
        this.cidade = cidade;
    }

    public Locadora(int id, String nome, String cnpj, String cidade, String senha, String email, int ativo) {
        super(senha, email, ativo);
        this.id = id;
        this.nome = nome;
        this.cnpj = cnpj;
        this.cidade = cidade;
    }

    public Locadora(int id) {
        super(null, null, -1);
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
