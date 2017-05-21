#Product Template

##usage
``` 
npm install
```

##Run
``` 
node index

http://localhost:3002
```
## Linh Updates
#### 8-12/05/2017:  *User authentication*: use Bcryptjs for hashing passwords
1. Plain local: send sign up and log in requests and then validate directly with database 
2. User authentication for thanhquanmobile: 2 versions with plain local and passport-local

#### 15/05/2017
* Simple text search for search bar 
* Order management: insert successful order to database table (orders and detailed_orders)
* Remove session cookies and cart after submitting order

#### 16/05/2017
* Update thanh-cong.html: display customers order detail
* Display orders from databse in admin page
* Change detailed_orders table to include product name and product type id -> display info in admin panel more easily

#### 17 - 18/05/2017
* Show sales, inventory data in charts 
* Display users, products in admin panel  

#### 19/05/2017
* Accessory routing
* Add phone column to user_account table - update table, change sign-up form
* Add edit-user and edit-user-pass post requests which allow users update info and change password in tai-khoan.html

