package contacorrente;

public class ContaInvestimento {

    private String nomeDoTitular;
    private double numeroDaConta, saldo, taxaJuros;
    
    public ContaInvestimento (String nomeDoTitular, double numeroDaConta, double saldo, double taxaJuros){
        this.nomeDoTitular = nomeDoTitular;
        this.numeroDaConta = numeroDaConta;
        this.saldo = saldo;
        this.taxaJuros = taxaJuros;
    }
    
    public String getnomeDoTitular(){
        return nomeDoTitular;
    }
    
    public Double getnumeroDaConta(){
        return numeroDaConta;
    }
    
    public Double getsaldo(){
        return saldo;
    }
    
    public void depositar(double valor){
        if(valor > 0){
            saldo += valor;
            System.out.println("Deposito realizado com sucesso!");
        } else {
            System.out.println("O valor do deposito só pode ser positivo!");
        }
    }
    
    public void sacar(double valor){
       if(saldo <= 0){
           System.out.println("Seu saldo não é suficiente para sacar");
        } else if (valor > saldo ){
            System.out.println("Saldo insuficiente para saque!!");
        } else {
            saldo -= valor;
            System.out.println("Saque realizado com sucesso. Seu saldo após o saque: "+ saldo);
        }

    public void taxaJuros(double taxaJuros){
        saldo += taxaJuros * saldo;
    } 
    
    
       
       
    }
}