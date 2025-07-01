select * from BlinkIT_Data

select count(*) from BlinkIT_Data

update BlinkIT_Data
set Item_Fat_Content=
case
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end

select cast(sum(Total_Sales) / 1000000 as decimal(10,2)) as TOTAL_SALES_millions
from BlinkIT_Data
select cast(AVG(Total_Sales) as decimal(10,0)) as AVG_SALES from BlinkIT_Data
select count(Item_Identifier) as number_of_items from BlinkIT_Data
select cast(AVG(Rating) as decimal(10,1)) as Avg_Rating from BlinkIT_Data

select Item_Fat_Content, 
      cast(sum(Total_Sales) as decimal (10,0))  as TOTAL_SALES, 
      cast(AVG(Total_Sales) as decimal(10,0)) as AVG_SALES,
      count(Item_Identifier) as number_of_items,
      cast(AVG(Rating) as decimal(10,1)) as Avg_Rating
      from BlinkIT_Data
where Outlet_Establishment_Year=2020
group by Item_Fat_Content

select Item_Type, 
      cast(sum(Total_Sales) as decimal (10,0))  as TOTAL_SALES, 
      cast(AVG(Total_Sales) as decimal(10,0)) as AVG_SALES,
      count(Item_Identifier) as number_of_items,
      cast(AVG(Rating) as decimal(10,1)) as Avg_Rating
      from BlinkIT_Data
group by Item_Type

SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,0)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable

select Outlet_Establishment_Year,
       CAST(SUM(Total_Sales) AS DECIMAL(10,0)) AS Total_Sales
    FROM blinkit_data
    GROUP BY  Outlet_Establishment_Year
    order by  Outlet_Establishment_Year

    select Outlet_Size,
    CAST(SUM(Total_Sales) AS DECIMAL(10,0)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100 / sum(SUM(Total_Sales)) over ())AS DECIMAL(10,0)) AS Total_Sales_Percentage
    from BlinkIT_Data
    group by Outlet_Size

      select Outlet_Location_Type,
    CAST(SUM(Total_Sales) AS DECIMAL(10,0)) AS Total_Sales
    from BlinkIT_Data
    group by Outlet_Location_Type

    select Outlet_Type, 
      cast(sum(Total_Sales) as decimal (10,0))  as TOTAL_SALES, 
      cast(AVG(Total_Sales) as decimal(10,0)) as AVG_SALES,
      count(Item_Identifier) as number_of_items,
      cast(AVG(Rating) as decimal(10,1)) as Avg_Rating
      from BlinkIT_Data
group by Outlet_Type
