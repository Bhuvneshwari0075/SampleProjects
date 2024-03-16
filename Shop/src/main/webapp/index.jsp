<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
</head>
<link rel="stylesheet" href="body.css">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Madimi+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Madimi+One&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Madimi+One&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Madimi+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Madimi+One&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
<body>  
    <div class="navbar">

        <p id="logo" style="color: pink;">L<a style="color: white">u</a>x<a style="color: white">L</a>an<a style="color: white">e</a></p>
        <input type="text" name="Search" id="search" placeholder="Search LuxeLane.com">
            <button id="searchButton" ><i class="fa-solid fa-magnifying-glass" style="color:rgb(236, 236, 236);"></i></button>
            <div class="profile"></div>
            <div class="settings">
                <button>PROFILE</button><br>
                <button>SETTING</button><br>
                <button>CART</button><br>
                <button id="p1"></button>
            </div>
            <button class="cart">
                <i class="fa-solid fa-cart-shopping"></i>
            </button>
            <button class="orders">RETURNS & ORDERS</button>
        </input>
    </div> 
    <div class="sidebar">
        <div class="content"><h1>Categories</h1> 
        <ul>
            <li>Appliances</li>
            <li>Apps & Games</li>
            <li>Audible Audiobooks</li>
            <li>Baby</li>
            <li>Beauty</li>
            <li>Books</li>
            <li>Car & Motorbike</li>
            <li>Deals</li>
            <li>Electronics</li>
            <li>Furniture</li>
            <li>Gardens & Outdoors</li>
        </ul>    
    </div> 
    </div>
    
    <%@page import="com.shop.main.product.Product,com.shop.main.product.ProductDao,java.util.*,java.util.List"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
    <%  
	List<Product> list=ProductDao.getProductInfo();  
		request.setAttribute("list",list);  
	%>    
	<% int data = 1;  %> 
    <div class="main">
        <table>
        	
        	<c:forEach items="${list}" var="u">
        				
		        	<% if (data%6 == 0) { %>
		        		</tr>
			         	<tr>
			                <td>
			                    <button class="addToCartButton"><i class="fa-regular fa-square" id="u${u.getProductId() }" ></i></button>
			                    <p class="price">$ ${u.getPrice()}</p>
			                    <img src="${u.getImage() }" alt="" class="pic">
			                    
			                    <h2 class="itemName">${u.getProductTitle() }</h2>
			                    <p class="details">${u.getDescription()}</p>
			                    <button class="buyNowButton">BUY NOW</button>
			                    
			               	</td>
		             	
	      			<% } 
		        	else { %>
	         				<td>
			                    <button class="addToCartButton"><i class="fa-regular fa-square" id="u${u.getProductId() }" ></i></button>
			                    <p class="price">$ ${u.getPrice()}</p>
			                    <img src="${u.getImage() }" alt="" class="pic">
			                    
			                    <h2 class="itemName">${u.getProductTitle() }</h2>
			                    <p class="details">${u.getDescription()}</p>
			                    <button class="buyNowButton">BUY NOW</button>
			                    
			               	</td>
	      			<% } %>
            	<% data++; %> 
         	</c:forEach>   
        </table>
    </div>


</body>
<script>
    var currentId = "checkBox1";
    const buttons = document.getElementsByTagName("button");


    document.querySelector('.navbar .profile').addEventListener('mouseover', function() {
        document.querySelector('.navbar .settings').style.display = 'block';
    });

    document.querySelector('.navbar .profile').addEventListener('mouseout', function() {
        document.querySelector('.navbar .settings').style.display = 'none';
    });

    document.querySelector('.navbar .settings').addEventListener('mouseover', function() {
        document.querySelector('.navbar .settings').style.display = 'block';
    });

    document.querySelector('.navbar .settings').addEventListener('mouseout', function() {
        document.querySelector('.navbar .settings').style.display = 'none';
    });

    var what = true;
    if(what){
        document.getElementById("p1").innerHTML = "LOGOUT";
    }
    else{
        document.getElementById("p1").innerHTML = "SIGN IN";
    }

    const buttonPressed = e => {
        const buttonId = e.target.id;
        if (buttonId.startsWith("u")) {
            currentId = buttonId;
            checkBox();
        }
    }

    for (let button of buttons) {
        button.addEventListener("click", buttonPressed);
    }

    function checkBox() {
        const checkButton = document.getElementById(currentId);
        checkButton.classList.toggle('fa-square');
        checkButton.classList.toggle('fa-square-check');
    }
</script>
</html>