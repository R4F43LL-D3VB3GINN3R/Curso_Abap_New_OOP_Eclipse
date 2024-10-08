report zp_ticket_sync.

data remote_sys type ref to zif_remote_ticket_sys. "para instanciar uma interface tem de se usar a velha sintaxe abap

"radiobuttons para conectar a nossa interface a classes diferentes
parameters: p_bonus radiobutton group rg1,
            p_secur radiobutton group rg1.

start-of-selection.

  case abap_true.

    when p_bonus. "chama a classe zcl_ticket_bonus_sys

      data(bonus_sys) = new zcl_ticket_bonus_sys(  ). "instancia de uma classe
      remote_sys ?= bonus_sys.                        "antiga forma de ligar a classe a interface

    when p_secur. "chama a classe zcl_ticket_security_sys

      data(security_sys) = new zcl_ticket_security_sys(  ). "instancia da outra classe.
      remote_sys = cast #( security_sys ).                  "nova sintaxe de casting para ligar a classe a interface

  endcase.

  "insere os dados da tabela z ticket na tabela dinamica
  select *
    from sticket
    into table @data(tickets).

  "invoca o método diretamente da interface
  "o comportamento do método vai variar de qual classe foi ligada a interface
  remote_sys->accept_new_tickets( corresponding #( tickets ) ).

  "ps - é possível chamar o método diretamente do objeto de classe sem fazer a ligação à interface
  "ao invés de chamar o método diretamente da interface.
  "porém, não é boa prática, visto que temos de referenciar as coisas para que haja melhor entendimento de seus usos.
