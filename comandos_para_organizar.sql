-- insert com update para caso dado duplicado
insert into Setorizada.TB_DADOS_AREA(Tag_Ambev, Area, Nome, Tipo_Medicao)
values ('NM631019', 'SUBESTACAO UTILIDADES', 'QGBT 01', 'Energia') ON DUPLICATE KEY UPDATE
Area = 'SUBESTACAO UTILIDADES', Tipo_Medicao = "Energia", Nome = 'QGBT 01';

-- configuração de acesso
set global max_connections = 1000;
set interactive_timeout = 120;
set global connect_timeout = 60;
set wait_timeout = 6;

show status where variable_name = "threads_connected";


--MODELOS DE SELECT

-- join da tabela com ela mesmo para poder retornar a diferença entre os valores de um dia e outro
select cast(b.Gasometro_1_TA - a.Gasometro_1_TC as decimal(10,3)) as "Prod_Gasometro1_TA", 
cast(b.Gasometro_1_TB - b.Gasometro_1_TA as decimal(10,3)) as "Prod_Gasometro1_TB",
cast(b.Gasometro_1_TC - b.Gasometro_1_TB as decimal(10,3)) as "Prod_Gasometro1_TC"
b.time from ITF.TB_BIOGAS_FECHAMENTO a join ITF.TB_BIOGAS_FECHAMENTO b
on adddate(a.time, interval 1 day) = b.time;

-- retorna todas as respostas da coluna nome que contenha a letra pz no final da palavra
select  Case
	When right(Nome,2) = "PZ" then "Pasteurizador"
    end nome from Utilidades.TB_SMS_VAPOR_AGUA where Tag_Ambev = "NMMVPK14";

-- somando valores de duas informacoes para resultar o total da area
SELECT
  sum(Consumo_Instantaneo) as "One Way - Instantâneo",
  adddate(time, interval 3 hour) AS "time"
FROM Utilidades.TB_SMS_VAPOR_AGUA
WHERE
  Tag_Ambev in ("NMMVPK19", "NMMVPK20") and
  time = (time + interval 3 hour) group by time;

-- somando valores de duas colunas para resultar o calculo de porcentagem
SELECT sum(DescargaCh03 > 12)/
    sum(DescargaCh03 >= 0) from  Utilidades.TB_IVs_SISTEMA_FRIO
    where
    (DescargaCh03 >= 0) AND turno = 'Turno B' AND time < adddate(now(), interval -27 hour);


 select sum(valor < 93 and valor > 0)/sum(valor > 0) as "percentual"
 FROM ITF.TB_IVs_TQ_RECUPERAÇÃO where tag = 'TT312832' and time > ADDDATE(NOW(), INTERVAL -27 hour);