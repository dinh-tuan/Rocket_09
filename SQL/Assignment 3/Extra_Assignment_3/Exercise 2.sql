use adventureworks;

-- Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database.
SELECT 
    c.Name AS Country, s.name AS Province
FROM
    countryregion c
        JOIN
    stateprovince s ON c.CountryRegionCode = s.CountryRegionCode
GROUP BY Country , Province;

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
SELECT 
    c.Name AS Country, s.name AS Province
FROM
    countryregion c
        JOIN
    stateprovince s ON c.CountryRegionCode = s.CountryRegionCode
WHERE
    c.Name = 'Germany' OR c.Name = 'Canada'
GROUP BY Country , Province
order by Country , Province;

/*Question 3:
SalesOrderID, OrderDate and SalesPersonID. Từ bảng SalesPerson, chúng ta lấy cột
BusinessEntityID (là định danh của người sales), Bonus and the SalesYTD (là đã sale
được bao nhiêu người trong năm nay)
*/

SELECT 
    soh.SalesOrderID,
    spqh.SalesPersonID,
    sp.SalesPersonID AS BusinessEntityID,
    sp.Bonus,
    sp.SalesYTD
FROM
    salespersonquotahistory spqh
        JOIN
    salesperson sp ON sp.SalesPersonID = spqh.SalesPersonID
        JOIN
    salesorderheader soh ON soh.SalesPersonID = sp.SalesPersonID
GROUP BY soh.SalesOrderID;