select distinct Year, State_Name , RICE_PRODUCTION_1000_tons as Rice_Production from agri order by RICE_PRODUCTION_1000_tons desc limit 3;
select Year,Dist_Name, sum(WHEAT_YIELD_Kg_per_ha) as Wheat_Yield from agri WHERE Year BETWEEN 2013 AND 2017 group by Year,Dist_Name order by Year desc limit 5;
select Year,Dist_Name, WHEAT_YIELD_Kg_per_ha as Wheat_Yield from agri WHERE Year BETWEEN 2013 AND 2017 order by WHEAT_YIELD_Kg_per_ha desc limit 5;
select Year, State_Name, avg(OILSEEDS_PRODUCTION_1000_tons) as Oilseeds_Production from agri where Year BETWEEN 2013 AND 2017 and OILSEEDS_PRODUCTION_1000_tons!=0 group by State_Name,Year order by State_Name,Year desc;
/*select CONCAT(State_Name, ' - Avg Sales: ', sum(AVG(OILSEEDS_PRODUCTION_1000_tons))) AS state_average_summary from agri group by State_Name,Year order by State_Name,Year desc;*/
-- where Year BETWEEN 2013 AND 2017 and OILSEEDS_PRODUCTION_1000_tons!=0 group by State_Name,Year order by State_Name,Year desc;
/*SELECT CORR(RICE_AREA_1000_ha,RICE_PRODUCTION_1000_tons) AS correlation_coefficient FROM agri;*/
select 
	Dist_Name,
    (SUM((RICE_AREA_1000_ha - avg_x.mean_x) * (RICE_PRODUCTION_1000_tons - avg_y.mean_y))) /
    (SQRT(SUM(POW(RICE_AREA_1000_ha - avg_x.mean_x, 2))) * SQRT(SUM(POW(RICE_PRODUCTION_1000_tons - avg_y.mean_y, 2)))) AS Rice_correlation_coefficient,
    (SUM((WHEAT_AREA_1000_ha - avg_xx.mean_xx) * (WHEAT_PRODUCTION_1000_tons - avg_yy.mean_yy))) /
    (SQRT(SUM(POW(WHEAT_AREA_1000_ha - avg_xx.mean_xx, 2))) * SQRT(SUM(POW(WHEAT_PRODUCTION_1000_tons - avg_yy.mean_yy, 2)))) AS Wheat_correlation_coefficient,
    (SUM((MAIZE_AREA_1000_ha - avg_xy.mean_xy) * (MAIZE_PRODUCTION_1000_tons - avg_yx.mean_yx))) /
    (SQRT(SUM(POW(MAIZE_AREA_1000_ha - avg_xy.mean_xy, 2))) * SQRT(SUM(POW(MAIZE_PRODUCTION_1000_tons - avg_yx.mean_yx, 2)))) AS Maize_correlation_coefficient
from
    agri,
    (SELECT AVG(RICE_AREA_1000_ha) AS mean_x FROM agri) AS avg_x,
    (SELECT AVG(RICE_PRODUCTION_1000_tons) AS mean_y FROM agri) AS avg_y,
    (SELECT AVG(WHEAT_AREA_1000_ha) AS mean_xx FROM agri) AS avg_xx,
    (SELECT AVG(WHEAT_PRODUCTION_1000_tons) AS mean_yy FROM agri) AS avg_yy,
    (SELECT AVG(MAIZE_AREA_1000_ha) AS mean_xy FROM agri) AS avg_xy,
    (SELECT AVG(MAIZE_PRODUCTION_1000_tons) AS mean_yx FROM agri) AS avg_yx
group by 
	Dist_Name;
select distinct Year, State_Name ,COTTON_PRODUCTION_1000_tons as Cotton_Production from agri order by COTTON_PRODUCTION_1000_tons desc limit 5;
select distinct Year, Dist_Name,sum(GROUNDNUT_PRODUCTION_1000_tons) as Groundnut_Production from agri Where Year >=2010 group by Dist_Name,Year order by Dist_Name,Year desc;
/*SELECT AVG(MAIZE_YIELD_Kg_per_ha) AS overall_average_yield FROM agri;*/
SELECT Year,State_Name,AVG(MAIZE_YIELD_Kg_per_ha) AS Annual_Average_yield FROM agri GROUP BY Year,State_Name ORDER BY Year,State_Name asc;
select State_Name, sum(OILSEEDS_AREA_1000_ha) as Total_Oilseeds_cultivated from agri group by State_Name order by State_Name desc;
select Dist_Name, sum(RICE_YIELD_Kg_per_ha) as Total_Rice_Yield from agri group by Dist_Name order by Dist_Name desc;
select State_Name,Year,WHEAT_PRODUCTION_1000_tons,RICE_PRODUCTION_1000_tons,(WHEAT_PRODUCTION_1000_tons - RICE_PRODUCTION_1000_tons) AS production_difference,(WHEAT_PRODUCTION_1000_tons / RICE_PRODUCTION_1000_tons) AS wheat_to_rice_ratio from agri where Year between 2007 and 2017 ORDER BY State_Name DESC limit 5;