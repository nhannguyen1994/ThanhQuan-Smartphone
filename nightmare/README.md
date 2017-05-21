### CRAWL PHONE PRODUCTS DATA ON HOANGHAMOBILE

#### MAIN USED MODULES
1. Nightmare js to crawl 
2. Image-downloader to download images

#### CRAWL DATA AND IMAGES AND THEN EXPORT DIRECTLY TO DATABASE
HOANGHAMOBILE has pagination and the first product row of the next page is the same as the last row of the previous page. Thus, we have 2 crawl files:
1. Crawl_all.js is to crawl the first page
2. Crawl.next.js is to crawl the next pages. Here we cut the links of the duplicated products and only crawl new products. Each script run is to crawl one page so we have to change the link to HOANGHAMOBILE page after each crawl

* Reconfig database connection in file config.json

#### IMAGES ARE DOWNLOAD TO FOLDER IMG AND EACH PRODUCT HAS THEIR OWN FOLDER 

#### In crawl scripts, it only updates or inserts product to the tables named 'product_new' and 'product_image', changes table names if needed
1. Create tables first in your DB with correct column names

```sql
    CREATE TABLE product_new(product_id TEXT PRIMARY KEY, product_name TEXT, product_template_id TEXT, category_id TEXT, manufacturer_id TEXT, sales_volume INTEGER, store_day TEXT, price INTEGER, quantity INTEGER, description JSON, main_property JSON, detail_property JSON);
    CREATE TABLE product_image(image_id SERIAL PRIMARY KEY, image_name TEXT, product_id TEXT, FOREIGN KEY (product_id) REFERENCES product_new (product_id) MATCH FULL); 
```
