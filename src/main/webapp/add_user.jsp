<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
*{
    margin: 0px;
    font-family: 'Kreon', serif;
}

header{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    background-color: purple;
    height: 100px;
}

header div ul{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    list-style: none;
    margin-left: 550px;
}

header div ul li{
    padding-top: 40px;
    padding-left: 30px;
}

header div ul li a{
     text-decoration: none;
     color: white;
     font-size: 24px;
}

.menu{
    display: none;
}

h1{
    font-size: 50px;
    font-weight: normal;
    padding-left: 60px;
    padding-top: 20px;
    color: white;
}

.logo{
    margin-top: 15px;
    margin-left: 50px;
    border-radius: 50px;
    height: 70px;
    width: 70px;
}

.login{
   font-size: 25px;
   color: white;
   cursor: pointer;
}

.menu{
    display: none;
}

.register{
    margin-left: 550px;
    margin-top:150px;
    border-radius: 15px;
    border: 3px solid #fff;
    background-color: #fff;
    padding-top:30px;
    padding-bottom:30px;
    width:500px;
    box-shadow: 5px 13px 20px #909090;
}

h2{
    padding-top: 80px;
    padding-left: 40px;
}

.register div{
    padding-top: 30px;
    padding-left: 70px;
}

button{
    margin-top: 50px;
    margin-left: 200px;
    color: white;
    border: 0px;
    background-color: purple;
    border-radius: 5px;
    height: 35px;
    width: 130px;
    position: relative;
    right: 10px;
    top: px;
    cursor: pointer;
}

button a{
    color: white;
    text-decoration: none;
}

input[type="text"]{
    border: 1px solid gray;
    border-radius: 3px;
    height: 30px;
    width: 200px;
    position: relative;
    left: 110px;
    outline: none;
}

label{
    font-size: 20px;
}

input[type="tel"]{
    border: 1px solid gray;
    border-radius: 3px;
    height: 30px;
    width: 200px;
    position: relative;
    left: 40px;
    outline: none;
}

input[type="number"]{
    border: 1px solid gray;
    border-radius: 3px;
    height: 30px;
    width: 200px;
    position: relative;
    left: 120px;
    outline: none;
}

input[type="password"]{
    border: 1px solid gray;
    border-radius: 3px;
    height: 30px;
    width: 200px;
    font-size: 20px;
    position: relative;
    left: 23px;
    outline: none;
}

select {
 	border: 1px solid gray;
    border-radius: 3px;
    height: 30px;
    width: 200px;
    font-size: 18px;
    position: relative;
    left: 110px;
    outline: none;

}

div p {
    margin: 10px 40px 0px 150px;
}

</style>


</head>
<body>
	
	 <section>
            <form role="form" action="create" method="post">
                <div class="register">
            
                    <h2> SIGN UP : </h2>
                    <div>
                        <label> Name: </label>
                        <input type="text" id="uname" name="name" required="true">
                    </div>
                    
                    <div>
                        <label> Age: </label>
                        <input type="number" id="uname" name="age" required="true">
                    </div>
                    
                    <div>
                        <label> Email: </label>
                        <input type="text" id="uname" name="email" required="true">
                    </div>

                    <div>
                        <label> Phone number: </label>
                        <input type="tel" id="phonenumber" name="phone_number" placeholder="+91" required="true">
                    </div>

                    <div>
                        <label> Create Password: </label>
                        <input type="password" id="password" name="password" required="true" >
                        <p> (Pattern: Atleast 8 characters including uppercase, lowercase, number and special characters) </p>
                    </div>
                    
                    <div>
                        <label > Role: </label>
                        <select name="role">
                        
                        <option value=""> Select role </option>
                        <option value="buyer" > Buyer </option>
                        <option value="seller"> Seller </option>
                        
                        </select>
                    </div>
                
                    <p>
                        Already have an account? <a href="login"> LOG IN </a> 
                    </p>
               
                   <a href="user/login"> <button type="submit" class="submit"> SUBMIT </button> </a>
            
                </div>
            </form>
    
        </section> 

</body>
</html>