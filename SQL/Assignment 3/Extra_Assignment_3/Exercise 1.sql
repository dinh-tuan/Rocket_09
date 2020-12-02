USE adventureworks;

-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
SELECT 
    Name
FROM
    product
WHERE
    ProductSubcategoryID IN (SELECT 
            ProductSubcategoryID
        FROM
            ProductSubcategory
        WHERE
            Name = 'Saddles');
            
-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.
SELECT 
    Name
FROM
    product
WHERE
    ProductSubcategoryID IN (SELECT 
            ProductSubcategoryID
        FROM
            ProductSubcategory
        WHERE
            Name LIKE 'Bo%');
 
 -- Question 3: Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
SELECT 
    name
FROM
    product
WHERE
    ListPrice = (SELECT 
            MIN(ListPrice)
        FROM
            product
        WHERE
            ProductSubcategoryID IN (SELECT 
                    ProductSubcategoryID
                FROM
                    ProductSubcategory
                WHERE
                    Name = 'Touring Bikes'));