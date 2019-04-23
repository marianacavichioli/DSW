package br.ufscar.dc.dsw.model;

public class Locadora extends Usuario {
    
    private int id;
    private String cnpj;
    private String cidade;

    public Locadora(String senha, String email, String nome, int ativo) {
        super(senha, email, nome, ativo);
        this.id = super.getId();
    }

    public Locadora(int id, String cnpj, String cidade, String email, String nome, int ativo) {
        super(email, nome, ativo);
        this.id = super.getId();
        this.cnpj = cnpj;
        this.cidade = cidade;
    }

    public Locadora(int id, String cnpj, String cidade, String senha, String email, String nome, int ativo) {
        super(senha, email, nome, ativo);
        this.id = super.getId();
        this.cnpj = cnpj;
        this.cidade = cidade;
    }

    public Locadora(int id) {
        super(null, null, null, -1);
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
}
