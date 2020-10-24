SELECT COUNT(*) FROM usairlineflights2.flights;

SELECT origin, AVG(ArrDelay) AS prom_arribades, AVG(DepDelay) AS prom_sortides
FROM flights
GROUP BY origin;

SELECT origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades
FROM flights
GROUP BY origin, colYear, colMonth
ORDER BY origin ASC;

SELECT city, colYear, colMonth, AVG(ArrDelay) AS prom_arribades
FROM flights
LEFT JOIN usairports
ON flights.Origin = usairports.IATA
GROUP BY origin, colYear, colMonth
ORDER BY city, colYear, colMonth ASC;

SELECT DISTINCT UniqueCarrier, colYear, colMonth, SUM(cancelled) 
AS total_cancelled
FROM flights
GROUP BY colYear, colMonth
ORDER BY total_cancelled desc, colYear desc, colMonth desc;

SELECT DISTINCT TailNum, SUM(Distance) 
AS total_distance
FROM flights
GROUP BY TailNum
ORDER BY total_distance desc
LIMIT 10 OFFSET 1;

SELECT UniqueCarrier, AVG(ArrDelay) AS avgDelay
FROM flights
group by UniqueCarrier
having AvgDelay > 10
ORDER BY avgdelay DESC;