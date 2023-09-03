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
    font-size: 24px;
    text-decoration: none;
    color: white;
}

h1{
    font-size: 50px;
    padding-left: 60px;
    padding-top: 20px;
    font-weight: normal;
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

section{
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    align-content: center;
    margin-top: 150px;
    margin-left: 350px;
    border: 1px solid gray;
    border-radius: 10px;
    height: 500px;
    width: 800px;
    box-shadow: 2px 4px 8px 2px rgba(6, 6, 6, 0.2), 3px 6px 20px 3px rgba(0, 0, 0, 0.19);
}

h2{
    font-size: 40px;
    position: relative;
    top: 60px;
    left: 130px;
}

input[type="name"]{
    height: 28px;
    width: 200px;
    font-size: 15px;
    border: 1px solid gray;
    border-radius: 3px;
    position: relative;
    left: 125px;
    outline: none;
}

input[type="number"]{
    height: 28px;
    width: 200px;
    border: 1px solid gray;
    border-radius: 3px; 
    font-size: 18px;
    position: relative;
    left: 30px;
    outline: none;
}

input[type="password"]{
    height: 28px;
    width: 200px;
    border: 1px solid gray;
    border-radius: 3px; 
    font-size: 18px;
    position: relative;
    left: 90px;
    outline: none;
}

.btn{
    height: 35px;
    width: 100px;
    font-size: 18px;
    margin-top: 30px;
    margin-left: 130px;
    border-radius: 5px;
    border: 1px solid purple;
    color: white;
    background-color: purple;
    cursor: pointer;
}

.btn a{
    text-decoration: none;
    color: white;
}

.btn1{
    height: 35px;
    width: 100px;
    font-size: 18px;
    position: relative;
    left: 330px;
    top: 250px;
    align-content: space-between;
    border-radius: 5px;
    border: 1px solid gray;
    color: black;
    background-color: gray;
    cursor: pointer;
}

.btn1 a{
    text-decoration: none;
    color: white;
}

.name{
    font-weight: bold;
    font-size: 22px;
    position: relative;
    top: 90px;
}

.no{
    font-weight: bold;
    font-size: 22px;
    position: relative;
    top: 130px;
}

.password{
    font-weight: bold;
    font-size: 22px;
    position: relative;
    top: 160px;
}

p{
    font-size: 20px;
    margin: 200px 0px 0px 50px;
}

.menu{
    display: none;
}

@media only screen and (max-width: 800px)

{

    header{
        height: 9vh;
        width: 100vw;
     }

     .logo{
        height: 40px;
        width: 40px;
        margin-top: 8px;
        margin-left: 10px;
     }

     h1{
        font-size: 30px;
        margin-top: -8px;
        margin-left: -50px;
     }

     .nav{
        display: none;
    }

    .menu{
        display: block;
        font-size: 26px;
        color: white;
        padding-top: 15px;
        padding-left: 90px;
    }

    .menu-list a{
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        color: white;
        padding: 5px;
        text-decoration: none;
    }

    .menu:hover .menu-list{
        display: flex;
        flex-wrap: nowrap;
        flex-direction: row;
        align-items: center;
        margin-top: -38px;
        margin-left: -250px;
    }

    .menu-list{
        display: none;
        color: white;
        position: absolute;
    }

    section{
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        align-content: center;
        margin-top: 150px;
        margin-left: 27px;
        border: 1px solid gray;
        border-radius: 10px;
        height: 450px;
        width: 340px;
        box-shadow: 2px 4px 8px 2px rgba(6, 6, 6, 0.2), 3px 6px 20px 3px rgba(0, 0, 0, 0.19);
    }

    h2{
        font-size: 30px;
        position: relative;
        top: 60px;
        left: 50px;
    }
    
    input[type="name"]{
        height: 18px;
        width: 170px;
        font-size: 15px;
        border: 1px solid gray;
        border-radius: 3px;
        position: relative;
        left: 83px;
    }
    
    input[type="number"]{
        height: 18px;
        width: 170px;
        border: 1px solid gray;
        border-radius: 3px; 
        font-size: 18px;
        position: relative;
        left: 5px;
    }
    
    input[type="password"]{
        height: 18px;
        width: 170px;
        border: 1px solid gray;
        border-radius: 3px; 
        font-size: 18px;
        position: relative;
        left: 53px;
    }
    
    .btn{
        height: 23px;
        width: 70px;
        font-size: 16px;
        position: relative;
        left: 80px;
        top: 250px;
        align-content: space-between;
        border-radius: 2px;
        border: 1px solid purple;
        color: white;
        background-color: purple;
        cursor: pointer;
    }
    
    .btn a{
        text-decoration: none;
        color: white;
    }
    
    .btn1{
        height: 23px;
        width: 70px;
        font-size: 16px;
        position: relative;
        left: 100px;
        top: 250px;
        align-content: space-between;
        border-radius: 2px;
        border: 1px solid gray;
        color: black;
        background-color: gray;
    }
    
    .btn1 a{
        text-decoration: none;
        color: white;
    }
    
    .name{
        font-weight: bold;
        font-size: 18px;
        margin-left: -20px;
    }
    
    .no{
        font-weight: bold;
        font-size: 18px;
        margin-left: -20px;
    }
    
    .password{
        font-weight: bold;
        font-size: 18px;
        margin-left: -20px;
    }

    p{
        font-size: 17px;
        margin: 150px 0px 0px 20px;
    }
    
    
}



</style>

</head>
<body>

 <section>
    <form role="form" action="login" method="post" id="signIn">
      <h2> Login</h2>

      <div class="no">
        <label> Contact number: </label>
        <input type="number" required="true" placeholder="+91" id="phonenumber" name="phone_number">
        <br>
      </div>

      <div class="password">
        <label> Password: </label>
        <input type="password" placeholder="*******" id="password" name="password" required="true">
      </div>

      <p>
        Create new account <a href="user/new"> Sign up </a>
      </p>

      <div>
        <a href="category_list"> <button class="btn" type="submit"> Submit </button> </a>
      </div>

    </form>

  </section>
 

</body>
</html>