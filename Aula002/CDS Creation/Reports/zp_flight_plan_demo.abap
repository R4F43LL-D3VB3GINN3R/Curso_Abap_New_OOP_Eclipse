report zp_flight_plan_demo.

data: it_spfli type table of spfli,
      it_sairport type table of sairport.

start-of-selection.

    select spfli~carrid,
           spfli~connid,
           spfli~airpfrom,
           spfli~airpto
      from spfli
      inner join sairport
      on spfli~airpfrom eq sairport~id
      into table @data(flight_plans).

cl_salv_table=>factory( importing r_salv_table = data(alv)       "podemos criar o objeto diretamente ao enviar o parametro.

                        changing  t_table      = flight_plans ).

alv->display(  ).
