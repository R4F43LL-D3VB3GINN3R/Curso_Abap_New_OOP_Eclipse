class zcl_ticket_ai_trg_sys definition
  public
  inheriting from zcl_ticket_ai_sys "herda a classe
  final
  create public .

  public section.
  protected section.
  
    methods: create_tickets_in_remote_sys redefinition. "aqui estamos usando um método overrided
  
  private section.
endclass.



class zcl_ticket_ai_trg_sys implementation.

  method create_tickets_in_remote_sys.
     
     new-line.                                          " <-- uso do método Overrided
     
     write: 'Extra preparation steps taken by child'.

     super->create_tickets_in_remote_sys( json ). " <-- uso do método da classe herdada
     
     new-line.
     
     write: 'Extra post-stepstaken by child'.

  endmethod.

endclass.
