const { origin } = window.location;
const logo_path = `${origin}/pages/homepage/frontpage.html`;
const logo = `${origin}/assets/images/logo.png`;
const cart = `${origin}/pages/orders/cartpage.html`;
const wishlist = `${origin}/pages/orders/wishlistpage.html`;
const orders = `${origin}/pages/orders/myorderspage.html`;
const profile = `${origin}/pages/homepage/profile.html`;
const sign_up = `${origin}/pages/homepage/registerpage.html`;
const login = `${origin}/pages/homepage/loginpage.html`;

const before_login = `
<a href= "${logo_path}"> <img class="logo" src= "${logo}" alt="logo" /> </a>
<h1> Thara's World </h1>
  <div class="nav">
     <ul> 
        <li><a href = "${sign_up}"><span class="login"> Sign up </span> </a> </li>
        <li> <a href= "${login}"><span class="login"> Login </span> </a></li>
      </ul>
  </div>

  <div class="menu">
    
    <i class="fa-solid fa-bars"></i>               
     <div class="menu-list">
            <a href = "${sign_up}"><span class="login"> Sign up </span> </a>
            <a href= "${login}"><span class="login"> Login </span> </a>
    
     </div>
 </div>

`;

const after_login = `
<a href= "${logo_path}"> <img class="logo" src="${logo}" alt="logo" /> </a>
<h1> Thara's World </h1>
  <div class="nav">
     <ul>
        <li> <a href= "${cart}"><i class="fa-sharp fa-solid fa-cart-shopping"></i> <p id="count"></p> </a></li>
        <li> <a href= "${wishlist}"><i class="fa-sharp fa-solid fa-heart"></i></a></li> 
        <li><a href= "${orders}"><i class="fa-solid fa-bag-shopping"></i></a></li>
        <li><a href="#"><i class="fa-solid fa-bell"></i></i></a></li>
        <li><a href= "${profile}"><i id="profile" class="fa-solid fa-circle-user"></i> </a></li>
        <li> <span class="login" id="logout"> Log out </span> </li>
      </ul>
  </div>

  <div class="menu">
    
    <i class="fa-solid fa-bars"></i>               
     <div class="menu-list">
        
            <a href= "${cart}"><i class="fa-sharp fa-solid fa-cart-shopping"></i></a>
            <a href= "${wishlist}"><i class="fa-sharp fa-solid fa-heart"></i></a>
            <a href= "${orders}"><i class="fa-solid fa-bag-shopping"></i></a>
            <a href="#"><i class="fa-solid fa-bell"></i></i></a>
            <a href= "${profile}"><i class="fa-solid fa-circle-user"></i></a>
            <span class="login" id="logout"> Log out </span> 
    
     </div>
 </div>

`;

function header() {
  const userId = JSON.parse(localStorage.getItem("uniqueID"));
  const userlogin = document.getElementById("userLogin");

  if (!userId) {
    userlogin.innerHTML = before_login;
  } else {
    userlogin.innerHTML = after_login;
    const add_to_cart = JSON.parse(localStorage.getItem("cart"));
    const uniqueid = JSON.parse(localStorage.getItem("uniqueID"));
    const cart_count = add_to_cart.filter(
      (pdt) => pdt.buyer_id === uniqueid).length;
    const count = document.getElementById("count");
    const counts = JSON.parse(localStorage.getItem("cart_count"));
    count.innerText = cart_count;
  }
}

function logout() {
  if (window.confirm("Are you sure to log out?")) {
    localStorage.removeItem("uniqueID");
    localStorage.removeItem("addressID");
    localStorage.removeItem("default_address");

    window.location.href = `${origin}/pages/homepage/frontpage.html`;
  }
}
document.addEventListener("DOMContentLoaded", () => {
  header();
  const logout_func = document.getElementById("logout");
  logout_func.addEventListener("click", logout);
});
