package br.ufscar.dc.dsw.model;

public class Locadora extends Usuario {
    
    private int id;
    private int cnpj;
    private String cidade;

    public Locadora(String senha, String email, String nome, int ativo) {
        super(senha, email, nome, ativo);
        this.id = super.getId();
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCnpj() {
        return cnpj;
    }

    public void setCnpj(int cnpj) {
        this.cnpj = cnpj;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
}
